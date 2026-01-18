import 'dart:io';
import 'dart:typed_data';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  late final TextEditingController _emailController;
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _telegramController;
  late final TextEditingController _maxController;
  bool _isLoading = false;
  XFile? _selectedPhoto;
  String? _currentAvatarUrl;
  Uint8List? _selectedPhotoBytes;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _telegramController = TextEditingController();
    _maxController = TextEditingController();

    // Загружаем данные профиля из текущего состояния блока
    final currentState = context.read<ProfileBloc>().state;
    currentState.maybeWhen(
      success: (profile) {
        _emailController.text = profile.email ?? '';
        _firstNameController.text = profile.firstName ?? '';
        _lastNameController.text = profile.lastName ?? '';
        _telegramController.text = profile.telegram ?? '';
        _maxController.text = profile.max ?? '';
        _currentAvatarUrl = profile.avatarUrl;
      },
      orElse: () {},
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _telegramController.dispose();
    _maxController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
      maxWidth: 800,
      maxHeight: 800,
    );

    if (image != null) {
      setState(() {
        _selectedPhoto = image;
        _selectedPhotoBytes = null; // Сбрасываем байты
      });

      // Для веб-платформы читаем байты для preview
      if (kIsWeb) {
        try {
          final bytes = await image.readAsBytes();
          setState(() {
            _selectedPhotoBytes = bytes;
          });
        } catch (e) {
          // Ошибка чтения файла
        }
      }
    }
  }

  void _handleSave() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    // Сначала загружаем фото, если выбрано
    if (_selectedPhoto != null) {
      context.read<ProfileBloc>().add(ProfileEvent.uploadPhoto(_selectedPhoto!));
      // Ждем успешной загрузки фото перед обновлением профиля
      return;
    }

    // Если фото не выбрано, просто обновляем профиль
    // Отправляем пустую строку вместо null для очистки полей
    context.read<ProfileBloc>().add(
      ProfileEvent.update(
        email: _emailController.text.trim(),
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        telegram: _telegramController.text.trim(),
        max: _maxController.text.trim(),
      ),
    );
  }

  Widget _buildTextField({required TextEditingController controller, required String hintText, required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppStyles.regular14s.copyWith(color: Color(0xFF6E7A89))),
        SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(1.45),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: TextField(
            controller: controller,
            style: AppStyles.bold16s.copyWith(color: Color(0xFF2B373E)),
            decoration: InputDecoration(
              border: null,
              disabledBorder: InputBorder.none,
              filled: true,
              fillColor: Color(0xFFE3F1FF),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.white),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              hintText: hintText,
              hintStyle: AppStyles.bold16s.copyWith(color: Color(0xFF9CA5AF)),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (profile) {
            if (_isLoading) {
              // Если была загрузка фото, теперь обновляем остальные данные
              if (_selectedPhoto != null) {
                setState(() {
                  _selectedPhoto = null;
                  _selectedPhotoBytes = null;
                  _currentAvatarUrl = profile.avatarUrl;
                });
                // Обновляем остальные данные профиля
                // Отправляем пустую строку вместо null для очистки полей
                context.read<ProfileBloc>().add(
                  ProfileEvent.update(
                    email: _emailController.text.trim(),
                    firstName: _firstNameController.text.trim(),
                    lastName: _lastNameController.text.trim(),
                    telegram: _telegramController.text.trim(),
                    max: _maxController.text.trim(),
                  ),
                );
              } else {
                // Все данные успешно обновлены - закрываем bottom sheet
                // Обновление странички произойдет автоматически через .then() в openProfileEdit
                setState(() {
                  _isLoading = false;
                });
                Navigator.of(context).pop();
                // Используем корневой контекст для показа snackbar поверх всех окон
                final rootContext = Navigator.of(context, rootNavigator: true).context;
                ScaffoldMessenger.of(rootContext).showSnackBar(SnackBar(content: Text('Профиль успешно обновлен'), backgroundColor: Colors.green));
              }
            }
          },
          error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) {
            if (_isLoading) {
              setState(() {
                _isLoading = false;
              });
              // Используем корневой контекст для показа snackbar поверх всех окон
              final rootContext = Navigator.of(context, rootNavigator: true).context;
              ScaffoldMessenger.of(rootContext).showSnackBar(SnackBar(content: Text(errorForUser), backgroundColor: Colors.red));
            }
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: _isLoading ? MainAxisSize.max : MainAxisSize.min,
                children: [
                  // Заголовок с кнопкой закрытия
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Изменить данные', style: AppStyles.bold16s.copyWith(color: Color(0xFF2B373E))),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: SvgPicture.asset(Pictures.closeAuth),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  // Фото профиля
                  Center(
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFE3F1FF),
                                border: Border.all(color: Color(0xFF0A6EFA), width: 2),
                              ),
                              child: ClipOval(
                                child: _selectedPhoto != null
                                    ? (kIsWeb && _selectedPhotoBytes != null
                                          ? Image.memory(
                                              _selectedPhotoBytes!,
                                              fit: BoxFit.cover,
                                              width: 100,
                                              height: 100,
                                            )
                                          : !kIsWeb
                                          ? Image.file(
                                              File(_selectedPhoto!.path),
                                              fit: BoxFit.cover,
                                              width: 100,
                                              height: 100,
                                            )
                                          : Image.asset(Pictures.pilot, fit: BoxFit.cover, width: 100, height: 100))
                                    : _currentAvatarUrl != null && _currentAvatarUrl!.isNotEmpty
                                    ? CachedNetworkImage(
                                        imageUrl: getImageUrl(_currentAvatarUrl!),
                                        fit: BoxFit.cover,
                                        width: 100,
                                        height: 100,
                                        cacheManager: getIt<DefaultCacheManager>(),
                                        cacheKey:
                                            _currentAvatarUrl, // Используем avatarUrl как ключ кеша (уникален благодаря timestamp)
                                        placeholder: (context, url) =>
                                            Image.asset(Pictures.pilot, fit: BoxFit.cover, width: 100, height: 100),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(Pictures.pilot, fit: BoxFit.cover, width: 100, height: 100),
                                      )
                                    : Image.asset(Pictures.pilot, fit: BoxFit.cover, width: 100, height: 100),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF0A6EFA),
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: Icon(Icons.camera_alt, color: Colors.white, size: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  // Поля для редактирования
                  if (_isLoading)
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 16),
                            Text('Сохранение...', style: AppStyles.regular14s.copyWith(color: Color(0xFF6E7A89))),
                          ],
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildTextField(controller: _firstNameController, hintText: 'Имя', label: 'Имя'),
                            SizedBox(height: 16),
                            _buildTextField(controller: _lastNameController, hintText: 'Фамилия', label: 'Фамилия'),
                            SizedBox(height: 16),
                            _buildTextField(controller: _emailController, hintText: 'Email', label: 'Email'),
                            SizedBox(height: 16),
                            _buildTextField(controller: _telegramController, hintText: 'Telegram', label: 'Telegram'),
                            SizedBox(height: 16),
                            _buildTextField(controller: _maxController, hintText: 'Max', label: 'Max'),
                            SizedBox(height: 24),
                            // Кнопка сохранения
                            CustomButton(
                              verticalPadding: 8,
                              backgroundColor: Color(0xFF0A6EFA),
                              title: 'Сохранить',
                              textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                              borderColor: Color(0xFF0A6EFA),
                              borderRadius: 46,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff0064D6).withOpacity(0.25),
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                  offset: Offset(0.0, 7.0),
                                ),
                              ],
                              onPressed: _isLoading ? null : _handleSave,
                              disabled: _isLoading,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
