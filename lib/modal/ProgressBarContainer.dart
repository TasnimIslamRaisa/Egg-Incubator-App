import 'package:flutter/material.dart';

class ProgressBarContainer extends StatefulWidget {
  final String label;
  final int value;

  const ProgressBarContainer({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  State<ProgressBarContainer> createState() => _ProgressBarContainerState();
}

class _ProgressBarContainerState extends State<ProgressBarContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        Stack(
          children: [
            Container(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                value: widget.value / 100,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.purple[900]!),
                strokeWidth: 8,
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Text(
                  '${widget.value}%',
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
