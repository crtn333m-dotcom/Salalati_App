import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: FamilyTreeCanvas()));

class FamilyTreeCanvas extends StatefulWidget {
  const FamilyTreeCanvas({super.key});
  @override
  State<FamilyTreeCanvas> createState() => _FamilyTreeCanvasState();
}

class _FamilyTreeCanvasState extends State<FamilyTreeCanvas> {
  List<String> names = [];

  void _addName() {
    TextEditingController c = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("أضف اسماً للشجرة"),
        content: TextField(controller: c, decoration: const InputDecoration(hintText: "اكتب الاسم هنا")),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("إلغاء")),
          ElevatedButton(
            onPressed: () {
              setState(() => names.add(c.text));
              Navigator.pop(ctx);
            },
            child: const Text("إضافة"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF5E6), // لون الورق القديم
      appBar: AppBar(title: const Text("سلالتي التراثية"), backgroundColor: Colors.brown[900]),
      body: CustomPaint(
        painter: HeritageTreePainter(names: names),
        size: Size.infinite,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown[900],
        onPressed: _addName,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// محرك الرسم الاحترافي (يرسم أشكالاً تراثية بدلاً من المربعات)
class HeritageTreePainter extends CustomPainter {
  final List<String> names;
  HeritageTreePainter({required this.names});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF6D4C41)..style = PaintingStyle.fill;
    
    for (int i = 0; i < names.length; i++) {
      double y = 100.0 + (i * 80.0);
      
      // رسم شكل بيضاوي تراثي (أشبه بأوراق الشجر)
      canvas.drawOval(Rect.fromCenter(center: Offset(size.width / 2, y), width: 160, height: 60), paint);
      
      // رسم النص داخل الشكل
      final textPainter = TextPainter(
        text: TextSpan(
          text: names[i],
          style: const TextStyle(color: Colors.amberAccent, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        textDirection: TextDirection.rtl,
      )..layout();
      
      textPainter.paint(canvas, Offset(size.width / 2 - textPainter.width / 2, y - 12));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
