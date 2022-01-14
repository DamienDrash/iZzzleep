import 'package:flutter/material.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          height: 19,
          width: 800,
          child: CustomPaint(
            foregroundPainter: LinePainter(color: Colors.black45),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 9, right: 11),
          height: 20,
          width: 800,
          child: CustomPaint(
            foregroundPainter: LinePainter(color: Colors.white54),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 11, right: 9),
          height: 21,
          width: 800,
          child: CustomPaint(
            foregroundPainter: LinePainter(color: Colors.black12),
          ),
        ),
      ],
    );
  }
}

class LinePainter extends CustomPainter {
  LinePainter({required this.color});
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    canvas.drawLine(Offset(size.width * 1 / 250, size.height * 1 / 2),
        Offset(size.width * 250 / 250, size.height * 1 / 2), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
