import 'package:flutter/material.dart';

import '../../theme/colors.dart';


class BeCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double appBarHeight;
  final bool isHomeScreen;

  const BeCustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor = AppColors.main,
    required this.scaffoldKey,
    this.actions,
    this.bottom,
    this.appBarHeight = 80.0, // Default height is 80.0, can be overridden
    this.isHomeScreen = false, // Flag to check if it's the home screen
  });

  @override
  Widget build(BuildContext context) {
    final bool hasDrawer = scaffoldKey.currentState?.hasDrawer ?? false;
    final bool canGoBack = Navigator.of(context).canPop() && !hasDrawer;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Drawer/Menu Icon or Back Arrow
                  GestureDetector(
                    onTap: () {
                      if (canGoBack) {
                        Navigator.of(context).pop();
                      } else {
                        scaffoldKey.currentState?.openDrawer();
                      }
                    },
                    child: Icon(
                      canGoBack ? Icons.arrow_back : Icons.menu,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  // Title in the center
                  Expanded(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Actions: Notification and Profile Icon on Home Screen
                  if (isHomeScreen)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications, color: Colors.white),
                        ),
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/images/profile.jpg'),
                        ),
                      ],
                    ),
                  // Normal Actions on other screens
                  if (!isHomeScreen) ...?actions,
                ],
              ),
            ),
            if (bottom != null) bottom!,
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    double bottomHeight = bottom?.preferredSize.height ?? 0.0;
    return Size.fromHeight(appBarHeight + bottomHeight);
  }
}
