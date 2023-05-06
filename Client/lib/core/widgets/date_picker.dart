import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../custom_colors.dart';

/// [DatePicker] is a widget that displays a calendar dialog that allows the user to select a date.
class DatePicker extends StatefulWidget {
  const DatePicker({
    super.key,
    required this.labelText,
    this.mandatory,
    this.defaultDate,
    this.formFieldKey,
    this.selectedDate,
    this.onDateSelected,
    this.startDate,
    this.endDate,
  });

  /// [labelText] is the placeholder text displayed in the [DatePicker] input field
  final String labelText;

  /// [mandatory] specifies if a value is either required for this field or not
  final bool? mandatory;

  /// [defaultDate] is the string value displayed if [mandatory] is true and
  /// a value was not selected.
  final String? defaultDate;

  /// [formFieldKey] is the key used for validating the input
  final GlobalKey<FormFieldState>? formFieldKey;

  /// [selectedDate] - the prefilled value of the input. If null, the input will be left empty.
  final DateTime? selectedDate;

  /// [callback] - the method called after a date value is selected
  final void Function(DateTime? val)? onDateSelected;

  /// [startDate] - the earliest date that can be selected in the [DatePicker]. If no value
  /// is provided, a default one is given.
  final DateTime? startDate;

  /// [endDate] - the last date that can be selected in the [DatePicker]. If no value
  /// is provided, a default one is given.
  final DateTime? endDate;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? selectedDate;
  late final TextEditingController textEditController;

  @override
  void initState() {
    selectedDate = widget.selectedDate;
    textEditController = TextEditingController(
      text: selectedDate != null
          ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
          : '',
    );
    super.initState();
  }

  @override
  void dispose() {
    textEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.formFieldKey,
      readOnly: true,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: const Icon(
          Icons.calendar_today_outlined,
          color: CustomColors.nroGreen,
        ),
      ),
      controller: textEditController,
      onTap: () => selectDate(context),
      validator: (value) {
        if (widget.mandatory == true && selectedDate == null) {
          return widget.defaultDate;
        }
        return null;
      },
    );
  }

  void selectDate(BuildContext context) async {
    final startDate = widget.startDate;
    final endDate = widget.endDate;

    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: setInitialDate(startDate),
      firstDate: startDate ??
          DateTime.now().subtract(
            const Duration(
              days: Constants.numberOfDaysAhead,
            ),
          ),
      lastDate: endDate ??
          (startDate != null
              ? startDate.add(
                  const Duration(
                    days: Constants.numberOfDaysAhead,
                  ),
                )
              : DateTime.now().add(
                  const Duration(
                    days: Constants.numberOfDaysAhead,
                  ),
                )),
      helpText: widget.labelText,
    );
    if (selected != null && selected != selectedDate) {
      if (!mounted) {
        return;
      }
      setState(() {
        selectedDate = selected;
        textEditController.text =
            '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}';
        if (widget.onDateSelected != null) {
          widget.onDateSelected!(selectedDate);
        }
      });
    }
  }

  /// The logic for setting an initial date is as follows:
  /// If the [selectedDate] has value, it will be displayed.
  /// If no date is selected, the [firstDate] will be displayed if
  /// its value is in the future. Otherwise, the today date will be displayed.
  DateTime setInitialDate(DateTime? firstDate) {
    if (selectedDate != null) {
      return selectedDate!;
    }
    var currentDate = DateTime.now();
    if (firstDate != null && currentDate.isBefore(firstDate)) {
      return firstDate;
    }
    return currentDate;
  }
}
