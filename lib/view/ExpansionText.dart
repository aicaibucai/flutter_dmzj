import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpandedText extends StatefulWidget {
  bool isExpanded;
  String text;
  TextStyle textStyle;

  ExpandedText(this.text,
      {this.isExpanded = false,
      this.textStyle,});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ExpandedTextState();
  }
}

class ExpandedTextState extends State<ExpandedText> {
  bool _isExpanded;

  @override
  void initState() {
    super.initState();
    //初始化控制器以及出事状态
    _isExpanded=widget.isExpanded;
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _RichText(String _text) {
    if (isExpansion(_text)) {
//      是否截断
      if (!_isExpanded) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Text(
              _text,
              textAlign: TextAlign.left,
              style: widget.textStyle ?? TextStyle(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            CupertinoButton(child: Icon(Icons.expand_more), onPressed: () {
              _handleTap();
            }),
          ],
        );
      } else {
        return Column(
          children: <Widget>[
            new Text(
              _text,
              textAlign: TextAlign.left,
              style: widget.textStyle ?? TextStyle(),
            ),
            CupertinoButton(child: Icon(Icons.expand_less), onPressed: () {
              _handleTap();
            }),
          ],
        );
      }
    } else {
     return Text(
        _text,
        textAlign: TextAlign.left,
        style: widget.textStyle ?? TextStyle(),
      );
    }
  }

  bool isExpansion(String text) {
    TextPainter _textPainter = TextPainter(
        maxLines: 1,
        text: TextSpan(text: text, style: widget.textStyle),
        textDirection: TextDirection.ltr)
      ..layout();
    if (_textPainter.didExceedMaxLines) {
      //判断 文本是否需要截断
      return true;
    } else {
      return false;
    }
  }

  void _handleTap() {
    setState(() {
      _isExpanded=!_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _RichText(widget.text);
  }
}
