import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class ProgressWidget extends StatelessWidget {
  final int from;
  final int to;

  const ProgressWidget({super.key, required this.from, required this.to});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Flexible(
            child: LinearProgressIndicator(
              backgroundColor: Color(0xFFE1EDFE),
              borderRadius: BorderRadius.circular(26),
              minHeight: 13,
              valueColor: AlwaysStoppedAnimation<Color>(from == to ? Color(0xFF15D585) : Color(0xFF0A6EFA)),
              value: from / to,
            ),
          ),
          SizedBox(width: 10),
          Text(
            '$from из $to',
            style: AppStyles.medium10s.copyWith(color: from == to ? Color(0xFF15D585) : Color(0xFF0970FF)),
          ),
        ],
      ),
    );
  }
}
