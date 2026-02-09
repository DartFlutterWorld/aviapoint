import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/data/datasources/api_datasource_dio.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/presentation/widgets/universal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class FeedbackBottomSheet extends StatefulWidget {
  final String sourcePage; // Страница, с которой вызвана форма
  final String? airportCode; // Код аэропорта (если есть)
  final int? flightId; // ID полета (если есть)

  const FeedbackBottomSheet({super.key, required this.sourcePage, this.airportCode, this.flightId});

  @override
  State<FeedbackBottomSheet> createState() => _FeedbackBottomSheetState();
}

class _FeedbackBottomSheetState extends State<FeedbackBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _commentController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _emailController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _submitFeedback() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final dataSource = ApiDatasourceDio(baseUrl: getBackUrl(useLocal: true));
      final dio = dataSource.dio;

      // Формируем данные формы
      final formData = FormData.fromMap({
        'source_page': widget.sourcePage,
        if (widget.airportCode != null) 'airport_code': widget.airportCode!,
        if (widget.flightId != null) 'flight_id': widget.flightId.toString(),
        if (_emailController.text.isNotEmpty) 'email': _emailController.text,
        'comment': _commentController.text,
      });

      // Отправляем запрос
      await dio.post<Map<String, dynamic>>('/api/feedback', data: formData);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Обратная связь успешно отправлена'), backgroundColor: Color(0xFF10B981)),
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
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
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
                    'Если вы заметили неточность пожалуйста сообщите нам',
                    style: AppStyles.bold16s.copyWith(color: Color(0xFF374151)),
                  ),
                ),
                IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.pop(context)),
              ],
            ),
            SizedBox(height: 16),
            // Поле email
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Введите ваш email',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Введите корректный email';
                  }
                }
                return null;
              },
            ),
            SizedBox(height: 12),
            // Поле комментария
            TextFormField(
              controller: _commentController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Комментарий',
                hintText: 'Опишите неточность или проблему',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Поле комментария обязательно для заполнения';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            // Кнопка отправки
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : _submitFeedback,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0A6EFA),
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: _isSubmitting
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Text('Отправить', style: AppStyles.bold14s.copyWith(color: Colors.white)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
          ],
        ),
      ),
    );
  }
}

/// Функция для показа bottom sheet с формой обратной связи
Future<void> showFeedbackBottomSheet(
  BuildContext context, {
  required String sourcePage,
  String? airportCode,
  int? flightId,
}) async {
  await showUniversalBottomSheet<void>(
    context: context,
    title: '',
    height: MediaQuery.of(context).size.height * 0.9,
    backgroundColor: Colors.transparent,
    showCloseButton: false,
    child: FeedbackBottomSheet(sourcePage: sourcePage, airportCode: airportCode, flightId: flightId),
  );
}
