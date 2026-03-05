import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class BeLoading extends StatelessWidget {
  final String message;

  const BeLoading({super.key, required this.message});

  // Show the loading dialog
  static void show(BuildContext context, {required String message}) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (BuildContext context) {
        return BeLoading(message: message);
      },
    );
  }

  // Hide the loading dialog
  static void dismiss(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white, // Solid background color
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondary),
                strokeWidth: 4, // Thicker circular progress indicator
              ),
              const SizedBox(width: 20),
              Expanded(
                child: AnimatedDefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.secondary,
                    letterSpacing: 1.2,
                  ),
                  duration: const Duration(milliseconds: 300),
                  child: Text(message, textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
