import 'package:flutter/material.dart';
import 'widgets/smart_branch.dart'; 

void main() {
  runApp(const MaterialApp(home: FamilyTreeCanvas()));
}

class FamilyTreeCanvas extends StatelessWidget {
  const FamilyTreeCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // هنا يتم استدعاء الغصن الذكي
          const SmartBranch(), 
        ],
      ),
    );
  }
}
