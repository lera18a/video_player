import 'package:flutter/material.dart';

class LikeOrDislikeIcon extends StatelessWidget {
  const LikeOrDislikeIcon({
    super.key,
    required this.onPressed,
    this.value,
    required this.borderRadius,
    required this.icon,
  });
  final void Function() onPressed;
  final int? value;
  final BorderRadius borderRadius;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(54, 36),
        padding: .all(0),
        side: BorderSide(color: Color(0xffD3D3D3)),
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
      ),
      onPressed: onPressed,
      child: Row(
        children: [Icon(icon, size: 16), SizedBox(width: 4), Text('12')],
      ),
    );
  }
}
