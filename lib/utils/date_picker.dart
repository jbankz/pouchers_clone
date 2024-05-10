// ignore_for_file: use_build_context_synchronously

import 'package:pouchers/app/core/router/page_router.dart';
import 'package:pouchers/ui/common/app_colors.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum DateOptions { withTime, past, future, general }

String? _date;

pickDate(
    {@required ValueChanged<String>? onChange,
    bool showTime = false,
    DateOptions dateOptions = DateOptions.general}) async {
  final ThemeData theme = Theme.of(PageRouter.globalContext);
  switch (theme.platform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      return _buildMaterialDatePicker(
          date: onChange, showTime: showTime, dateOptions: dateOptions);
    case TargetPlatform.macOS:
    case TargetPlatform.iOS:
      return _buildCupertinoDatePicker(
          date: onChange, showTime: showTime, dateOptions: dateOptions);
  }
}

/// This builds material date picker in Android
Future<void> _buildMaterialDatePicker(
    {@required var date,
    bool showTime = false,
    DateOptions dateOptions = DateOptions.general}) async {
  final DateTime? picked = await showDatePicker(
    context: PageRouter.globalContext,
    initialDate: DateTime.now().add(const Duration(seconds: 1)),
    firstDate: _getFirstDate(dateOptions),
    lastDate: _getLastDate(dateOptions),
    builder: (context, child) => child ?? const SizedBox.shrink(),
  );
  if (picked != null && picked != date) {
    if (showTime) {
      final timer = await _selectTime();
      date('${DateFormat('dd-MM-yyyy').format(picked)} $timer');
    } else {
      date(DateFormat('dd-MM-yyyy').format(picked));
    }
    _date = DateFormat('dd-MM-yyyy').format(picked);
  }
}

_getFirstIOSDate(DateOptions dateOptions) {
  switch (dateOptions) {
    case DateOptions.general:
      return 1600;
    case DateOptions.past:
      return 1600;
    case DateOptions.future:
      return DateTime.now().year;
    default:
  }
}

_getLastIOSDate(DateOptions dateOptions) {
  switch (dateOptions) {
    case DateOptions.general:
      return 2025;
    case DateOptions.past:
      return DateTime.now().year;
    case DateOptions.future:
      return 2025;
    default:
  }
}

_getFirstDate(DateOptions dateOptions) {
  switch (dateOptions) {
    case DateOptions.general:
      return DateTime(1600);
    case DateOptions.past:
      return DateTime(1600);
    case DateOptions.future:
      return DateTime.now();
    default:
  }
}

_getLastDate(DateOptions dateOptions) {
  switch (dateOptions) {
    case DateOptions.general:
      return DateTime(2025);
    case DateOptions.past:
      return DateTime.now();
    case DateOptions.future:
      return DateTime(2025);
    default:
  }
}

_selectTime() async {
  final TimeOfDay? newTime = await showTimePicker(
      context: PageRouter.globalContext, initialTime: TimeOfDay.now());

  if (newTime != null) return newTime.format(PageRouter.globalContext);
  return TimeOfDay.now().format(PageRouter.globalContext);
}

/// This builds cupertino date picker in iOS
void _buildCupertinoDatePicker(
        {@required var date,
        bool showTime = false,
        DateOptions dateOptions = DateOptions.general}) =>
    showSheet(
      child: SizedBox(
        height: PageRouter.globalContext.height * .2,
        child: CupertinoDatePicker(
          mode: showTime
              ? CupertinoDatePickerMode.dateAndTime
              : CupertinoDatePickerMode.date,
          initialDateTime: DateTime.now(),
          minimumYear: _getFirstIOSDate(dateOptions),
          maximumYear: _getLastIOSDate(dateOptions),
          onDateTimeChanged: (picked) {
            if (picked != date) {
              if (showTime) {
                date(DateFormat('dd-MM-yyyy hh:mm a').format(picked));
              } else {
                date(DateFormat('dd-MM-yyyy').format(picked));
              }
            }
            _date = DateFormat('dd-MM-yyyy').format(picked);
          },
        ),
      ),
    );

Future<String?> showSheet({required Widget child}) => showCupertinoModalPopup(
      context: PageRouter.globalContext,
      builder: (context) => CupertinoActionSheet(
        actions: [child],
        cancelButton: CupertinoActionSheetAction(
            child: const Text('Done',
                style: TextStyle(color: AppColors.kPrimaryColor)),
            onPressed: () => PageRouter.pop(_date)),
      ),
    );
