import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:aviapoint/core/presentation/pages/talker_screen.dart';

class AppWrapper extends StatelessWidget {
  final Widget child;

  const AppWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (!kDebugMode) {
      return child;
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          child,
          Positioned(
            top: 50,
            right: 16,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.black.withOpacity(0.7),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute<void>(
                    builder: (context) => Scaffold(
                      backgroundColor: Colors.black,
                      appBar: AppBar(
                        backgroundColor: Colors.black,
                        title: const Text('Talker Logs', style: TextStyle(color: Colors.white)),
                        leading: IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      body: const AppTalkerScreen(),
                    ),
                  ),
                );
              },
              child: const Icon(Icons.bug_report, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
