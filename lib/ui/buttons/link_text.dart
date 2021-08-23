import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LinkText extends StatefulWidget {
  const LinkText({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  final String text;
  final GestureTapCallback? onTap;
  @override
  _LinkTextState createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHover = true),
        onExit: (_) => setState(() => isHover = false),
        cursor: SystemMouseCursors.click,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 5.0,
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[700],
              decoration:
                  isHover ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
