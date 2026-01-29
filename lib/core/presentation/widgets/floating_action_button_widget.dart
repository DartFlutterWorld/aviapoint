import 'package:flutter/material.dart';
import 'package:aviapoint/core/themes/app_styles.dart';

/// Общий виджет для плавающих кнопок с градиентом
class FloatingActionButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final EdgeInsets? margin;
  final double? iconSize;

  const FloatingActionButtonWidget({super.key, required this.title, this.onTap, this.margin, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF0A6EFA), Color(0xFF7A0FD9)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: const Color(0xFF0A6EFA).withOpacity(0.4), blurRadius: 12, spreadRadius: 0, offset: const Offset(0, 4))],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                  child: Icon(Icons.add, color: Colors.white, size: iconSize ?? 26),
                ),
                SizedBox(width: 8),
                Text(
                  title,
                  style: AppStyles.bold14s.copyWith(color: Colors.white, letterSpacing: 0.3),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
