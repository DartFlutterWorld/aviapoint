import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/blog/domain/repositories/blog_repository.dart';
import 'package:aviapoint/blog/presentation/bloc/blog_article_detail_bloc.dart';
import 'package:aviapoint/blog/presentation/bloc/blog_articles_bloc.dart';
import 'package:aviapoint/blog/presentation/bloc/blog_categories_bloc.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:dart_quill_delta/dart_quill_delta.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/aircraft_type_selector_dialog.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/on_the_way/data/models/aircraft_model_dto.dart';
import 'dart:io';
import 'dart:typed_data';

@RoutePage()
class EditBlogArticleScreen extends StatefulWidget {
  final int articleId;

  const EditBlogArticleScreen({super.key, @PathParam('id') required this.articleId});

  @override
  State<EditBlogArticleScreen> createState() => _EditBlogArticleScreenState();
}

class _EditBlogArticleScreenState extends State<EditBlogArticleScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _excerptController = TextEditingController();
  late QuillController _quillController; // Убрали final, чтобы можно было пересоздавать
  final FocusNode _quillFocusNode = FocusNode();
  final _coverImageUrlController = TextEditingController();
  final _aircraftModelController = TextEditingController();

  int? _selectedCategoryId;
  int? _selectedAircraftModelId;
  List<int> _selectedTagIds = [];
  String? _status;
  File? _coverImage;
  Uint8List? _coverImageBytes; // Для веб-версии
  bool _isLoading = false;
  bool _isInitialized = false;
  Document? _initialDocument;
  int _quillControllerKey = 0; // Ключ для пересоздания QuillEditor

  @override
  void initState() {
    super.initState();
    // Инициализируем контроллер с пустым документом, документ будет установлен позже
    _quillController = QuillController.basic();
    context.read<BlogCategoriesBloc>().add(const GetBlogCategoriesEvent());
    context.read<BlogArticleDetailBloc>().add(GetBlogArticleByIdEvent(id: widget.articleId));
  }

  @override
  void dispose() {
    _titleController.dispose();
    _excerptController.dispose();
    _quillController.dispose();
    _quillFocusNode.dispose();
    _coverImageUrlController.dispose();
    _aircraftModelController.dispose();
    super.dispose();
  }

  void _initializeFromArticle() {
    if (_isInitialized || !mounted) return;

    final state = context.read<BlogArticleDetailBloc>().state;
    state.maybeWhen(
      success: (article) {
        if (!mounted) return;

        // Устанавливаем значения в контроллеры
        _titleController.text = article.title;
        _excerptController.text = article.excerpt ?? '';
        _coverImageUrlController.text = article.coverImageUrl ?? '';
        _selectedCategoryId = article.categoryId;
        _selectedAircraftModelId = article.aircraftModelId;
        _status = article.status;
        _selectedTagIds = article.tags?.map((tag) => tag.id).toList() ?? [];
        if (article.aircraftModel != null) {
          _aircraftModelController.text = article.aircraftModel!.getFullName();
        }

        // Загружаем содержимое статьи в Quill Document (JSON Delta формат)
        if (article.content.isNotEmpty) {
          Document document;

          try {
            // Загружаем как JSON Delta
            final jsonContent = jsonDecode(article.content);

            // Нормализуем URL изображений: преобразуем относительные пути в абсолютные URL для отображения в редакторе
            // В базе данных хранятся относительные пути (благодаря _normalizeImageUrlsForSave), а для редактора нужны абсолютные URL
            final normalizedContent = _normalizeImageUrlsForDisplay(jsonContent);

            document = Document.fromJson(normalizedContent);
            debugPrint('✅ Загружен JSON Delta, длина: ${document.length}');
          } catch (e, stackTrace) {
            debugPrint('❌ Ошибка загрузки JSON Delta: $e');
            debugPrint('Stack trace: $stackTrace');
            // Если ошибка - создаем пустой документ
            document = Document();
          }

          _initialDocument = document;
          debugPrint('📝 Содержимое документа: ${document.toDelta().toJson()}');

          // Устанавливаем документ в контроллер
          // Используем addPostFrameCallback для гарантии, что виджет уже построен
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted || _initialDocument == null) {
              debugPrint('⚠️ Не удалось установить документ: mounted=$mounted, document=${_initialDocument != null}');
              return;
            }
            try {
              debugPrint('🔄 Устанавливаю документ в QuillController, длина: ${_initialDocument!.length}');

              // Обновляем документ напрямую
              _quillController.document = _initialDocument!;

              // Увеличиваем ключ для пересоздания QuillEditor
              _quillControllerKey++;

              debugPrint('✅ Документ установлен, ключ: $_quillControllerKey');

              // Принудительно обновляем UI
              if (mounted) {
                setState(() {
                  debugPrint('🔄 setState вызван для обновления QuillEditor');
                });
              }
            } catch (e, stackTrace) {
              debugPrint('❌ Ошибка при установке документа в Quill: $e');
              debugPrint('Stack trace: $stackTrace');
            }
          });
        } else {
          debugPrint('⚠️ Контент статьи пуст');
        }

        // Обновляем UI
        if (mounted) {
          setState(() {
            _isInitialized = true;
          });
        }
      },
      orElse: () {},
    );
  }

  Future<void> _showAircraftModelSelector(BuildContext context) async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => AircraftTypeSelectorDialog(initialValue: _aircraftModelController.text, returnModelId: true),
    );

    if (result != null) {
      setState(() {
        _selectedAircraftModelId = result['id'] as int?;
        _aircraftModelController.text = result['fullName'] as String? ?? '';
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
          if (mounted) {
            setState(() {
              _coverImageBytes = bytes;
              _coverImage = null;
              _coverImageUrlController.text = image.name; // Сохраняем имя файла
            });
          }
        } else {
          // Для других платформ используем File
          if (mounted) {
            setState(() {
              _coverImage = File(image.path);
              _coverImageBytes = null;
              _coverImageUrlController.text = image.path;
            });
          }
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
      if (mounted) {
        setState(() => _isLoading = true);
      }

      final repository = getIt<BlogRepository>();
      // Для редактирования используем articleId статьи
      final result = await repository.uploadContentImage(imageFile, articleId: widget.articleId);

      if (mounted) {
        setState(() => _isLoading = isLoadingBefore);
      }

      result.fold(
        (failure) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ошибка загрузки изображения: ${failure.message}'), backgroundColor: Colors.red));
          }
        },
        (imageUrl) {
          // Вставляем изображение в Quill редактор только если виджет еще прикреплен
          if (!mounted) return;

          // Преобразуем относительный путь в полный URL
          // Бэкенд возвращает относительный путь типа "blog_articles/1/images/..."
          // Нужно преобразовать его в полный URL для загрузки изображения
          final fullImageUrl = imageUrl.startsWith('http://') || imageUrl.startsWith('https://') ? imageUrl : getImageUrl(imageUrl);

          // Используем addPostFrameCallback для безопасной вставки после завершения текущего кадра
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;

            try {
              // Сохраняем текущую позицию курсора или используем конец документа
              final currentSelection = _quillController.selection;
              final index = currentSelection.isValid ? currentSelection.baseOffset : _quillController.document.length;
              final length = currentSelection.isValid ? currentSelection.extentOffset - index : 0;

              // Проверяем, что позиция не выходит за границы документа
              final documentLength = _quillController.document.length;
              final safeIndex = index.clamp(0, documentLength);
              final safeLength = (index + length).clamp(0, documentLength) - safeIndex;

              // Вставляем изображение как Map в Delta (правильный формат для flutter_quill)
              final delta = Delta()
                ..retain(safeIndex)
                ..delete(safeLength)
                ..insert({'image': fullImageUrl});

              // Вычисляем новую позицию курсора после вставки изображения
              // Изображение занимает 1 позицию
              final newPosition = safeIndex + 1;
              final newSelection = TextSelection.collapsed(offset: newPosition);

              // Применяем изменения с новой селекцией
              _quillController.compose(delta, newSelection, ChangeSource.local);

              // Восстанавливаем фокус после вставки изображения
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!mounted) return;
                _quillFocusNode.requestFocus();
              });
            } catch (e) {
              // Игнорируем ошибки вставки, если виджет уже удален
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
      if (mounted) {
        setState(() => _isLoading = true);
      }

      final repository = getIt<BlogRepository>();
      // Для веб-версии читаем bytes напрямую из XFile
      final bytes = await imageFile.readAsBytes();
      final fileName = imageFile.name;

      // Для редактирования используем articleId статьи
      final result = await repository.uploadContentImageBytes(bytes, fileName: fileName, articleId: widget.articleId);

      if (mounted) {
        setState(() => _isLoading = isLoadingBefore);
      }

      result.fold(
        (failure) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ошибка загрузки изображения: ${failure.message}'), backgroundColor: Colors.red));
          }
        },
        (imageUrl) {
          // Вставляем изображение в Quill редактор только если виджет еще прикреплен
          if (!mounted) return;

          // Преобразуем относительный путь в полный URL
          // Бэкенд возвращает относительный путь типа "blog_articles/1/images/..."
          // Нужно преобразовать его в полный URL для загрузки изображения
          final fullImageUrl = imageUrl.startsWith('http://') || imageUrl.startsWith('https://') ? imageUrl : getImageUrl(imageUrl);

          // Используем addPostFrameCallback для безопасной вставки после завершения текущего кадра
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;

            try {
              // Сохраняем текущую позицию курсора или используем конец документа
              final currentSelection = _quillController.selection;
              final index = currentSelection.isValid ? currentSelection.baseOffset : _quillController.document.length;
              final length = currentSelection.isValid ? currentSelection.extentOffset - index : 0;

              // Проверяем, что позиция не выходит за границы документа
              final documentLength = _quillController.document.length;
              final safeIndex = index.clamp(0, documentLength);
              final safeLength = (index + length).clamp(0, documentLength) - safeIndex;

              // Вставляем изображение как Map в Delta (правильный формат для flutter_quill)
              final delta = Delta()
                ..retain(safeIndex)
                ..delete(safeLength)
                ..insert({'image': fullImageUrl});

              // Вычисляем новую позицию курсора после вставки изображения
              // Изображение занимает 1 позицию
              final newPosition = safeIndex + 1;
              final newSelection = TextSelection.collapsed(offset: newPosition);

              // Применяем изменения с новой селекцией
              _quillController.compose(delta, newSelection, ChangeSource.local);

              // Восстанавливаем фокус после вставки изображения
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

  void _showDeleteArticleConfirmation(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.red, size: 28),
            SizedBox(width: 12.w),
            Expanded(
              child: Text('Удалить статью?', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Вы уверены, что хотите удалить эту статью? Это действие нельзя отменить.', style: AppStyles.regular14s.copyWith(color: Color(0xFF374151))),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Color(0xFFFFF3CD),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Color(0xFFFFC107)),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Color(0xFFFF9800), size: 20),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text('Все данные статьи будут безвозвратно удалены.', style: AppStyles.regular12s.copyWith(color: Color(0xFF856404))),
                  ),
                ],
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text('Отмена', style: AppStyles.regular14s.copyWith(color: Color(0xFF6B7280))),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              _deleteArticle();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            ),
            child: Text('Удалить', style: AppStyles.bold14s.copyWith(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _deleteArticle() {
    // Показываем диалог загрузки
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black54,
      builder: (dialogContext) => const Center(child: CircularProgressIndicator()),
    );

    // Инициируем удаление статьи
    context.read<BlogArticlesBloc>().add(DeleteBlogArticleEvent(id: widget.articleId));
  }

  /// Нормализует URL изображений для отображения в редакторе: преобразует относительные пути в абсолютные URL
  /// В базе данных хранятся относительные пути, а для редактора нужны абсолютные URL
  List<dynamic> _normalizeImageUrlsForDisplay(List<dynamic> operations) {
    return operations.map((op) {
      if (op is Map<String, dynamic>) {
        final insert = op['insert'];

        // Если это изображение
        if (insert is Map<String, dynamic> && insert.containsKey('image')) {
          final imageUrl = insert['image'] as String;

          // Преобразуем относительный путь в полный URL для текущего окружения
          // Если это уже абсолютный URL, оставляем как есть
          final fullImageUrl = imageUrl.startsWith('http://') || imageUrl.startsWith('https://') ? imageUrl : getImageUrl(imageUrl);

          return {
            ...op,
            'insert': {'image': fullImageUrl},
          };
        }
      }
      return op;
    }).toList();
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

    if (title.isEmpty || content.trim().isEmpty || content == '[]') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Заполните обязательные поля'), backgroundColor: Colors.red));
      return;
    }

    setState(() => _isLoading = true);

    // Определяем, что использовать: файл или bytes
    String? coverImageUrl;
    // Если есть выбранный файл, используем его (coverImageFile будет передан)
    // Если файл не выбран, оставляем coverImageUrl как null (старое изображение останется)

    // Для веб-версии, если есть bytes, получаем имя файла из контроллера
    String? coverImageFileName;
    if (kIsWeb && _coverImageBytes != null) {
      final fileNameFromController = _coverImageUrlController.text.trim();
      coverImageFileName = fileNameFromController.isNotEmpty ? fileNameFromController : 'cover_image.jpg';
    }

    context.read<BlogArticlesBloc>().add(
      UpdateBlogArticleEvent(
        id: widget.articleId,
        categoryId: _selectedCategoryId,
        aircraftModelId: _selectedAircraftModelId,
        title: title,
        excerpt: _excerptController.text.trim().isEmpty ? null : _excerptController.text.trim(),
        content: content,
        coverImageUrl: coverImageUrl,
        coverImageFile: _coverImage,
        coverImageBytes: _coverImageBytes,
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
        appBar: const CustomAppBar(title: 'Редактировать статью', withBack: true),
        backgroundColor: AppColors.background,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock_outline, size: 64, color: Color(0xFF9CA5AF)),
                SizedBox(height: 16.h),
                Text('Требуется авторизация', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
                SizedBox(height: 8.h),
                Text(
                  'Для редактирования статьи необходимо войти в систему',
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
          updated: (article) {
            setState(() => _isLoading = false);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Статья успешно обновлена'), backgroundColor: Colors.green, duration: Duration(seconds: 2)));
            AutoRouter.of(context).pop();
            // Обновляем детальную страницу
            context.read<BlogArticleDetailBloc>().add(GetBlogArticleByIdEvent(id: widget.articleId));
          },
          deleted: () {
            setState(() => _isLoading = false);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Статья успешно удалена'), backgroundColor: Colors.green, duration: Duration(seconds: 2)));
            // Закрываем диалог загрузки, если он открыт
            Navigator.of(context, rootNavigator: true).pop();
            // Обновляем список статей перед возвратом
            context.read<BlogArticlesBloc>().add(const GetBlogArticlesEvent(status: 'published'));
            // Возвращаемся к списку статей (BlogRoute)
            // Используем popUntil чтобы вернуться к BlogRoute
            if (mounted) {
              AutoRouter.of(context).popUntil((route) {
                final routeName = route.settings.name;
                return routeName == BlogRoute.name || routeName == BlogNavigationRoute.name;
              });
            }
          },
          error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) {
            setState(() => _isLoading = false);
            // Закрываем диалог загрузки, если он открыт
            Navigator.of(context, rootNavigator: true).pop();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorForUser), backgroundColor: Colors.red, duration: const Duration(seconds: 3)));
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<BlogArticleDetailBloc, BlogArticleDetailState>(
        builder: (context, detailState) {
          detailState.maybeWhen(
            success: (article) {
              // Инициализируем только один раз, когда виджет еще смонтирован
              if (!_isInitialized && mounted) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    _initializeFromArticle();
                  }
                });
              }
            },
            orElse: () {},
          );

          return Scaffold(
            appBar: CustomAppBar(
              title: 'Редактировать статью',
              withBack: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.delete_outline, color: Colors.red),
                  onPressed: _isLoading ? null : () => _showDeleteArticleConfirmation(context),
                  tooltip: 'Удалить статью',
                ),
              ],
            ),
            backgroundColor: AppColors.background,
            body: detailState.maybeWhen(
              loading: () => LoadingCustom(paddingTop: MediaQuery.of(context).size.height / 4),
              error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => ErrorCustom(
                textError: errorForUser,
                repeat: () {
                  context.read<BlogArticleDetailBloc>().add(GetBlogArticleByIdEvent(id: widget.articleId));
                },
              ),
              success: (article) => SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Заголовок
                      TextFormField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelText: 'Заголовок *',
                          hintText: 'Введите заголовок статьи',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Color(0xFF0A6EFA), width: 2),
                          ),
                        ),
                        validator: (value) => value?.trim().isEmpty ?? true ? 'Введите заголовок' : null,
                      ),
                      SizedBox(height: 16.h),

                      // Категория
                      BlocBuilder<BlogCategoriesBloc, BlogCategoriesState>(
                        builder: (context, state) => state.maybeWhen(
                          success: (categories) => LayoutBuilder(
                            builder: (context, constraints) => DropdownButtonFormField2<int>(
                              value: _selectedCategoryId,
                              isExpanded: true,
                              decoration: InputDecoration(
                                labelText: 'Категория',
                                hintText: 'Выберите категорию',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide(color: Color(0xFF0A6EFA), width: 2),
                                ),
                              ),
                              items: categories.map((category) {
                                return DropdownMenuItem<int>(value: category.id, child: Text(category.name));
                              }).toList(),
                              onChanged: (value) => setState(() => _selectedCategoryId = value),
                            ),
                          ),
                          orElse: () => const SizedBox(),
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // Самолёт
                      InkWell(
                        onTap: () => _showAircraftModelSelector(context),
                        child: TextFormField(
                          controller: _aircraftModelController,
                          enabled: false,
                          decoration: InputDecoration(
                            labelText: 'Самолёт',
                            hintText: 'Нажмите для выбора самолёта',
                            hintStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: BorderSide(color: Color(0xFF0A6EFA), width: 2),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                            ),
                            suffixIcon: Icon(Icons.arrow_drop_down, color: Color(0xFF9CA5AF)),
                          ),
                        ),
                      ),
                      if (_selectedAircraftModelId != null) ...[
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.clear, size: 18, color: Color(0xFF9CA5AF)),
                              onPressed: () {
                                setState(() {
                                  _selectedAircraftModelId = null;
                                  _aircraftModelController.clear();
                                });
                              },
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                            ),
                            SizedBox(width: 8.w),
                            Text('Очистить выбор', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                          ],
                        ),
                      ],
                      SizedBox(height: 16.h),

                      // Краткое описание
                      TextFormField(
                        controller: _excerptController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: 'Краткое описание',
                          hintText: 'Краткое описание для превью',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Color(0xFF0A6EFA), width: 2),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // Контент (Quill Editor)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Содержание статьи *', style: AppStyles.regular14s.copyWith(color: Color(0xFF374151))),
                          SizedBox(height: 8.h),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(color: Color(0xFFD9E6F8)),
                            ),
                            child: Column(
                              children: [
                                Transform.scale(
                                  scale: kIsWeb ? 1.0 : 0.85,
                                  alignment: Alignment.topLeft,
                                  child: QuillSimpleToolbar(controller: _quillController, config: const QuillSimpleToolbarConfig()),
                                ),
                                Transform.translate(offset: Offset(0, kIsWeb ? 0 : -4), child: Divider(height: 1)),
                                Container(
                                  key: ValueKey('quill_editor_$_quillControllerKey'), // Ключ для пересоздания виджета
                                  height: 300.h,
                                  padding: EdgeInsets.all(12.w),
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
                          SizedBox(height: 8.h),
                          OutlinedButton.icon(
                            onPressed: _isLoading ? null : _pickContentImage,
                            icon: Icon(Icons.image, size: 18.sp),
                            label: Text('Вставить изображение', style: AppStyles.regular12s),
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                              side: BorderSide(color: Color(0xFF0A6EFA)),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),

                      // Обложка
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Обложка статьи', style: AppStyles.regular14s.copyWith(color: Color(0xFF374151))),
                          SizedBox(height: 8.h),
                          OutlinedButton.icon(
                            onPressed: _pickCoverImage,
                            icon: Icon(Icons.image, color: Color(0xFF0A6EFA)),
                            label: Text('Выберите изображение для статьи', style: AppStyles.regular14s.copyWith(color: Color(0xFF0A6EFA))),
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                              side: BorderSide(color: Color(0xFF0A6EFA)),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                            ),
                          ),
                        ],
                      ),
                      if (_coverImage != null || _coverImageBytes != null) ...[
                        SizedBox(height: 8.h),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: kIsWeb && _coverImageBytes != null
                              ? Image.memory(_coverImageBytes!, height: 150.h, fit: BoxFit.cover)
                              : _coverImage != null
                              ? Image.file(_coverImage!, height: 150.h, fit: BoxFit.cover)
                              : SizedBox.shrink(),
                        ),
                      ] else if (article.coverImageUrl != null && article.coverImageUrl!.isNotEmpty) ...[
                        SizedBox(height: 8.h),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: CachedNetworkImage(imageUrl: getImageUrl(article.coverImageUrl!), height: 150.h, fit: BoxFit.cover),
                        ),
                      ],
                      SizedBox(height: 16.h),

                      // Статус
                      LayoutBuilder(
                        builder: (context, constraints) => DropdownButtonFormField2<String>(
                          value: _status ?? 'draft',
                          isExpanded: true,
                          decoration: InputDecoration(
                            labelText: 'Статус',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: BorderSide(color: Color(0xFFD9E6F8)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: BorderSide(color: Color(0xFF0A6EFA), width: 2),
                            ),
                          ),
                          items: const [
                            DropdownMenuItem(value: 'draft', child: Text('Черновик')),
                            DropdownMenuItem(value: 'published', child: Text('Опубликовано')),
                            DropdownMenuItem(value: 'archived', child: Text('Архив')),
                          ],
                          onChanged: (value) => setState(() => _status = value),
                        ),
                      ),
                      SizedBox(height: 24.h),

                      // Кнопка сохранения
                      CustomButton(
                        verticalPadding: 14,
                        backgroundColor: Color(0xFF7A0FD9),
                        title: _isLoading ? 'Сохранение...' : 'Сохранить изменения',
                        textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                        borderColor: Color(0xFF7A0FD9),
                        borderRadius: 46,
                        onPressed: _isLoading ? null : _submit,
                      ),
                    ],
                  ),
                ),
              ),
              orElse: () => LoadingCustom(paddingTop: MediaQuery.of(context).size.height / 4),
            ),
          );
        },
      ),
    );
  }
}

