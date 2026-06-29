import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: FamilyTreeCanvas()));

class FamilyTreeCanvas extends StatefulWidget {
  const FamilyTreeCanvas({super.key});
  @override
  State<FamilyTreeCanvas> createState() => _FamilyTreeCanvasState();
}

class _FamilyTreeCanvasState extends State<FamilyTreeCanvas> {
  final List<String> _names = [];

  void _addName() {
    final TextEditingController c = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("إضافة اسم للشجرة"),
        content: TextField(controller: c),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("إلغاء")),
          ElevatedButton(
            onPressed: () {
              if (c.text.isNotEmpty) {
                setState(() => _names.add(c.text));
              }
              Navigator.pop(ctx);
            },
            child: const Text("حفظ"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("سلالتي التراثية")),
      body: CustomPaint(
        painter: HeritagePainter(_names),
        size: Size.infinite,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addName,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class HeritagePainter extends CustomPainter {
  final List<String> names;
  HeritagePainter(this.names);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.brown..style = PaintingStyle.fill;
    for (int i = 0; i < names.length; i++) {
      final y = 80.0 + (i * 90.0);
      canvas.drawOval(Rect.fromCenter(center: Offset(size.width / 2, y), width: 150, height: 50), paint);
      
      final tp = TextPainter(
        text: TextSpan(text: names[i], style: const TextStyle(color: Colors.white, fontSize: 16)),
        textDirection: TextDirection.rtl,
      )..layout();
      tp.paint(canvas, Offset(size.width / 2 - tp.width / 2, y - 10));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
