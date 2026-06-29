import 'package:flutter/material.dart';

class SmartBranch extends StatefulWidget {
  const SmartBranch({super.key});

  @override
  State<SmartBranch> createState() => _SmartBranchState();
}

class _SmartBranchState extends State<SmartBranch> {
  // قائمة الأسماء التي ستظهر على الجذع
  List<String> names = []; 

  // دالة إضافة اسم جديد
  void _addNewName(String name) {
    if (name.isNotEmpty) {
      setState(() {
        names.add(name);
      });
    }
  }

  // نافذة إدخال الاسم الاحترافية
  void _showAddNameDialog(BuildContext context) {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("أضف اسماً للجذع"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: "اكتب الاسم هنا..."),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("إلغاء"),
          ),
          ElevatedButton(
            onPressed: () {
              _addNewName(controller.text);
              Navigator.pop(context);
            },
            child: const Text("إضافة"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140, // عرض الجذع ليناسب الأسماء
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.brown[700], // لون خشبي احترافي
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(2, 2))],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // عرض قائمة الأسماء بشكل عمودي
          ...names.map((name) => Container(
            margin: const EdgeInsets.only(bottom: 5),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(5)),
            child: Text(
              name, 
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          )),
          // زر الإضافة الصغير
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: Colors.amber),
            onPressed: () => _showAddNameDialog(context),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
