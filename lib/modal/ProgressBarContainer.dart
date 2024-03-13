import 'package:flutter/material.dart';

class ProgressBarContainer extends StatefulWidget {
  final String label;
  final int value;
  final String unit;

  const ProgressBarContainer({
    Key? key,
    required this.label,
    required this.value,
    required this.unit,
  }) : super(key: key);

  @override
  State<ProgressBarContainer> createState() => _ProgressBarContainerState();
}

class _ProgressBarContainerState extends State<ProgressBarContainer> {
  @override
  Widget build(BuildContext context) {
    double progress = widget.value / 100.0;
    return Column(
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontSize: 25),
        ),
        const SizedBox(height: 10),
        Stack(
          children: [
            Container(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.purple[900]!),
                strokeWidth: 10,
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Text(
                  '${widget.value}${widget.unit}',
                  style: const TextStyle(fontSize: 24, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
