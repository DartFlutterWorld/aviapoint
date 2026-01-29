import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/blog/domain/repositories/blog_repository.dart';
import 'package:aviapoint/blog/presentation/bloc/blog_articles_bloc.dart';
import 'package:aviapoint/blog/presentation/bloc/blog_categories_bloc.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/universal_bottom_sheet.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:dart_quill_delta/dart_quill_delta.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/aircraft_type_selector_dialog.dart';
import 'package:aviapoint/injection_container.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

@RoutePage()
class CreateBlogArticleScreen extends StatefulWidget {
  const CreateBlogArticleScreen({super.key});

  @override
  State<CreateBlogArticleScreen> createState() => _CreateBlogArticleScreenState();
}

class _CreateBlogArticleScreenState extends State<CreateBlogArticleScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _excerptController = TextEditingController();
  late final QuillController _quillController;
  final FocusNode _quillFocusNode = FocusNode();

  final _coverImageUrlController = TextEditingController();
  final _aircraftModelController = TextEditingController();
  final _statusController = TextEditingController();

  int? _selectedCategoryId;
  int? _selectedAircraftModelId;
  List<int> _selectedTagIds = [];
  String _status = 'draft';
  File? _coverImage;
  Uint8List? _coverImageBytes; // Для веб-версии
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _quillController = QuillController.basic();
    _statusController.text = 'Черновик'; // Инициализируем начальное значение
    context.read<BlogCategoriesBloc>().add(const GetBlogCategoriesEvent());
  }

  @override
  void dispose() {
    _titleController.dispose();
    _excerptController.dispose();
    _quillController.dispose();
    _quillFocusNode.dispose();
    _coverImageUrlController.dispose();
    _aircraftModelController.dispose();
    _statusController.dispose();
    super.dispose();
  }

  Future<void> _showAircraftModelSelector(BuildContext context) async {
    final result = await showDialog<Map<String, dynamic>>(context: context, builder: (context) => AircraftTypeSelectorDialog(returnModelId: true));

    if (result != null) {
      setState(() {
        _selectedAircraftModelId = result['id'] as int?;
        _aircraftModelController.text = result['fullName'] as String? ?? '';
      });
    }
  }

  Future<void> _showStatusBottomSheet(BuildContext context) async {
    final selectedStatus = await showUniversalBottomSheet<String>(
      context: context,
      title: 'Выберите статус',
      child: Builder(
        builder: (bottomSheetContext) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Черновик', style: AppStyles.regular14s),
              trailing: _status == 'draft' ? Icon(Icons.check, color: Color(0xFF0A6EFA)) : null,
              onTap: () {
                Navigator.pop(bottomSheetContext, 'draft');
              },
            ),
            ListTile(
              title: Text('Опубликовано', style: AppStyles.regular14s),
              trailing: _status == 'published' ? Icon(Icons.check, color: Color(0xFF0A6EFA)) : null,
              onTap: () {
                Navigator.pop(bottomSheetContext, 'published');
              },
            ),
          ],
        ),
      ),
    );

    if (selectedStatus != null && mounted) {
      setState(() {
        _status = selectedStatus;
        _statusController.text = selectedStatus == 'draft' ? 'Черновик' : 'Опубликовано';
      });
    }
  }

  Future<void> _pickCoverImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 85, maxWidth: 1920, maxHeight: 1920);

      if (image != null) {
        if (kIsWeb) {
          // Для веб-версии сохраняем bytes
          final bytes = await image.readAsBytes();
          setState(() {
            _coverImageBytes = bytes;
            _coverImage = null;
            _coverImageUrlController.text = image.name; // Сохраняем имя файла
          });
        } else {
          // Для других платформ используем File
          setState(() {
            _coverImage = File(image.path);
            _coverImageBytes = null;
            _coverImageUrlController.text = image.path; // Временно, потом нужно загрузить на сервер
          });
        }
      }
    } catch (e) {
      // Игнорируем ошибки обработки событий указателя в веб-версии (известная проблема Flutter Web)
      if (kIsWeb && e.toString().contains('PointerDeviceKind.trackpad')) {
        // Это не критичная ошибка, просто предупреждение Flutter Web
        return;
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Не удалось выбрать изображение: ${e.toString()}'), backgroundColor: Colors.red));
      }
    }
  }

  Future<void> _uploadContentImage(File imageFile) async {
    try {
      final isLoadingBefore = _isLoading;
      setState(() => _isLoading = true);

      final repository = getIt<BlogRepository>();
      // Для новых статей используем временный endpoint (articleId = null)
      final result = await repository.uploadContentImage(imageFile, articleId: null);

      setState(() => _isLoading = isLoadingBefore);

      result.fold(
        (failure) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ошибка загрузки изображения: ${failure.message}'), backgroundColor: Colors.red));
          }
        },
        (imageUrl) {
          // Вставляем изображение в Quill Editor
          if (!mounted) return;

          // Преобразуем относительный путь в полный URL
          final fullImageUrl = imageUrl.startsWith('http://') || imageUrl.startsWith('https://') ? imageUrl : getImageUrl(imageUrl);

          // Вставляем изображение в Quill
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            try {
              // Получаем текущую позицию курсора или конец документа
              final currentSelection = _quillController.selection;
              final index = currentSelection.isValid ? currentSelection.baseOffset : _quillController.document.length;
              final length = currentSelection.isValid ? currentSelection.extentOffset - index : 0;
              final documentLength = _quillController.document.length;
              final safeIndex = index.clamp(0, documentLength);
              final safeLength = (index + length).clamp(0, documentLength) - safeIndex;

              // Вставляем изображение как Map в Delta (правильный формат для flutter_quill)
              final delta = Delta()
                ..retain(safeIndex)
                ..delete(safeLength)
                ..insert({'image': fullImageUrl});

              // Вычисляем новую позицию курсора после вставки изображения
              final newPosition = safeIndex + 1;
              final newSelection = TextSelection.collapsed(offset: newPosition);
              _quillController.compose(delta, newSelection, ChangeSource.local);

              // Восстанавливаем фокус
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!mounted) return;
                _quillFocusNode.requestFocus();
              });
            } catch (e) {
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ошибка вставки изображения: ${e.toString()}'), backgroundColor: Colors.red));
              }
            }
          });
        },
      );
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ошибка: ${e.toString()}'), backgroundColor: Colors.red));
      }
    }
  }

  Future<void> _pickContentImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      // Не используем imageQuality, чтобы сохранить исходный формат (PNG останется PNG, JPEG - JPEG)
      final XFile? image = await picker.pickImage(source: ImageSource.gallery, maxWidth: 1920, maxHeight: 1920);

      if (image != null) {
        // Для веб-версии используем XFile напрямую, для других платформ конвертируем в File
        if (kIsWeb) {
          await _uploadContentImageFromXFile(image);
        } else {
          await _uploadContentImage(File(image.path));
        }
      }
    } catch (e) {
      // Игнорируем ошибки обработки событий указателя в веб-версии (известная проблема Flutter Web)
      if (kIsWeb && e.toString().contains('PointerDeviceKind.trackpad')) {
        // Это не критичная ошибка, просто предупреждение Flutter Web
        // Проверяем, было ли изображение выбрано, несмотря на ошибку
        return;
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Не удалось выбрать изображение: ${e.toString()}'), backgroundColor: Colors.red));
      }
    }
  }

  Future<void> _uploadContentImageFromXFile(XFile imageFile) async {
    try {
      final isLoadingBefore = _isLoading;
      setState(() => _isLoading = true);

      final repository = getIt<BlogRepository>();
      // Для веб-версии читаем bytes напрямую из XFile
      final bytes = await imageFile.readAsBytes();
      final fileName = imageFile.name;

      // Для новых статей используем временный endpoint (articleId = null)
      final result = await repository.uploadContentImageBytes(bytes, fileName: fileName, articleId: null);

      setState(() => _isLoading = isLoadingBefore);

      result.fold(
        (failure) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ошибка загрузки изображения: ${failure.message}'), backgroundColor: Colors.red));
          }
        },
        (imageUrl) {
          // Вставляем изображение в Quill Editor
          if (!mounted) return;

          // Преобразуем относительный путь в полный URL
          final fullImageUrl = imageUrl.startsWith('http://') || imageUrl.startsWith('https://') ? imageUrl : getImageUrl(imageUrl);

          // Вставляем изображение в Quill
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            try {
              // Получаем текущую позицию курсора или конец документа
              final currentSelection = _quillController.selection;
              final index = currentSelection.isValid ? currentSelection.baseOffset : _quillController.document.length;
              final length = currentSelection.isValid ? currentSelection.extentOffset - index : 0;
              final documentLength = _quillController.document.length;
              final safeIndex = index.clamp(0, documentLength);
              final safeLength = (index + length).clamp(0, documentLength) - safeIndex;

              // Вставляем изображение как Map в Delta (правильный формат для flutter_quill)
              final delta = Delta()
                ..retain(safeIndex)
                ..delete(safeLength)
                ..insert({'image': fullImageUrl});

              // Вычисляем новую позицию курсора после вставки изображения
              final newPosition = safeIndex + 1;
              final newSelection = TextSelection.collapsed(offset: newPosition);
              _quillController.compose(delta, newSelection, ChangeSource.local);

              // Восстанавливаем фокус
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!mounted) return;
                _quillFocusNode.requestFocus();
              });
            } catch (e) {
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ошибка вставки изображения: ${e.toString()}'), backgroundColor: Colors.red));
              }
            }
          });
        },
      );
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ошибка при загрузке изображения: ${e.toString()}'), backgroundColor: Colors.red));
      }
    }
  }

  /// Нормализует URL изображений перед сохранением: преобразует абсолютные URL в относительные пути
  /// чтобы статьи работали в любом окружении (dev/prod)
  List<dynamic> _normalizeImageUrlsForSave(List<dynamic> operations) {
    return operations.map((op) {
      if (op is Map<String, dynamic>) {
        final insert = op['insert'];

        // Если это изображение
        if (insert is Map<String, dynamic> && insert.containsKey('image')) {
          final imageUrl = insert['image'] as String;

          // Извлекаем относительный путь из URL
          String relativePath = imageUrl;

          // Если это абсолютный URL, извлекаем путь
          if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
            try {
              final uri = Uri.parse(imageUrl);
              // Убираем /public/ если есть (production)
              var path = uri.path;
              if (path.startsWith('/public/')) {
                path = path.substring('/public/'.length);
              } else if (path.startsWith('/')) {
                path = path.substring(1);
              }
              relativePath = path;
              debugPrint('🔄 Нормализация URL изображения: $imageUrl -> $relativePath');
            } catch (e) {
              debugPrint('⚠️ Ошибка парсинга URL изображения: $imageUrl, $e');
              // Если не удалось распарсить, оставляем как есть
            }
          }

          return {
            ...op,
            'insert': {'image': relativePath},
          };
        }
      }
      return op;
    }).toList();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final title = _titleController.text.trim();

    // Сохраняем как JSON Delta (официальный способ Quill)
    // Нормализуем URL изображений: преобразуем абсолютные URL в относительные пути
    // чтобы статьи работали в любом окружении (dev/prod)
    final deltaJson = _quillController.document.toDelta().toJson();
    final normalizedDelta = _normalizeImageUrlsForSave(deltaJson);
    final String content = jsonEncode(normalizedDelta);
    debugPrint('📝 Сохраняем JSON Delta: $content');

    final excerpt = _excerptController.text.trim();

    // Проверка обязательных полей
    if (title.isEmpty || content.trim().isEmpty || content == '[]') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Заполните обязательные поля'), backgroundColor: Colors.red));
      return;
    }

    // Проверка категории
    if (_selectedCategoryId == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Выберите категорию'), backgroundColor: Colors.red));
      return;
    }

    // Проверка краткого описания
    if (excerpt.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Введите краткое описание'), backgroundColor: Colors.red));
      return;
    }

    // Определяем, что использовать: файл или bytes
    String? coverImageUrl;
    File? coverImageFile = _coverImage;
    Uint8List? coverImageBytes = _coverImageBytes;
    String? coverImageFileName;

    // Проверка обложки
    if (coverImageFile == null && coverImageBytes == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Выберите изображение для обложки'), backgroundColor: Colors.red));
      return;
    }

    // Для веб-версии, если есть bytes, получаем имя файла из контроллера (там хранится имя выбранного файла)
    if (kIsWeb && coverImageBytes != null) {
      final fileNameFromController = _coverImageUrlController.text.trim();
      coverImageFileName = fileNameFromController.isNotEmpty ? fileNameFromController : 'cover_image.jpg';
    }

    setState(() => _isLoading = true);

    context.read<BlogArticlesBloc>().add(
      CreateBlogArticleEvent(
        categoryId: _selectedCategoryId,
        aircraftModelId: _selectedAircraftModelId,
        title: title,
        excerpt: excerpt,
        content: content,
        coverImageUrl: coverImageUrl,
        coverImageFile: coverImageFile,
        coverImageBytes: coverImageBytes,
        coverImageFileName: coverImageFileName,
        status: _status,
        tagIds: _selectedTagIds.isEmpty ? null : _selectedTagIds,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;

    if (!isAuthenticated) {
      return Scaffold(
        appBar: const CustomAppBar(title: 'Сделать запись', withBack: true),
        backgroundColor: AppColors.background,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock_outline, size: 64.0, color: Color(0xFF9CA5AF)),
                SizedBox(height: 16),
                Text('Требуется авторизация', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
                SizedBox(height: 8),
                Text(
                  'Для создания статьи необходимо войти в систему',
                  style: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return BlocListener<BlogArticlesBloc, BlogArticlesState>(
      listener: (context, state) {
        state.maybeWhen(
          created: (article) {
            setState(() => _isLoading = false);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Статья успешно создана'), backgroundColor: Colors.green, duration: Duration(seconds: 2)));

            // Обновляем список статей перед возвратом
            context.read<BlogArticlesBloc>().add(const GetBlogArticlesEvent(status: 'published'));

            // Возвращаемся назад к списку статей
            AutoRouter.of(context).pop();

            // Переходим к созданной статье после обновления списка
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) {
                AutoRouter.of(context).push(BlogArticleDetailRoute(articleId: article.id));
              }
            });
          },
          updated: (article) {
            setState(() => _isLoading = false);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Статья успешно обновлена'), backgroundColor: Colors.green, duration: Duration(seconds: 2)));
            // Обновляем список статей перед возвратом
            context.read<BlogArticlesBloc>().add(const GetBlogArticlesEvent(status: 'published'));
            AutoRouter.of(context).pop();
          },
          error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) {
            setState(() => _isLoading = false);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorForUser), backgroundColor: Colors.red, duration: const Duration(seconds: 3)));
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Сделать запись', withBack: true),
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Обложка
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Обложка статьи *', style: AppStyles.regular14s.copyWith(color: Color(0xFF374151))),
                    SizedBox(height: 12),
                    OutlinedButton.icon(
                      onPressed: _pickCoverImage,
                      icon: Icon(Icons.image, color: Color(0xFF0A6EFA)),
                      label: Text('Выберите изображение для статьи', style: AppStyles.regular14s.copyWith(color: Color(0xFF0A6EFA))),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        side: BorderSide(color: Color(0xFF0A6EFA)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ],
                ),
                if (_coverImage != null || _coverImageBytes != null) ...[
                  SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: kIsWeb && _coverImageBytes != null
                        ? Image.memory(_coverImageBytes!, fit: BoxFit.fill, width: double.infinity)
                        : _coverImage != null
                        ? Image.file(_coverImage!, fit: BoxFit.fill, width: double.infinity)
                        : SizedBox.shrink(),
                  ),
                ],
                SizedBox(height: 16),

                // Заголовок
                TextFormField(
                  controller: _titleController,
                  style: AppStyles.regular14s,
                  decoration: InputDecoration(
                    labelText: 'Заголовок *',
                    labelStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                    hintText: 'Введите заголовок статьи',
                    hintStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFF0A6EFA), width: 2),
                    ),
                  ),
                  validator: (value) => value?.trim().isEmpty ?? true ? 'Введите заголовок' : null,
                ),
                SizedBox(height: 16),

                // Категория
                BlocBuilder<BlogCategoriesBloc, BlogCategoriesState>(
                  builder: (context, state) => state.maybeWhen(
                    success: (categories) => DropdownButtonFormField2<int>(
                      value: _selectedCategoryId,
                      isExpanded: true,
                      decoration: InputDecoration(
                        labelText: 'Категория *',
                        labelStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                        hintText: 'Выберите категорию',
                        hintStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Color(0xFF0A6EFA), width: 2),
                        ),
                      ),
                      items: categories.map((category) {
                        return DropdownMenuItem<int>(
                          value: category.id,
                          child: Text(category.name, style: AppStyles.regular14s),
                        );
                      }).toList(),
                      onChanged: (value) => setState(() => _selectedCategoryId = value),
                      validator: (value) => value == null ? 'Выберите категорию' : null,
                    ),
                    orElse: () => const SizedBox(),
                  ),
                ),
                SizedBox(height: 16),

                // Самолёт
                InkWell(
                  onTap: () => _showAircraftModelSelector(context),
                  child: TextFormField(
                    controller: _aircraftModelController,
                    enabled: false,
                    style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
                    decoration: InputDecoration(
                      labelText: 'Самолёт',
                      labelStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                      hintText: 'Нажмите для выбора самолёта',
                      hintStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xFF0A6EFA), width: 2),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                      ),
                      suffixIcon: Icon(Icons.arrow_drop_down, color: Color(0xFF9CA5AF)),
                    ),
                  ),
                ),
                if (_selectedAircraftModelId != null) ...[
                  SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.clear, size: 18.0, color: Color(0xFF9CA5AF)),
                        onPressed: () {
                          setState(() {
                            _selectedAircraftModelId = null;
                            _aircraftModelController.clear();
                          });
                        },
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                      ),
                      SizedBox(width: 8),
                      Text('Очистить выбор', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                    ],
                  ),
                ],
                SizedBox(height: 16),

                // Краткое описание
                TextFormField(
                  controller: _excerptController,
                  maxLines: 2,
                  style: AppStyles.regular14s,
                  decoration: InputDecoration(
                    labelText: 'Краткое описание *',
                    labelStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                    hintText: 'Краткое описание для превью',
                    hintStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFF0A6EFA), width: 2),
                    ),
                  ),
                  validator: (value) => value?.trim().isEmpty ?? true ? 'Введите краткое описание' : null,
                ),
                SizedBox(height: 16),

                // Контент (HTML Editor)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Содержание статьи *', style: AppStyles.regular14s.copyWith(color: Color(0xFF374151))),
                    SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFFD9E6F8)),
                      ),
                      child: Column(
                        children: [
                          Transform.scale(
                            scale: 1,
                            alignment: Alignment.topLeft,
                            child: QuillSimpleToolbar(controller: _quillController, config: const QuillSimpleToolbarConfig(showClipboardCut: true)),
                          ),
                          Transform.translate(offset: Offset(0, kIsWeb ? 0 : -4), child: Divider(height: 1)),
                          Container(
                            height: 300,
                            padding: EdgeInsets.all(12),
                            child: QuillEditor.basic(
                              controller: _quillController,
                              config: QuillEditorConfig(placeholder: 'Введите текст статьи...', embedBuilders: FlutterQuillEmbeds.editorBuilders()),
                              focusNode: _quillFocusNode,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Кнопка для вставки изображения
                    SizedBox(height: 12),
                    OutlinedButton.icon(
                      onPressed: _isLoading ? null : _pickContentImage,
                      icon: Icon(Icons.image, color: Color(0xFF0A6EFA)),
                      label: Text('Вставить изображение в тексты', style: AppStyles.regular14s.copyWith(color: Color(0xFF0A6EFA))),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Color(0xFF0A6EFA)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Статус
                InkWell(
                  onTap: () => _showStatusBottomSheet(context),
                  child: TextFormField(
                    controller: _statusController,
                    enabled: false,
                    style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
                    decoration: InputDecoration(
                      labelText: 'Статус',
                      labelStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                      hintText: 'Нажмите для выбора статуса',
                      hintStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xFF0A6EFA), width: 2),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                      ),
                      suffixIcon: Icon(Icons.arrow_drop_down, color: Color(0xFF9CA5AF)),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Кнопка создания
                CustomButton(
                  verticalPadding: 14,
                  backgroundColor: Color(0xFF7A0FD9),
                  title: _isLoading ? 'Создание...' : 'Сделать запись',
                  textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                  borderColor: Color(0xFF7A0FD9),
                  borderRadius: 46,
                  onPressed: _isLoading ? null : _submit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
