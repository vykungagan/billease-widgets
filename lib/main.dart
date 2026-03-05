
import 'package:flutter/material.dart';

import 'widgets/be_widgets.dart';


void main() {
  runApp(const BillEaseWidgets());
}

class BillEaseWidgets extends StatelessWidget {
  const BillEaseWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BillEase Widgets',
      home: Scaffold(
        appBar: AppBar(title: const Text("BillEase Widgets")),
        body: Column(
          children: [
            BeButton(title: "Checkout", onTap: () {}),
          ],
        ),
      ),
    );
  }
}