import 'package:aviapoint/blog/domain/entities/blog_comment_entity.dart';
import 'package:aviapoint/blog/domain/repositories/blog_repository.dart';
import 'package:aviapoint/blog/presentation/bloc/blog_comments_bloc.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

/// Диалог для создания/редактирования комментария
class CommentDialog extends StatefulWidget {
  final int articleId;
  final BlogCommentEntity? comment; // Если null - создание, иначе - редактирование
  final String? parentCommentId; // ID родительского комментария для ответа
  final VoidCallback? onCommentCreated; // Callback для обновления списка в секции

  const CommentDialog({super.key, required this.articleId, this.comment, this.parentCommentId, this.onCommentCreated});

  @override
  State<CommentDialog> createState() => _CommentDialogState();
}

class _CommentDialogState extends State<CommentDialog> {
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.comment != null) {
      _textController.text = widget.comment!.content;
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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Введите комментарий'), backgroundColor: Colors.red));
      return;
    }

    if (widget.comment == null) {
      // Создание нового комментария
      context.read<BlogCommentsBloc>().add(CreateCommentEvent(articleId: widget.articleId, parentCommentId: widget.parentCommentId, content: text));
    } else {
      // Редактирование комментария
      context.read<BlogCommentsBloc>().add(UpdateCommentEvent(articleId: widget.articleId, commentId: widget.comment!.id, content: text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BlogCommentsBloc, BlogCommentsState>(
      listener: (context, state) {
        if (state is ErrorBlogCommentsState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.responseMessage ?? state.errorForUser), backgroundColor: Colors.red, duration: Duration(seconds: 4)));
        } else if (state is CommentCreatedState) {
          // Вызываем callback для обновления списка в секции (если блоки разные)
          widget.onCommentCreated?.call();
          Navigator.of(context).pop(true);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Комментарий успешно создан'), backgroundColor: Colors.green, duration: Duration(seconds: 2)));
        } else if (state is CommentUpdatedState) {
          // Вызываем callback для обновления списка в секции (если блоки разные)
          widget.onCommentCreated?.call();
          Navigator.of(context).pop(true);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Комментарий успешно обновлён'), backgroundColor: Colors.green, duration: Duration(seconds: 2)));
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
    return BlocBuilder<BlogCommentsBloc, BlogCommentsState>(
      builder: (context, state) {
        // isLoading только если это LoadingBlogCommentsState (не InitialBlogCommentsState)
        final isLoading = state is LoadingBlogCommentsState;

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
                    Text(widget.comment == null ? 'Оставить комментарий' : 'Редактировать комментарий', style: AppStyles.bold20s.copyWith(color: Color(0xFF374151))),
                    IconButton(
                      icon: Icon(Icons.close, color: Color(0xFF9CA5AF)),
                      onPressed: isLoading ? null : () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // Поле ввода
                Text('Ваш комментарий', style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                SizedBox(height: 8),
                TextField(
                  controller: _textController,
                  maxLines: 5,
                  enabled: !isLoading,
                  decoration: InputDecoration(
                    hintText: 'Введите ваш комментарий...',
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
                      ? SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation<Color>(Colors.white)))
                      : Text(widget.comment == null ? 'Отправить комментарий' : 'Сохранить', style: AppStyles.bold14s.copyWith(color: Colors.white)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Функция для показа диалога комментария
Future<bool?> showCommentDialog({
  required BuildContext context,
  required int articleId,
  BlogCommentEntity? comment,
  String? parentCommentId,
  BlogCommentsBloc? commentsBloc,
  VoidCallback? onCommentCreated, // Callback для обновления списка в секции
}) async {
  // Если передан существующий bloc, используем его, иначе создаем новый
  final bloc = commentsBloc ?? BlogCommentsBloc(blogRepository: getIt<BlogRepository>());

  if (kIsWeb) {
    return await showDialog<bool>(
      context: context,
      builder: (dialogContext) => commentsBloc != null
          ? BlocProvider.value(
              value: bloc,
              child: CommentDialog(articleId: articleId, comment: comment, parentCommentId: parentCommentId, onCommentCreated: onCommentCreated),
            )
          : BlocProvider(
              create: (context) => bloc,
              child: CommentDialog(articleId: articleId, comment: comment, parentCommentId: parentCommentId, onCommentCreated: onCommentCreated),
            ),
    );
  } else {
    return await showCupertinoModalBottomSheet<bool>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (dialogContext) => commentsBloc != null
          ? BlocProvider.value(
              value: bloc,
              child: CommentDialog(articleId: articleId, comment: comment, parentCommentId: parentCommentId, onCommentCreated: onCommentCreated),
            )
          : BlocProvider(
              create: (context) => bloc,
              child: CommentDialog(articleId: articleId, comment: comment, parentCommentId: parentCommentId, onCommentCreated: onCommentCreated),
            ),
    );
  }
}
