import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem extends StatefulWidget {
  const MenuItem(
      {Key? key,
      required this.text,
      required this.icon,
      this.isActive = false,
      required this.onTap})
      : super(key: key);

  final String text;
  final IconData icon;
  final bool isActive;
  final GestureTapCallback onTap;

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      color: isHovered
          ? Colors.white.withOpacity(0.1)
          : widget.isActive
              ? Colors.white.withOpacity(0.1)
              : Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.isActive ? null : widget.onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 10.0,
            ),
            child: MouseRegion(
              onEnter: (_) => setState(() => isHovered = true),
              onExit: (_) => setState(() => isHovered = false),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon,
                    color: Colors.white.withOpacity(0.3),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    widget.text,
                    style: GoogleFonts.roboto(
                      fontSize: 16.0,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
