import 'package:flutter/material.dart';
import 'widgets/smart_branch.dart'; 

void main() {
  runApp(const MaterialApp(home: FamilyTreeCanvas()));
}

class FamilyTreeCanvas extends StatefulWidget {
  const FamilyTreeCanvas({super.key});

  @override
  State<FamilyTreeCanvas> createState() => _FamilyTreeCanvasState();
}

class _FamilyTreeCanvasState extends State<FamilyTreeCanvas> {
  // قائمة تحفظ كل الأغصان التي ستضيفينها
  List<Widget> branches = [];

  void _addBranch() {
    setState(() {
      branches.add(const SmartBranch());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ...branches, // عرض كل الأغصان المضافة
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addBranch,
        child: const Icon(Icons.add),
      ),
    );
  }
}
