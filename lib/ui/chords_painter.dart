import 'dart:math';

import 'package:flutter/widgets.dart';

class ChordsPainter extends CustomPainter{

  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;
  ChordsPainter({this.lineColor,this.completeColor,this.completePercent,this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint complete = new Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    /*Offset center  = new Offset(size.width/2, size.height/2);
    double radius  = min(size.width/2,size.height/2);
    canvas.drawCircle(
        center,
        radius,
        line
    );
    double arcAngle = 2*pi* (completePercent/100);
    canvas.drawArc(
        new Rect.fromCircle(center: center,radius: radius),
        -pi/2,
        arcAngle,
        false,
        complete
    );*/
    //canvas.drawRect(new Rect.fromLTRB(0, 0, 0, 0), complete);
   // canvas.drawPaint(complete);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}