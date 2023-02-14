import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  ReusableCard(
      {super.key, required this.color, this.cardChild, required this.onTap});

  final Color color;
  final Widget? cardChild;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
        child: cardChild,
      ),
    );
  }
}
