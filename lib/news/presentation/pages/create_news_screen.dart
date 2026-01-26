import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/permission_helper.dart';
import 'package:aviapoint/news/data/repositories/news_repository_impl.dart';
import 'package:aviapoint/news/domain/repositories/news_repository.dart';
import 'package:aviapoint/news/presentation/bloc/news_bloc.dart';
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
class CreateNewsScreen extends StatefulWidget {
  const CreateNewsScreen({super.key});

  @override
  State<CreateNewsScreen> createState() => _CreateNewsScreenState();
}

class _CreateNewsScreenState extends State<CreateNewsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _subTitleController = TextEditingController();
  final _sourceController = TextEditingController();
  final _bodyController = TextEditingController(); // Для обратной совместимости (старое поле body)
  final _pictureBigController = TextEditingController();
  late final QuillController _quillController;
  final FocusNode _quillFocusNode = FocusNode();
  bool _hasAttemptedSubmit = false; // Флаг для отслеживания попытки отправки
  
  // Файлы изображений
  File? _pictureBigFile;
  Uint8List? _pictureBigBytes;
  String? _pictureBigFileName;
  
  // Дополнительные изображения
  List<File> _additionalImageFiles = [];
  List<Uint8List> _additionalImageBytes = [];
  List<String> _additionalImageFileNames = [];

  @override
  void initState() {
    super.initState();
    _quillController = QuillController.basic();
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
      final XFile? image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 85, maxWidth: 1920, maxHeight: 1920);

      if (image != null) {
        if (kIsWeb) {
          final bytes = await image.readAsBytes();
          setState(() {
            _pictureBigBytes = bytes;
            _pictureBigFile = null;
            _pictureBigFileName = image.name;
            _pictureBigController.text = ''; // Очищаем URL, так как выбрали файл
          });
        } else {
          setState(() {
            _pictureBigFile = File(image.path);
            _pictureBigBytes = null;
            _pictureBigFileName = image.path.split('/').last;
            _pictureBigController.text = ''; // Очищаем URL, так как выбрали файл
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
          Text(
            'Нажмите, чтобы выбрать фото',
            style: AppStyles.regular14s.copyWith(color: const Color(0xFF9CA5AF)),
          ),
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
          final fullImageUrl = imageUrl.startsWith('http://') || imageUrl.startsWith('https://') ? imageUrl : getImageUrl(imageUrl);

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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка: ${e.toString()}'), backgroundColor: Colors.red),
        );
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
          final fullImageUrl = imageUrl.startsWith('http://') || imageUrl.startsWith('https://') ? imageUrl : getImageUrl(imageUrl);

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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка: ${e.toString()}'), backgroundColor: Colors.red),
        );
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
    // Устанавливаем флаг попытки отправки
    setState(() {
      _hasAttemptedSubmit = true;
    });

    // Валидация формы (Заголовок и Анонс)
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final title = _titleController.text.trim();
    final subTitle = _subTitleController.text.trim();
    final source = _sourceController.text.trim();
    final body = _bodyController.text.trim(); // Для обратной совместимости
    final pictureBig = _pictureBigController.text.trim();

    // Получаем content из QuillEditor
    final deltaJson = _quillController.document.toDelta().toJson();
    final content = jsonEncode(deltaJson);

    // Дополнительная валидация обязательных полей (после валидации формы)
    String? errorMessage;

    // Проверка фото для обложки
    if (pictureBig.isEmpty && _pictureBigFile == null && _pictureBigBytes == null) {
      errorMessage = 'Выберите фото для обложки';
    }
    // Проверка текста новости (QuillEditor)
    else {
      // Проверяем, что контент не пустой и не содержит только пустые строки
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
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
      // Прокручиваем к началу формы, чтобы пользователь увидел ошибку
      Scrollable.ensureVisible(context);
      return;
    }

    // Создаем новость (isBigNews всегда true, миниатюра не нужна - используем большое изображение)
    context.read<NewsBloc>().add(
          NewsEvent.create(
            title: title,
            subTitle: subTitle,
            source: source,
            body: body.isEmpty ? ' ' : body, // Для обратной совместимости
            content: content.trim().isNotEmpty && content != '[]' ? content : null,
            pictureMini: pictureBig.isEmpty ? null : pictureBig, // Используем большое изображение и для миниатюры
            pictureBig: pictureBig.isEmpty ? null : pictureBig,
            pictureMiniFile: null, // Миниатюра не нужна
            pictureBigFile: _pictureBigFile,
            pictureMiniBytes: null, // Миниатюра не нужна
            pictureBigBytes: _pictureBigBytes,
            pictureMiniFileName: null,
            pictureBigFileName: _pictureBigFileName,
            additionalImageFiles: _additionalImageFiles.isNotEmpty ? _additionalImageFiles : null,
            additionalImageBytes: _additionalImageBytes.isNotEmpty ? _additionalImageBytes : null,
            additionalImageFileNames: _additionalImageFileNames.isNotEmpty ? _additionalImageFileNames : null,
            isBigNews: true, // Всегда true
            categoryId: 1, // Используем категорию по умолчанию (ID = 1)
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewsBloc, NewsState>(
      listener: (context, state) {
        state.maybeWhen(
          created: (news) {
            // Проверяем, является ли пользователь админом
            final isAdmin = PermissionHelper.isAdmin(context);
            final message = isAdmin 
                ? 'Новость успешно опубликована'
                : 'Предложенная новость ушла на модерацию, спасибо';
            
            // Получаем ID автора из созданной новости
            final authorId = news.authorId;
            
            // Закрываем экран создания
            AutoRouter.of(context).pop();
            
            // Обновляем блок на странице новостей и переключаем на "Мои" если нужно
            Future.delayed(const Duration(milliseconds: 100), () {
              final navigatorContext = navigatorKey.currentContext;
              if (navigatorContext != null) {
                // Обновляем блок - загружаем новости пользователя
                if (authorId != null) {
                  final newsBloc = navigatorContext.read<NewsBloc>();
                  newsBloc.add(NewsEvent.get(authorId: authorId));
                } else {
                  // Если authorId нет, просто обновляем все новости
                  final newsBloc = navigatorContext.read<NewsBloc>();
                  newsBloc.add(const NewsEvent.get(authorId: null));
                }
                
                // Показываем снек-бар
                ScaffoldMessenger.of(navigatorContext).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.green,
                    duration: const Duration(seconds: 5),
                  ),
                );
              }
            });
          },
          error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorForUser),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          return state.maybeWhen(
            creating: () => Scaffold(
              appBar: const CustomAppBar(title: 'Предложить новость', withBack: true),
              backgroundColor: AppColors.background,
              body: LoadingCustom(paddingTop: 200),
            ),
            orElse: () => Scaffold(
              appBar: const CustomAppBar(title: 'Предложить новость', withBack: true),
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
                    Text('Фото для обложки *', style: AppStyles.regular14s.copyWith(color: const Color(0xFF374151))),
                    SizedBox(height: 12),
                    GestureDetector(
                      onTap: _pickPictureBig,
                        child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: (_hasAttemptedSubmit && _pictureBigFile == null && _pictureBigBytes == null && _pictureBigController.text.trim().isEmpty)
                                ? Colors.red
                                : const Color(0xFFD9E6F8),
                            width: (_hasAttemptedSubmit && _pictureBigFile == null && _pictureBigBytes == null && _pictureBigController.text.trim().isEmpty) ? 2 : 1,
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
                            : _pictureBigController.text.trim().isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      _pictureBigController.text.trim(),
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) => _buildEmptyImagePlaceholder(),
                                    ),
                                  )
                                : _buildEmptyImagePlaceholder(),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _pictureBigController,
                      decoration: InputDecoration(
                        hintText: 'Или введите URL изображения',
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
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.red, width: 2),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.red, width: 2),
                        ),
                      ),
                      style: AppStyles.regular14s.copyWith(color: const Color(0xFF374151)),
                      validator: (value) {
                        // Проверяем только если была попытка отправки формы
                        if (_hasAttemptedSubmit) {
                          if ((_pictureBigFile == null && _pictureBigBytes == null) && (value == null || value.trim().isEmpty)) {
                            return 'Выберите фото для обложки или укажите URL';
                          }
                        }
                        return null;
                      },
                      onChanged: (value) {
                        // Очищаем выбранный файл, если пользователь вводит URL
                        if (value.trim().isNotEmpty) {
                          setState(() {
                            _pictureBigFile = null;
                            _pictureBigBytes = null;
                          });
                        }
                      },
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
                                embedBuilders: kIsWeb ? FlutterQuillEmbeds.editorWebBuilders() : FlutterQuillEmbeds.editorBuilders(),
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
                      label: Text('Вставить изображение в текст', style: AppStyles.regular14s.copyWith(color: const Color(0xFF0A6EFA))),
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
                    Text('Дополнительные изображения', style: AppStyles.regular14s.copyWith(color: const Color(0xFF374151))),
                    SizedBox(height: 12),
                    OutlinedButton.icon(
                      onPressed: _pickAdditionalImages,
                      icon: Icon(Icons.add_photo_alternate, color: const Color(0xFF0A6EFA), size: 20),
                      label: Text('Добавить изображения', style: AppStyles.regular14s.copyWith(color: const Color(0xFF0A6EFA))),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: const Color(0xFF0A6EFA)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    if (_additionalImageFiles.isNotEmpty || _additionalImageBytes.isNotEmpty) ...[
                      SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: List.generate(
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
                                child: IconButton(
                                  icon: Icon(Icons.close, color: Colors.red, size: 20),
                                  onPressed: () {
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
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: 16),

                // Источник (необязательное поле)
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

                // Кнопка отправки
                CustomButton(
                  verticalPadding: 14,
                  backgroundColor: const Color(0xFF7A0FD9),
                  title: 'Предложить новость',
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
