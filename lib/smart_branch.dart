import 'package:flutter/material.dart';

class SmartBranch extends StatefulWidget {
  const SmartBranch({super.key});

  @override
  State<SmartBranch> createState() => _SmartBranchState();
}

class _SmartBranchState extends State<SmartBranch> {
  // موقع الغصن على الشاشة
  Offset position = const Offset(100, 100);
  // طول الغصن
  double length = 200;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        // منطق السحب والتحريك
        onPanUpdate: (details) {
          setState(() {
            position += details.delta;
          });
        },
        child: Container(
          width: length,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Text("غصن", style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
