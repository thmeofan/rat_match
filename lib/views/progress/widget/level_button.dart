import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LevelButton extends StatelessWidget {
  const LevelButton({
    Key? key,
    required this.assetName,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  final String assetName;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonSize = screenWidth * 0.15;

    return AnimatedContainer(
      width: buttonSize,
      height: buttonSize,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: isSelected
            ? Border.all(color: const Color(0xFFEAAD82), width: 3.0)
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: SvgPicture.asset(
            assetName,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
