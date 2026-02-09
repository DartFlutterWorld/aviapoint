import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/on_the_way/domain/entities/flight_question_entity.dart';
import 'package:aviapoint/on_the_way/domain/repositories/on_the_way_repository.dart';
import 'package:aviapoint/on_the_way/presentation/bloc/questions_bloc.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

/// Диалог для создания/редактирования вопроса или ответа
class QuestionDialog extends StatefulWidget {
  final int flightId;
  final FlightQuestionEntity? question; // Если null - создание, иначе - редактирование
  final bool isAnswer; // Если true - редактирование ответа пилота
  final VoidCallback? onQuestionCreated; // Callback для обновления списка в секции

  const QuestionDialog({
    super.key,
    required this.flightId,
    this.question,
    this.isAnswer = false,
    this.onQuestionCreated,
  });

  @override
  State<QuestionDialog> createState() => _QuestionDialogState();
}

class _QuestionDialogState extends State<QuestionDialog> {
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.question != null) {
      if (widget.isAnswer) {
        _textController.text = widget.question!.answerText ?? '';
      } else {
        _textController.text = widget.question!.questionText;
      }
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _submit() {
    final text = _textController.text.trim();
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(widget.isAnswer ? 'Введите ответ' : 'Введите вопрос'), backgroundColor: Colors.red),
      );
      return;
    }

    if (widget.question == null) {
      // Создание нового вопроса
      context.read<QuestionsBloc>().add(CreateQuestionEvent(flightId: widget.flightId, questionText: text));
    } else {
      // Редактирование вопроса или ответа
      context.read<QuestionsBloc>().add(
        UpdateQuestionEvent(
          flightId: widget.flightId,
          questionId: widget.question!.id,
          questionText: widget.isAnswer ? null : text,
          answerText: widget.isAnswer ? text : null,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuestionsBloc, QuestionsState>(
      listener: (context, state) {
        if (state is ErrorQuestionsState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.responseMessage ?? state.errorForUser),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 4),
            ),
          );
        } else if (state is QuestionCreatedState) {
          // Вызываем callback для обновления списка в секции (если блоки разные)
          widget.onQuestionCreated?.call();
          Navigator.of(context).pop(true);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Вопрос успешно создан'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        } else if (state is QuestionUpdatedState) {
          // Вызываем callback для обновления списка в секции (если блоки разные)
          widget.onQuestionCreated?.call();
          Navigator.of(context).pop(true);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(widget.isAnswer ? 'Ответ успешно обновлён' : 'Вопрос успешно обновлён'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      child: kIsWeb
          ? Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: _buildContent(),
            )
          : _buildBottomSheet(),
    );
  }

  Widget _buildBottomSheet() {
    return Material(
      child: SafeArea(
        top: false,
        child: Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return BlocBuilder<QuestionsBloc, QuestionsState>(
      builder: (context, state) {
        // isLoading только если это LoadingQuestionsState (не InitialQuestionsState)
        final isLoading = state is LoadingQuestionsState;

        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            constraints: BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Заголовок
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.question == null
                          ? 'Задать вопрос пилоту'
                          : (widget.isAnswer
                                ? (widget.question!.answerText == null || widget.question!.answerText!.isEmpty
                                      ? 'Ответить на вопрос'
                                      : 'Редактировать ответ')
                                : 'Редактировать вопрос'),
                      style: AppStyles.bold20s.copyWith(color: Color(0xFF374151)),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: Color(0xFF9CA5AF)),
                      onPressed: isLoading ? null : () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // Текст вопроса (если редактируем ответ)
                if (widget.question != null && widget.isAnswer) ...[
                  Text('Вопрос:', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xFFF9FAFB),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xFFE5E7EB)),
                    ),
                    child: Text(
                      widget.question!.questionText,
                      style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
                // Поле ввода
                Text(
                  widget.isAnswer ? 'Ответ' : 'Ваш вопрос',
                  style: AppStyles.bold14s.copyWith(color: Color(0xFF374151)),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: _textController,
                  maxLines: widget.isAnswer ? 5 : 3,
                  enabled: !isLoading,
                  decoration: InputDecoration(
                    hintText: widget.isAnswer ? 'Введите ответ на вопрос...' : 'Введите ваш вопрос пилоту...',
                    hintStyle: AppStyles.regular14s.copyWith(color: Color(0xFF9CA5AF)),
                    filled: true,
                    fillColor: Color(0xFFF9FAFB),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xFF0A6EFA), width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Кнопка отправки
                ElevatedButton(
                  onPressed: isLoading ? null : _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0A6EFA),
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: isLoading
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Text(
                          widget.question == null ? 'Отправить вопрос' : 'Сохранить',
                          style: AppStyles.bold14s.copyWith(color: Colors.white),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Функция для показа диалога вопроса
Future<bool?> showQuestionDialog({
  required BuildContext context,
  required int flightId,
  FlightQuestionEntity? question,
  bool isAnswer = false,
  QuestionsBloc? questionsBloc,
  VoidCallback? onQuestionCreated, // Callback для обновления списка в секции
}) async {
  // Если передан существующий bloc, используем его, иначе создаем новый
  final bloc = questionsBloc ?? QuestionsBloc(onTheWayRepository: getIt<OnTheWayRepository>());

  if (kIsWeb) {
    return await showDialog<bool>(
      context: context,
      builder: (dialogContext) => questionsBloc != null
          ? BlocProvider.value(
              value: bloc,
              child: QuestionDialog(
                flightId: flightId,
                question: question,
                isAnswer: isAnswer,
                onQuestionCreated: onQuestionCreated,
              ),
            )
          : BlocProvider(
              create: (context) => bloc,
              child: QuestionDialog(
                flightId: flightId,
                question: question,
                isAnswer: isAnswer,
                onQuestionCreated: onQuestionCreated,
              ),
            ),
    );
  } else {
    return await showCupertinoModalBottomSheet<bool>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (dialogContext) => questionsBloc != null
          ? BlocProvider.value(
              value: bloc,
              child: QuestionDialog(
                flightId: flightId,
                question: question,
                isAnswer: isAnswer,
                onQuestionCreated: onQuestionCreated,
              ),
            )
          : BlocProvider(
              create: (context) => bloc,
              child: QuestionDialog(
                flightId: flightId,
                question: question,
                isAnswer: isAnswer,
                onQuestionCreated: onQuestionCreated,
              ),
            ),
    );
  }
}
