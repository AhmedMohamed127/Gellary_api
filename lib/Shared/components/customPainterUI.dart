import 'package:flutter/cupertino.dart';

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 222, 207, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(size.width*0.6291500,size.height*0.0016793);
    path0.cubicTo(size.width*0.8409000,size.height*0.0106692,size.width*0.7697750,size.height*0.0282828,size.width*0.7617500,size.height*0.0863258);
    path0.cubicTo(size.width*0.7879750,size.height*0.1622222,size.width*1.0037500,size.height*0.0732323,size.width,size.height*0.1893939);
    path0.quadraticBezierTo(size.width,size.height*0.1423611,size.width,size.height*0.0012626);
    path0.quadraticBezierTo(size.width*0.9122750,size.height*-0.0014646,size.width*0.6291500,size.height*0.0016793);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
