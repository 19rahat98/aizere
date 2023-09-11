import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';

class AppCategoryWidget extends StatefulWidget {
  final String label;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const AppCategoryWidget({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onTap, required this.text,
  }) : super(key: key);

  @override
  State<AppCategoryWidget> createState() => _AppCategoryWidgetState();
}

class _AppCategoryWidgetState extends State<AppCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: widget.isSelected ? AppColors.mainBlue : AppColors.monoGrey,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: widget.isSelected ? AppColors.mainBlue : AppColors.grayBlue,
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 11,
              ),
              child: Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              widget.text,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
