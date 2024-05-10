import 'package:pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../../../utils/field_validator.dart';
import '../../../../../../common/app_strings.dart';
import '../../../../../../widgets/edit_text_field_with.dart';
import '../../../../../../widgets/elevated_button_widget.dart';
import '../../../../../../widgets/gap.dart';
import '../notifier/module/module.dart';
import 'bvn_requirement_view.form.dart';

@FormView(fields: [FormTextField(name: 'country'), FormTextField(name: 'bvn')])
class RequestBVNView extends ConsumerStatefulWidget {
  const RequestBVNView({super.key});

  @override
  ConsumerState<RequestBVNView> createState() => _RequestBVNViewState();
}

class _RequestBVNViewState extends ConsumerState<RequestBVNView>
    with $RequestBVNView {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    bvnFocusNode.requestFocus();
  }

  @override
  void dispose() {
    super.dispose();
    disposeForm();
  }

  @override
  Widget build(BuildContext context) {
    final param = ref.watch(paramModule);
    return Scaffold(
      appBar: AppBar(title: Text(param.appTitle)),
      body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    children: [
                      Text(AppString.bvnRequest,
                          style: context.titleLarge?.copyWith(fontSize: 14)),
                      const Gap(height: 31),
                      EditTextFieldWidget(
                        readOnly: true,
                        title: AppString.country,
                        controller: countryController..text = 'Nigeria',
                        validator: FieldValidator.validateString(),
                      ),
                      const Gap(height: 30),
                      EditTextFieldWidget(
                          title: AppString.bvn,
                          label: AppString.bvnInst,
                          keyboardType: TextInputType.number,
                          controller: bvnController,
                          focusNode: bvnFocusNode,
                          inputFormatters: [
                            context.limit(),
                            context.digitsOnly
                          ],
                          validator: FieldValidator.validateInt(limit: 11),
                          textInputAction: TextInputAction.go,
                          onFieldSubmitted: (_) => _submit()),
                    ],
                  ),
                ),
                ElevatedButtonWidget(
                    title: AppString.proceed, onPressed: _submit)
              ],
            ),
          )),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    ref.read(paramModule.notifier).setUsersInformations(
        country: countryController.text, bvn: bvnController.text);
  }
}
