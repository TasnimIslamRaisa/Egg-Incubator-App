import 'package:flutter/material.dart';

class MyAppContainer extends StatelessWidget {
  final Widget child;

  const MyAppContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.deepPurple[200]!,
                  Colors.deepPurple[500]!,
                ],
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
