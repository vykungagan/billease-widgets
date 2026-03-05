// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../theme/colors.dart';
import '../../theme/decor.dart';

class BeDobInput extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<DateTime>? onChanged;

  const BeDobInput({super.key, required this.controller, this.onChanged});

  @override
  _FoDobInputState createState() => _FoDobInputState();
}

class _FoDobInputState extends State<BeDobInput> {
  DateTime? _selectedDate;
  bool _showAgeError = false;

  void _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        widget.controller.text =
            DateFormat('yyyy-MM-dd').format(_selectedDate!);
        _showAgeError = _calculateAge(_selectedDate!) < 16;
        if (widget.onChanged != null) {
          widget.onChanged!(_selectedDate!);
        }
      });
    }
  }

  int _calculateAge(DateTime dob) {
    DateTime now = DateTime.now();
    int age = now.year - dob.year;
    if (now.month < dob.month ||
        (now.month == dob.month && now.day < dob.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration:
              _showAgeError ? Decor().onlyBorderError() : Decor().onlyBorder(),
          margin: const EdgeInsets.all(5),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
                decoration: Decor().inputDecor('Date of Birth',
                    prefix: Icons.calendar_month_rounded, showPrefix: true),
                style: TextDecor().inputTextStyle(),
                textInputAction: TextInputAction.search,
                autocorrect: false,
                autofocus: false,
                readOnly: true,
                onTap: () => _showDatePicker(context),
                controller: widget.controller),
          ),
        ),
        _showAgeError
            ? Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: const Text(
                  'Age must be 16 years or older',
                  style: TextStyle(color: AppColors.error),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
