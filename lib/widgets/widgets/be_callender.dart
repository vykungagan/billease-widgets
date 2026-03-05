// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../theme/decor.dart';

class BeCallender extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<DateTime>? onChanged;
  final String title;

  const BeCallender(
      {super.key,
      required this.title,
      required this.controller,
      this.onChanged});

  @override
  _FoCallenderState createState() => _FoCallenderState();
}

class _FoCallenderState extends State<BeCallender> {
  DateTime? _selectedDate;

  void _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        widget.controller.text = DateFormat('yyyy-MM').format(_selectedDate!);
        if (widget.onChanged != null) {
          widget.onChanged!(_selectedDate!);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: Decor().onlyBorder(),
          margin: const EdgeInsets.all(5),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
                decoration: Decor().inputDecor(widget.title,
                    prefix: Icons.calendar_month_rounded, showPrefix: true),
                style: TextDecor().inputTextStyle(),
                textInputAction: TextInputAction.search,
                autocorrect: false,
                autofocus: false,
                readOnly: true,
                onTap: () => _showDatePicker(context),
                controller: widget.controller),
          ),
        )
      ],
    );
  }
}
