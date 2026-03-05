import 'package:flutter/material.dart';

class BeProfilePic extends StatelessWidget {
  const BeProfilePic(
      {super.key,
      required this.image,
      this.placeholder = 'assets/user.png',
      this.borderRadius = const BorderRadius.all(Radius.circular(15.0))});

  final String placeholder, image;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return image.isNotEmpty
        ? CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(image),
          )
        : CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            child: Image.asset(placeholder, fit: BoxFit.cover));
  }
}

class PhotoDialog extends StatelessWidget {
  const PhotoDialog(
      {super.key,
      required this.image,
      required this.placeholder,
      required this.borderRadius});

  final String placeholder, image;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return image.isNotEmpty
        ? _dialogClipRRect(
            Image.network(
              image,
              fit: BoxFit.cover,
              errorBuilder:
                  (BuildContext context, Object e, StackTrace? stackTrace) {
                /*print('exception is: $e');*/
                return Image.asset(placeholder, fit: BoxFit.cover);
              },
            ),
            borderRadius)
        : _dialogClipRRect(
            Image.asset(placeholder, fit: BoxFit.cover), borderRadius);
  }
}

_dialogClipRRect(Widget widget, BorderRadius borderRadius) {
  return ClipRRect(
    borderRadius: borderRadius,
    child: widget,
  );
}
