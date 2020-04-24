import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class YzTabDecoration extends Decoration {
  double triangleHeight;
  Color triangleColor;

  YzTabDecoration({this.triangleHeight=10, this.triangleColor=Colors.blue});

  @override
  BoxPainter createBoxPainter([onChanged]) {
    // TODO: implement createBoxPainter
    return _YzTabPainter(onChanged,triangleHeight,triangleColor);
  }
}

class _YzTabPainter extends BoxPainter {
  _YzTabPainter(VoidCallback onChanged,this.triangleHeight,this.triangleColor):super(onChanged){
    _paint=Paint();
    _paint..color=triangleColor..style=PaintingStyle.fill;
  }
  Paint _paint;
  double triangleHeight;
  Color triangleColor;
  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    assert(rect != null);
    assert(textDirection != null);
    return Rect.fromLTWH(
      rect.left,
      rect.top,
      rect.width,
      rect.height,
    );
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size;
    final TextDirection textDirection = configuration.textDirection;
    final Rect indicator =
        _indicatorRectFor(rect, textDirection);
    Point triangleTop= Point((indicator.width/2)+indicator.left, indicator.bottom-triangleHeight);
    Point triangleleft= Point((indicator.width/2)+indicator.left-5, indicator.bottom);
    Point triangleright= Point((indicator.width/2)+indicator.left+5, indicator.bottom);
    Path _path=Path();
    _path.moveTo(triangleTop.x,triangleTop.y);
    _path.lineTo(triangleleft.x,triangleleft.y);
    _path.lineTo(triangleright.x,triangleright.y);
    canvas.drawPath(_path, _paint);
  }
}
