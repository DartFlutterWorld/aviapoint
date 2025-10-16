import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:aviapoint/core/utils/talker_config.dart';

class AppTalkerScreen extends StatelessWidget {
  const AppTalkerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TalkerScreen(talker: AppTalker.instance);
  }
}
