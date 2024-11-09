import 'package:flutter/material.dart';
import 'package:todo/core/theme/app_colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);
  static const String route = '/loading';
  static const String name = 'loading';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: SizedBox.square(
              dimension: 40,
              child: CircularProgressIndicator(
                backgroundColor: AppColors.backgroundColor,
                strokeCap: StrokeCap.round,
                color: AppColors.primaryColor,
                strokeWidth: 4.0,
              ),
            ),
          ),
        ],

      ),
    );
  }
}