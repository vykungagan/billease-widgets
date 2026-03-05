import 'package:flutter/material.dart';
import '../../theme/colors.dart';

class BeSnackBar extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final TextStyle textStyle;
  final Icon? icon;
  final SnackBarAction? snackBarAction;

  const BeSnackBar({
    super.key,
    required this.message,
    this.backgroundColor = AppColors.secondary, // Default background color
    this.textStyle = const TextStyle(color: Colors.white), // Default text style
    this.icon = const Icon(Icons.info_outline, color: Colors.white),
    this.snackBarAction,
  });

  // Method to show the custom SnackBar
  void show(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            if (icon != null) ...[
              icon!, // Display the icon if provided
              const SizedBox(width: 10),
            ],
            Expanded(
              child: Text(
                message,
                style: textStyle, // Apply the custom text style
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor, // Set the background color
        action: snackBarAction, // Add custom action button
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Automatically trigger the SnackBar when the widget is built
    // You can control when you want to show the SnackBar using conditions
    // For now, it will show immediately when this widget is added to the widget tree
    WidgetsBinding.instance.addPostFrameCallback((_) {
      show(context);
    });

    // Returning an empty container or any other widget
    return Container(); // This widget will not render anything
  }
}
