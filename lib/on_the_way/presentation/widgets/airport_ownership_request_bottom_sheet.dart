import 'dart:io';
import 'dart:typed_data';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/data/datasources/api_datasource_dio.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:dio/dio.dart';

class AirportOwnershipRequestBottomSheet extends StatefulWidget {
  final String airportCode;

  const AirportOwnershipRequestBottomSheet({super.key, required this.airportCode});

  @override
  State<AirportOwnershipRequestBottomSheet> createState() => _AirportOwnershipRequestBottomSheetState();
}

class _AirportOwnershipRequestBottomSheetState extends State<AirportOwnershipRequestBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _commentController = TextEditingController();
  List<XFile> _selectedDocuments = [];
  bool _isSubmitting = false;

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _fullNameController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _pickDocuments() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? files = await picker.pickMultiImage(imageQuality: 90, maxWidth: 1920, maxHeight: 1920);

    if (files != null && files.isNotEmpty) {
      setState(() {
        _selectedDocuments.addAll(files);
      });
    }
  }

  Future<void> _submitRequest() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedDocuments.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Пожалуйста, прикрепите документы, подтверждающие право собственности'),
          backgroundColor: Color(0xFFEF4444),
        ),
      );
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      // Используем существующий экземпляр ApiDatasource из getIt, который уже настроен с токенами
      final dataSource = getIt<ApiDatasource>() as ApiDatasourceDio;
      final dio = dataSource.dio;

      // Конвертируем XFile в MultipartFile
      final multipartFiles = await Future.wait(
        _selectedDocuments.map((file) async {
          if (kIsWeb) {
            final bytes = await file.readAsBytes();
            return MultipartFile.fromBytes(bytes, filename: file.name);
          } else {
            final fileObj = File(file.path);
            return await MultipartFile.fromFile(fileObj.path, filename: file.name);
          }
        }),
      );

      // Формируем данные формы
      final formData = FormData.fromMap({
        'email': _emailController.text,
        if (_fullNameController.text.isNotEmpty) 'full_name': _fullNameController.text,
        if (_phoneController.text.isNotEmpty) 'phone': _phoneController.text,
        if (_commentController.text.isNotEmpty) 'comment': _commentController.text,
        'documents': multipartFiles,
      });

      // Отправляем запрос
      await dio.post<Map<String, dynamic>>(
        '/api/airports/${widget.airportCode}/ownership-request',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Заявка на владение аэродромом успешно подана'), backgroundColor: Color(0xFF10B981)),
        );

        // Закрываем bottom sheet
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Ошибка отправки: ${e.toString()}'), backgroundColor: Color(0xFFEF4444)));
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Заголовок
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Заявка на владение аэродромом',
                    style: AppStyles.bold20s.copyWith(color: Color(0xFF374151)),
                  ),
                ),
                IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.pop(context)),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              'Для подтверждения права собственности на аэродром, пожалуйста, заполните форму и прикрепите документы',
              style: AppStyles.regular14s.copyWith(color: Color(0xFF6B7280)),
            ),
            SizedBox(height: 16.h),
            // Поле ФИО
            TextFormField(
              controller: _fullNameController,
              decoration: InputDecoration(
                labelText: 'ФИО',
                hintText: 'Введите ваше полное имя',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16.h),
            // Поле email
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Введите ваш email',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Поле email обязательно для заполнения';
                }
                final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegex.hasMatch(value)) {
                  return 'Введите корректный email';
                }
                return null;
              },
            ),
            SizedBox(height: 16.h),
            // Поле телефона
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Телефон',
                hintText: 'Введите ваш телефон',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16.h),
            // Поле комментария
            TextFormField(
              controller: _commentController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Комментарий',
                hintText: 'Дополнительная информация о праве собственности',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16.h),
            // Загрузка документов
            Text(
              'Документы, подтверждающие право собственности *',
              style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
            ),
            SizedBox(height: 8.h),
            OutlinedButton.icon(
              onPressed: _isSubmitting ? null : _pickDocuments,
              icon: Icon(Icons.attach_file, size: 18),
              label: Text('Прикрепить документы', style: AppStyles.regular14s),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                side: BorderSide(color: Color(0xFF0A6EFA)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
              ),
            ),
            // Отображение выбранных документов
            if (_selectedDocuments.isNotEmpty) ...[
              SizedBox(height: 12.h),
              SizedBox(
                height: 100.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _selectedDocuments.length,
                  itemBuilder: (context, index) {
                    final doc = _selectedDocuments[index];
                    return Container(
                      width: 100.w,
                      margin: EdgeInsets.only(right: 8.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: Color(0xFFE5E7EB)),
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: kIsWeb
                                ? FutureBuilder<Uint8List>(
                                    future: doc.readAsBytes(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Image.memory(snapshot.data!, fit: BoxFit.cover);
                                      }
                                      return Container(
                                        color: Color(0xFFF3F4F6),
                                        child: Center(child: CircularProgressIndicator()),
                                      );
                                    },
                                  )
                                : Image.file(File(doc.path), fit: BoxFit.cover),
                          ),
                          // Кнопка удаления
                          Positioned(
                            top: 4.h,
                            right: 4.w,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedDocuments.removeAt(index);
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(4.w),
                                decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                                child: Icon(Icons.close, size: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
            SizedBox(height: 16.h),
            // Кнопка отправки
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : _submitRequest,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0A6EFA),
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                ),
                child: _isSubmitting
                    ? SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Text('Отправить заявку', style: AppStyles.bold14s.copyWith(color: Colors.white)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
          ],
        ),
      ),
    );
  }
}

/// Функция для показа bottom sheet с формой заявки на владение
Future<void> showAirportOwnershipRequestBottomSheet(BuildContext context, {required String airportCode}) async {
  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => AirportOwnershipRequestBottomSheet(airportCode: airportCode),
  );
}
