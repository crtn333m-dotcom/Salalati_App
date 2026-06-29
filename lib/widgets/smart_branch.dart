import 'package:flutter/material.dart';

class SmartBranch extends StatefulWidget {
  const SmartBranch({super.key});

  @override
  State<SmartBranch> createState() => _SmartBranchState();
}

class _SmartBranchState extends State<SmartBranch> {
  Offset position = const Offset(100, 100);
  double length = 150; // الطول الافتراضي

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          // جسم الغصن
          GestureDetector(
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
            ),
          ),
          // مقبض التحكم في طول الغصن
          GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                length += details.delta.dx; // تغيير الطول
                if (length < 50) length = 50; // أقل طول ممكن
              });
            },
            child: Container(
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
