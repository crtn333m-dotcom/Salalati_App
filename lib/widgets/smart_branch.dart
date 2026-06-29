import 'package:flutter/material.dart';

class SmartBranch extends StatefulWidget {
  const SmartBranch({super.key});

  @override
  State<SmartBranch> createState() => _SmartBranchState();
}

class _SmartBranchState extends State<SmartBranch> {
  List<String> names = []; // قائمة الأسماء

  // دالة لإضافة اسم جديد
  void _addNewName(String name) {
    setState(() {
      names.add(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // عرض الجذع
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.brown[800],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // عرض الأسماء المضافة بشكل عمودي
          ...names.map((name) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          )),
          // زر الإضافة في قائمة التعديل
          IconButton(
            icon: const Icon(Icons.add_circle, color: Colors.amber),
            onPressed: () => _showAddNameDialog(context),
          ),
        ],
      ),
    );
  }

  // نافذة إدخال الاسم
  void _showAddNameDialog(BuildContext context) {
    TextEditingController controller = TextEditingController();
    showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text("أضف اسماً للجذع"),
      content: TextField(controller: controller),
      actions: [
        TextButton(onPressed: () {
          _addNewName(controller.text);
          Navigator.pop(context);
        }, child: const Text("إضافة"))
      ],
    ));
  }
}
