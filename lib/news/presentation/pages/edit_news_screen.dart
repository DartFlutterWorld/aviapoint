import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/presentation/widgets/network_image_widget.dart';
import 'package:aviapoint/core/utils/permission_helper.dart';
import 'package:aviapoint/news/data/repositories/news_repository_impl.dart';
import 'package:aviapoint/news/domain/repositories/news_repository.dart';
import 'package:aviapoint/news/presentation/bloc/news_bloc.dart';
import 'package:aviapoint/news/domain/entities/news_entity.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:dart_quill_delta/dart_quill_delta.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

@RoutePage()
class EditNewsScreen extends StatefulWidget {
  final int newsId;

  const EditNewsScreen({super.key, @PathParam('id') required this.newsId});

  @override
  State<EditNewsScreen> createState() => _EditNewsScreenState();
}

class _EditNewsScreenState extends State<EditNewsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _subTitleController = TextEditingController();
  final _sourceController = TextEditingController();
  final _bodyController = TextEditingController();
  final _pictureBigController = TextEditingController();
  late QuillController _quillController;
  final FocusNode _quillFocusNode = FocusNode();
  bool _hasAttemptedSubmit = false;
  bool _isLoading = true;
  bool _isInitialized = false;

  // Файлы изображений
  File? _pictureBigFile;
  Uint8List? _pictureBigBytes;
  String? _pictureBigFileName;
  String? _originalPictureBigUrl;

  // Дополнительные изображения
  List<File> _additionalImageFiles = [];
  List<Uint8List> _additionalImageBytes = [];
  List<String> _additionalImageFileNames = [];
  List<String> _originalAdditionalImageUrls = []; // Текущий список (изменяется при удалении)
  List<String> _initialAdditionalImageUrls = []; // Исходный список для определения удаленных

  // Сохраняем загруженную новость для использования в _submit
  NewsEntity? _loadedNews;

  @override
  void initState() {
    super.initState();
    _quillController = QuillController.basic();
    _loadNews();
  }

  void _loadNews() async {
    final repository = getIt<NewsRepository>();
    final result = await repository.getNewsById(id: widget.newsId);

    result.fold(
      (failure) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Ошибка загрузки новости: ${failure.message}'), backgroundColor: Colors.red),
          );
          AutoRouter.of(context).pop();
        }
      },
      (news) {
        if (mounted && !_isInitialized) {
          setState(() {
            _loadedNews = news;
            _titleController.text = news.title;
            _subTitleController.text = news.subTitle;
            _sourceController.text = news.source;
            _bodyController.text = news.body;
            _pictureBigController.text = news.pictureBig;
            _originalPictureBigUrl = news.pictureBig;
            _originalAdditionalImageUrls = List.from(news.additionalImages ?? []);
            _initialAdditionalImageUrls = List.from(news.additionalImages ?? []); // Сохраняем исходный список

            // Загружаем content в QuillEditor
            if (news.content != null && news.content!.isNotEmpty) {
              try {
                final deltaJson = jsonDecode(news.content!);
                final delta = Delta.fromJson(deltaJson);
                _quillController.dispose();
                _quillController = QuillController(
                  document: Document.fromDelta(delta),
                  selection: const TextSelection.collapsed(offset: 0),
                );
              } catch (e) {
                _quillController.dispose();
                _quillController = QuillController.basic();
              }
            }

            _isLoading = false;
            _isInitialized = true;
          });
        }
      },
    );
  }

  void _showDeleteDialog() {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Удалить новость?', style: AppStyles.bold16s),
        content: Text(
          'Вы уверены, что хотите удалить эту новость? Это действие нельзя отменить.',
          style: AppStyles.regular14s,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text('Отмена', style: AppStyles.regular14s.copyWith(color: const Color(0xFF6B7280))),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              _deleteNews();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: Text('Удалить', style: AppStyles.bold14s.copyWith(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _deleteNews() {
    // Показываем диалог загрузки
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black54,
      builder: (dialogContext) => const Center(child: CircularProgressIndicator()),
    );

    // Инициируем удаление новости
    context.read<NewsBloc>().add(NewsEvent.delete(id: widget.newsId));
  }

  @override
  void dispose() {
    _titleController.dispose();
    _subTitleController.dispose();
    _sourceController.dispose();
    _bodyController.dispose();
    _pictureBigController.dispose();
    _quillController.dispose();
    _quillFocusNode.dispose();
    super.dispose();
  }

  Future<void> _pickPictureBig() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 1920,
        maxHeight: 1920,
      );

      if (image != null) {
        if (kIsWeb) {
          final bytes = await image.readAsBytes();
          setState(() {
            _pictureBigBytes = bytes;
            _pictureBigFile = null;
            _pictureBigFileName = image.name;
            _pictureBigController.text = '';
          });
        } else {
          setState(() {
            _pictureBigFile = File(image.path);
            _pictureBigBytes = null;
            _pictureBigFileName = image.path.split('/').last;
            _pictureBigController.text = '';
          });
        }
      }
    } catch (e) {
      if (kIsWeb && e.toString().contains('PointerDeviceKind.trackpad')) {
        return;
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Не удалось выбрать изображение: ${e.toString()}'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Widget _buildEmptyImagePlaceholder() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.image_outlined, size: 48, color: const Color(0xFF9CA5AF)),
          SizedBox(height: 8),
          Text('Нажмите, чтобы выбрать фото', style: AppStyles.regular14s.copyWith(color: const Color(0xFF9CA5AF))),
        ],
      ),
    );
  }

  Future<void> _uploadContentImage(File imageFile) async {
    try {
      final repository = getIt<NewsRepository>() as NewsRepositoryImpl;
      final result = await repository.uploadNewsImage(imageFile);

      result.fold(
        (failure) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Ошибка загрузки изображения: ${failure.message}'), backgroundColor: Colors.red),
            );
          }
        },
        (imageUrl) {
          if (!mounted) return;
          final fullImageUrl = imageUrl.startsWith('http://') || imageUrl.startsWith('https://')
              ? imageUrl
              : getImageUrl(imageUrl);

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            try {
              final currentSelection = _quillController.selection;
              final index = currentSelection.isValid ? currentSelection.baseOffset : _quillController.document.length;
              final length = currentSelection.isValid ? currentSelection.extentOffset - index : 0;
              final documentLength = _quillController.document.length;
              final safeIndex = index.clamp(0, documentLength);
              final safeLength = (index + length).clamp(0, documentLength) - safeIndex;

              final delta = Delta()
                ..retain(safeIndex)
                ..delete(safeLength)
                ..insert({'image': fullImageUrl});

              final newPosition = safeIndex + 1;
              final newSelection = TextSelection.collapsed(offset: newPosition);
              _quillController.compose(delta, newSelection, ChangeSource.local);

              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!mounted) return;
                _quillFocusNode.requestFocus();
              });
            } catch (e) {
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Ошибка вставки изображения: ${e.toString()}'), backgroundColor: Colors.red),
                );
              }
            }
          });
        },
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Ошибка: ${e.toString()}'), backgroundColor: Colors.red));
      }
    }
  }

  Future<void> _uploadContentImageFromBytes(Uint8List bytes, String fileName) async {
    try {
      final repository = getIt<NewsRepository>() as NewsRepositoryImpl;
      final result = await repository.uploadNewsImageBytes(bytes, fileName: fileName);

      result.fold(
        (failure) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Ошибка загрузки изображения: ${failure.message}'), backgroundColor: Colors.red),
            );
          }
        },
        (imageUrl) {
          if (!mounted) return;
          final fullImageUrl = imageUrl.startsWith('http://') || imageUrl.startsWith('https://')
              ? imageUrl
              : getImageUrl(imageUrl);

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            try {
              final currentSelection = _quillController.selection;
              final index = currentSelection.isValid ? currentSelection.baseOffset : _quillController.document.length;
              final length = currentSelection.isValid ? currentSelection.extentOffset - index : 0;
              final documentLength = _quillController.document.length;
              final safeIndex = index.clamp(0, documentLength);
              final safeLength = (index + length).clamp(0, documentLength) - safeIndex;

              final delta = Delta()
                ..retain(safeIndex)
                ..delete(safeLength)
                ..insert({'image': fullImageUrl});

              final newPosition = safeIndex + 1;
              final newSelection = TextSelection.collapsed(offset: newPosition);
              _quillController.compose(delta, newSelection, ChangeSource.local);

              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!mounted) return;
                _quillFocusNode.requestFocus();
              });
            } catch (e) {
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Ошибка вставки изображения: ${e.toString()}'), backgroundColor: Colors.red),
                );
              }
            }
          });
        },
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Ошибка: ${e.toString()}'), backgroundColor: Colors.red));
      }
    }
  }

  Future<void> _pickContentImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery, maxWidth: 1920, maxHeight: 1920);

      if (image != null) {
        if (kIsWeb) {
          final bytes = await image.readAsBytes();
          await _uploadContentImageFromBytes(bytes, image.name);
        } else {
          await _uploadContentImage(File(image.path));
        }
      }
    } catch (e) {
      if (kIsWeb && e.toString().contains('PointerDeviceKind.trackpad')) {
        return;
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Не удалось выбрать изображение: ${e.toString()}'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Future<void> _pickAdditionalImages() async {
    try {
      final ImagePicker picker = ImagePicker();
      final List<XFile> images = await picker.pickMultiImage(imageQuality: 85, maxWidth: 1920, maxHeight: 1920);

      if (images.isNotEmpty) {
        if (kIsWeb) {
          final List<Uint8List> bytesList = [];
          final List<String> fileNames = [];
          for (final image in images) {
            final bytes = await image.readAsBytes();
            bytesList.add(bytes);
            fileNames.add(image.name);
          }
          setState(() {
            _additionalImageBytes.addAll(bytesList);
            _additionalImageFileNames.addAll(fileNames);
          });
        } else {
          setState(() {
            for (final image in images) {
              _additionalImageFiles.add(File(image.path));
              _additionalImageFileNames.add(image.path.split('/').last);
            }
          });
        }
      }
    } catch (e) {
      if (kIsWeb && e.toString().contains('PointerDeviceKind.trackpad')) {
        return;
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Не удалось выбрать изображения: ${e.toString()}'), backgroundColor: Colors.red),
        );
      }
    }
  }

  void _submit() {
    setState(() {
      _hasAttemptedSubmit = true;
    });

    if (!_formKey.currentState!.validate()) {
      return;
    }

    final title = _titleController.text.trim();
    final subTitle = _subTitleController.text.trim();
    final source = _sourceController.text.trim();
    final body = _bodyController.text.trim();
    final deltaJson = _quillController.document.toDelta().toJson();
    final content = jsonEncode(deltaJson);

    String? errorMessage;

    if (_pictureBigFile == null && _pictureBigBytes == null && _originalPictureBigUrl == null) {
      errorMessage = 'Выберите фото для обложки';
    } else {
      final contentTrimmed = content.trim();
      if (contentTrimmed.isEmpty ||
          contentTrimmed == '[]' ||
          contentTrimmed == '[{"insert":"\\n"}]' ||
          contentTrimmed == '[{"insert":"\\n\\n"}]') {
        errorMessage = 'Введите текст новости';
      }
    }

    if (errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage), backgroundColor: Colors.red, duration: const Duration(seconds: 3)),
      );
      Scrollable.ensureVisible(context);
      return;
    }

    final isAdmin = PermissionHelper.isAdmin(context);

    // Определяем, нужно ли удалить фото обложки
    final deletePictureBig = _originalPictureBigUrl != null && _pictureBigFile == null && _pictureBigBytes == null;

    // Определяем список URL дополнительных изображений для удаления
    // (те, которые были в исходном списке, но отсутствуют в текущем)
    final imagesToDelete = _initialAdditionalImageUrls
        .where((url) => !_originalAdditionalImageUrls.contains(url))
        .toList();

    context.read<NewsBloc>().add(
      NewsEvent.update(
        id: widget.newsId,
        title: title,
        subTitle: subTitle,
        source: source,
        body: body.isEmpty ? ' ' : body,
        content: content.trim().isNotEmpty && content != '[]' ? content : null,
        pictureBig: _originalPictureBigUrl,
        pictureBigFile: _pictureBigFile,
        pictureBigBytes: _pictureBigBytes,
        pictureBigFileName: _pictureBigFileName,
        additionalImageFiles: _additionalImageFiles.isNotEmpty ? _additionalImageFiles : null,
        additionalImageBytes: _additionalImageBytes.isNotEmpty ? _additionalImageBytes : null,
        additionalImageFileNames: _additionalImageFileNames.isNotEmpty ? _additionalImageFileNames : null,
        deletePictureBig: deletePictureBig,
        imagesToDelete: imagesToDelete.isNotEmpty ? imagesToDelete : null,
        isBigNews: true,
        categoryId: 1,
        published: isAdmin ? true : null, // Не меняем статус, если не админ
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: const CustomAppBar(title: 'Редактировать новость', withBack: true),
        backgroundColor: AppColors.background,
        body: LoadingCustom(paddingTop: 200),
      );
    }

    return BlocListener<NewsBloc, NewsState>(
      listener: (context, state) {
        // Временно проверяем через toString, пока не сгенерированы freezed файлы
        if (state.toString().contains('DeletedNewsState')) {
          // Закрываем диалог загрузки, если он открыт
          Navigator.of(context, rootNavigator: true).pop();
          // Показываем сообщение об успешном удалении
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Новость успешно удалена'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
          // Обновляем список новостей перед возвратом
          final newsBloc = context.read<NewsBloc>();
          newsBloc.add(const NewsEvent.get(authorId: null));
          // Возвращаемся к списку новостей
          if (mounted) {
            AutoRouter.of(context).popUntil((route) {
              final routeName = route.settings.name;
              return routeName == NewsRoute.name || routeName == NewsNavigationRoute.name;
            });
          }
          return;
        }

        state.maybeWhen(
          updated: (news) {
            // Обновляем блок перед закрытием экрана
            // BlocListener в news_screen автоматически обновит список
            final newsBloc = context.read<NewsBloc>();

            // Определяем, нужно ли обновить список с фильтром "Мои новости"
            // Для этого проверяем, есть ли authorId у обновленной новости
            if (news.authorId != null) {
              // Обновляем список новостей пользователя
              newsBloc.add(NewsEvent.get(authorId: news.authorId));
            } else {
              // Обновляем все новости
              newsBloc.add(const NewsEvent.get(authorId: null));
            }

            // Закрываем экран редактирования
            AutoRouter.of(context).pop();

            // Показываем snackbar на предыдущем экране
            Future.delayed(const Duration(milliseconds: 300), () {
              final navigatorContext = navigatorKey.currentContext;
              if (navigatorContext != null) {
                ScaffoldMessenger.of(navigatorContext).showSnackBar(
                  SnackBar(
                    content: Text('Новость успешно обновлена'),
                    backgroundColor: Colors.green,
                    duration: const Duration(seconds: 5),
                  ),
                );
              }
            });
          },
          error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) {
            // Закрываем диалог загрузки, если он открыт (при удалении)
            if (state.toString().contains('DeletingNewsState')) {
              Navigator.of(context, rootNavigator: true).pop();
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(errorForUser), backgroundColor: Colors.red, duration: const Duration(seconds: 3)),
            );
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          return state.maybeWhen(
            updating: () => Scaffold(
              appBar: const CustomAppBar(title: 'Редактирование', withBack: true),
              backgroundColor: AppColors.background,
              body: LoadingCustom(paddingTop: 200),
            ),
            orElse: () => Scaffold(
              appBar: CustomAppBar(
                title: 'Редактирование',
                withBack: true,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: _showDeleteDialog,
                    tooltip: 'Удалить новость',
                  ),
                ],
              ),
              backgroundColor: AppColors.background,
              body: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Фото для обложки
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Фото для обложки *',
                            style: AppStyles.regular14s.copyWith(color: const Color(0xFF374151)),
                          ),
                          SizedBox(height: 12),
                          Stack(
                            children: [
                              GestureDetector(
                                onTap: _pickPictureBig,
                                child: Container(
                                  width: double.infinity,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color:
                                          (_hasAttemptedSubmit &&
                                              _pictureBigFile == null &&
                                              _pictureBigBytes == null &&
                                              _originalPictureBigUrl == null)
                                          ? Colors.red
                                          : const Color(0xFFD9E6F8),
                                      width:
                                          (_hasAttemptedSubmit &&
                                              _pictureBigFile == null &&
                                              _pictureBigBytes == null &&
                                              _originalPictureBigUrl == null)
                                          ? 2
                                          : 1,
                                    ),
                                  ),
                                  child: _pictureBigFile != null || _pictureBigBytes != null
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: kIsWeb && _pictureBigBytes != null
                                              ? Image.memory(_pictureBigBytes!, fit: BoxFit.cover)
                                              : _pictureBigFile != null
                                              ? Image.file(_pictureBigFile!, fit: BoxFit.cover)
                                              : const SizedBox.shrink(),
                                        )
                                      : _originalPictureBigUrl != null
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: NetworkImageWidget(
                                            imageUrl: getImageUrl(_originalPictureBigUrl!),
                                            fit: BoxFit.cover,
                                            errorWidget: _buildEmptyImagePlaceholder(),
                                          ),
                                        )
                                      : _buildEmptyImagePlaceholder(),
                                ),
                              ),
                              // Кнопка удаления фото обложки
                              if (_pictureBigFile != null || _pictureBigBytes != null || _originalPictureBigUrl != null)
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _pictureBigFile = null;
                                        _pictureBigBytes = null;
                                        _pictureBigFileName = null;
                                        _pictureBigController.clear();
                                        _originalPictureBigUrl = null;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                                      child: Icon(Icons.close, color: Colors.white, size: 16),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      // Заголовок
                      TextFormField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelText: 'Заголовок *',
                          labelStyle: AppStyles.regular14s.copyWith(color: const Color(0xFF9CA5AF)),
                          hintText: 'Введите заголовок новости',
                          hintStyle: AppStyles.regular14s.copyWith(color: const Color(0xFF9CA5AF)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFFD9E6F8)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFFD9E6F8)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFF0A6EFA), width: 2),
                          ),
                        ),
                        style: AppStyles.regular14s.copyWith(color: const Color(0xFF374151)),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Введите заголовок';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      // Анонс
                      TextFormField(
                        controller: _subTitleController,
                        decoration: InputDecoration(
                          labelText: 'Анонс *',
                          labelStyle: AppStyles.regular14s.copyWith(color: const Color(0xFF9CA5AF)),
                          hintText: 'Введите анонс',
                          hintStyle: AppStyles.regular14s.copyWith(color: const Color(0xFF9CA5AF)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFFD9E6F8)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFFD9E6F8)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFF0A6EFA), width: 2),
                          ),
                        ),
                        style: AppStyles.regular14s.copyWith(color: const Color(0xFF374151)),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Введите анонс';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      // Текст новости (Quill Editor)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Текст новости *', style: AppStyles.regular14s.copyWith(color: const Color(0xFF374151))),
                          SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: const Color(0xFFD9E6F8)),
                            ),
                            child: Column(
                              children: [
                                Transform.scale(
                                  scale: 1,
                                  alignment: Alignment.topLeft,
                                  child: QuillSimpleToolbar(
                                    controller: _quillController,
                                    config: const QuillSimpleToolbarConfig(showClipboardCut: true),
                                  ),
                                ),
                                Transform.translate(offset: Offset(0, kIsWeb ? 0 : -4), child: Divider(height: 1)),
                                Container(
                                  height: 300,
                                  padding: EdgeInsets.all(12),
                                  child: QuillEditor.basic(
                                    controller: _quillController,
                                    config: QuillEditorConfig(
                                      placeholder: 'Введите текст новости...',
                                      embedBuilders: kIsWeb
                                          ? FlutterQuillEmbeds.editorWebBuilders()
                                          : FlutterQuillEmbeds.editorBuilders(),
                                    ),
                                    focusNode: _quillFocusNode,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12),
                          OutlinedButton.icon(
                            onPressed: _pickContentImage,
                            icon: Icon(Icons.image, color: const Color(0xFF0A6EFA), size: 20),
                            label: Text(
                              'Вставить изображение в текст',
                              style: AppStyles.regular14s.copyWith(color: const Color(0xFF0A6EFA)),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: const Color(0xFF0A6EFA)),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      // Дополнительные изображения
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Дополнительные изображения',
                            style: AppStyles.regular14s.copyWith(color: const Color(0xFF374151)),
                          ),
                          SizedBox(height: 12),
                          OutlinedButton.icon(
                            onPressed: _pickAdditionalImages,
                            icon: Icon(Icons.add_photo_alternate, color: const Color(0xFF0A6EFA), size: 20),
                            label: Text(
                              'Добавить изображения',
                              style: AppStyles.regular14s.copyWith(color: const Color(0xFF0A6EFA)),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: const Color(0xFF0A6EFA)),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                          if (_additionalImageFiles.isNotEmpty ||
                              _additionalImageBytes.isNotEmpty ||
                              _originalAdditionalImageUrls.isNotEmpty) ...[
                            SizedBox(height: 12),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                // Существующие изображения
                                ..._originalAdditionalImageUrls.map(
                                  (url) => Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          getImageUrl(url),
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _originalAdditionalImageUrls.remove(url);
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                                            child: Icon(Icons.close, color: Colors.white, size: 16),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Новые изображения
                                ...List.generate(
                                  kIsWeb ? _additionalImageBytes.length : _additionalImageFiles.length,
                                  (index) => Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: kIsWeb && _additionalImageBytes.isNotEmpty
                                            ? Image.memory(
                                                _additionalImageBytes[index],
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              )
                                            : _additionalImageFiles.isNotEmpty
                                            ? Image.file(
                                                _additionalImageFiles[index],
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              )
                                            : const SizedBox.shrink(),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (kIsWeb) {
                                                _additionalImageBytes.removeAt(index);
                                                _additionalImageFileNames.removeAt(index);
                                              } else {
                                                _additionalImageFiles.removeAt(index);
                                                _additionalImageFileNames.removeAt(index);
                                              }
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                                            child: Icon(Icons.close, color: Colors.white, size: 16),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                      SizedBox(height: 16),
                      // Источник
                      TextFormField(
                        controller: _sourceController,
                        decoration: InputDecoration(
                          labelText: 'Источник',
                          labelStyle: AppStyles.regular14s.copyWith(color: const Color(0xFF9CA5AF)),
                          hintText: 'Введите источник новости (необязательно)',
                          hintStyle: AppStyles.regular14s.copyWith(color: const Color(0xFF9CA5AF)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFFD9E6F8)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFFD9E6F8)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFF0A6EFA), width: 2),
                          ),
                        ),
                        style: AppStyles.regular14s.copyWith(color: const Color(0xFF374151)),
                      ),
                      SizedBox(height: 30),
                      // Кнопка сохранения
                      CustomButton(
                        verticalPadding: 14,
                        backgroundColor: const Color(0xFF7A0FD9),
                        title: 'Сохранить изменения',
                        textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                        borderColor: const Color(0xFF7A0FD9),
                        borderRadius: 46,
                        onPressed: _submit,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
