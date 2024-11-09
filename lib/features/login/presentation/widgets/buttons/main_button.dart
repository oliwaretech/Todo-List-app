import 'package:flutter/material.dart';
import 'package:todo/core/theme/styles.dart';

class MainButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  const MainButton({super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: mainButtonStyle,
        onPressed: onPressed,
        child: child);
  }
}