/// Безопасный виджет QuillEditor с обработкой ошибок инициализации
class _SafeQuillEditor extends StatefulWidget {
  final QuillController controller;
  final FocusNode? focusNode;

  const _SafeQuillEditor({required this.controller, this.focusNode});

  @override
  State<_SafeQuillEditor> createState() => _SafeQuillEditorState();
}

class _SafeQuillEditorState extends State<_SafeQuillEditor> {
  @override
  Widget build(BuildContext context) {
    // Используем QuillEditor.basic - он не поддерживает изображения по умолчанию
    // Для поддержки изображений нужно использовать QuillEditor напрямую
    // с embedBuilders из flutter_quill_extensions
    // В flutter_quill 11.x нужно использовать QuillEditorConfigurations
    // Используем QuillEditor.basic с поддержкой изображений и видео
    // Согласно документации flutter_quill_extensions:
    // https://pub.dev/packages/flutter_quill_extensions
    // Для веба используем editorWebBuilders(), для остальных платформ - editorBuilders()
    return QuillEditor.basic(
      controller: widget.controller,
      focusNode: widget.focusNode,
      config: QuillEditorConfig(placeholder: 'Введите текст статьи...', padding: EdgeInsets.zero, embedBuilders: kIsWeb ? FlutterQuillEmbeds.editorWebBuilders() : FlutterQuillEmbeds.editorBuilders()),
    );
  }
}
