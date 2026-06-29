import 'package:flutter/material.dart';
import 'widgets/heritage_painter.dart';

void main() => runApp(const MaterialApp(home: FamilyTreeApp()));

class FamilyTreeApp extends StatefulWidget {
  const FamilyTreeApp({super.key});
  @override
  State<FamilyTreeApp> createState() => _FamilyTreeAppState();
}

class _FamilyTreeAppState extends State<FamilyTreeApp> {
  List<String> names = [];

  void _addName() {
    TextEditingController c = TextEditingController();
    showDialog(context: context, builder: (ctx) => AlertDialog(
      title: const Text("أضف اسم الجد/الابن"),
      content: TextField(controller: c),
      actions: [TextButton(onPressed: () {
        setState(() => names.add(c.text));
        Navigator.pop(ctx);
      }, child: const Text("إضافة إلى الشجرة"))],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF5E6), // لون الورق القديم (تراثي)
      appBar: AppBar(title: const Text("سلالتي - شجرة النسب"), backgroundColor: Colors.brown[900]),
      body: CustomPaint(
        painter: HeritagePainter(names: names),
        size: Size.infinite,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown[900],
        onPressed: _addName,
        child: const Icon(Icons.nature_people),
      ),
    );
  }
}
