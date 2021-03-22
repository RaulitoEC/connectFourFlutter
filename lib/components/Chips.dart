import 'package:flutter/material.dart';

class ColorChip extends StatefulWidget {
  final Color color;
  final Widget child;

  ColorChip(key, this.color, this.child) : super(key: key);

  ColorChip.composed(this.color, this.child);

  @override
  _ColorChip createState() => _ColorChip(color, child);
}

class _ColorChip extends State<ColorChip> {
  Color color;
  Widget child;

  _ColorChip(this.color, this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      width  : 50.0,
      height : 50.0,
      decoration : new BoxDecoration(
        color : color,
        shape : BoxShape.circle,
      ),
      child: child,
    );
  }
}

class SelectableChip extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final void Function(Color) onTap;

  SelectableChip(key, this.color, this.isSelected, this.onTap) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(0),
      child: InkWell(
        child: ColorChip.composed(
          color,
          isSelected ? Icon(Icons.mouse, size:30,) : null,
        ),
        onTap: () { onTap(color); },
      )
    );
  }
}