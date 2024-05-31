

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..color = const Color(0xFFA3CBC1)
      ..style = PaintingStyle.fill;

    final paint2 = Paint()
      ..color = Colors.white.withOpacity(0.12)
      ..style = PaintingStyle.fill;

    final paint3 = Paint()
      ..color = Colors.white.withOpacity(0.09)
      ..style = PaintingStyle.fill;

    final center1 = Offset(size.width + 200.w,
        -90.5.h);
    canvas.drawCircle(center1, 322.5.h, paint1);
    canvas.drawCircle(center1, 282.5.h, paint2);
    canvas.drawCircle(center1, 242.5.h, paint3);

    final paint4 = Paint()
      ..color = const Color(0xFFA3CBC1).withOpacity(0.1)
      ..style = PaintingStyle.fill;

    final center2 = Offset(-24.5.w,
        size.height + 800.5.h);
    final center3 = Offset(215.w,
        size.height + 800.5.h);
    final center4 = Offset(400.w,
        size.height + 800.5.h);

    canvas.drawCircle(center2, 322.5.w, paint4);
    canvas.drawCircle(center3, 322.5.w, paint4);
    canvas.drawCircle(center4, 322.5.w, paint4);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}