import 'package:pouchers/app/core/router/page_router.dart';
import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/app_strings.dart';
import '../../../../widgets/edit_text_field_with.dart';
import '../../../../widgets/gap.dart';
import 'transfer_to_poucher_note_sheet.form.dart';

@FormView(fields: [FormTextField(name: 'note')])
class TransferToPoucherNoteSheet extends ConsumerStatefulWidget {
  const TransferToPoucherNoteSheet({super.key});

  @override
  ConsumerState<TransferToPoucherNoteSheet> createState() =>
      _TransferToPoucherNoteSheetState();
}

class _TransferToPoucherNoteSheetState
    extends ConsumerState<TransferToPoucherNoteSheet>
    with $TransferToPoucherNoteSheet {
  final List<String> _emojis = ['🍕', '📚', '👜', '🚘', '🥰'];

  @override
  void initState() {
    super.initState();
    noteFocusNode.requestFocus();
  }

  @override
  void dispose() {
    super.dispose();
    disposeForm();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        minimum:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _emojis
                      .map((emojie) => InkWell(
                            onTap: () =>
                                setState(() => noteController.text += emojie),
                            customBorder: const CircleBorder(),
                            child: Container(
                              height: 44.h,
                              width: 44.w,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.kBackgroundColor),
                              child:
                                  Text(' $emojie', textAlign: TextAlign.center),
                            ),
                          ))
                      .toList()),
              const Gap(height: 20),
              EditTextFieldWidget(
                  controller: noteController,
                  focusNode: noteFocusNode,
                  title: AppString.sendTo,
                  titleWidget: const SizedBox.shrink(),
                  label: AppString.noteHint,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.go,
                  suffixIcon: IconButton(
                      onPressed: () => PageRouter.pop(noteController.text),
                      icon: Text(AppString.send,
                          style: context.titleMedium?.copyWith(
                              color: AppColors.kPrimaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 14))),
                  onFieldSubmitted: (value) =>
                      PageRouter.pop(noteController.text)),
              const Gap(height: 11),
            ],
          ),
        ),
      );
}
