import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/modules/account/models/profile_model.dart';
import 'package:pouchers/modules/account/providers/account_provider.dart';
import 'package:pouchers/modules/profile/profile_kyc.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class ChangePhoneNumber extends StatefulWidget {
  static const String routeName = "changePhoneNumber";

  const ChangePhoneNumber({
    Key? key,
  }) : super(key: key);

  @override
  State<ChangePhoneNumber> createState() => _ChangePhoneNumberState();
}

class _ChangePhoneNumberState extends State<ChangePhoneNumber> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _phone;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: changePhone,
      onTap: () {
        Navigator.popUntil(
            context, (route) => route.settings.name == ProfileKYC.routeName);
      },
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                changePhoneCaps,
                style: textTheme.headline1,
              ),
              SizedBox(
                height: kPadding,
              ),
              Text(
                newPhoneNo,
                style: textTheme.bodyText1!
                    .copyWith(fontWeight: FontWeight.normal, height: 1.6),
              ),
              SizedBox(
                height: kLargePadding,
              ),
              TextInputNoIcon(
                textTheme: textTheme,
                text: newPhoneText,
                hintText: phoneNumberText,
                onSaved: (val) => setState(() => _phone = val),
                validator: (val) {
                  if (val!.isEmpty) {
                    return emptyField;
                  } else if (val.length != 11) {
                    return elevenDigits;
                  } else {
                    return null;
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11)
                ],
              ),
              SizedBox(
                height: kMacroPadding,
              ),
              Consumer(builder: (context, ref, _) {
                ref.listen(changePhoneProvider,
                    (previous, NotifierState<EditProfileResponse> next) {
                  if (next.status == NotifierStatus.done) {
                    showSuccessBar(context, next.data!.message);
                    Future.delayed(Duration(seconds: 3)).then((value) =>
                        Navigator.popUntil(
                            context,
                            (route) =>
                                route.settings.name == ProfileKYC.routeName));
                    ref.read(editProfileInHouseProvider.notifier).state =
                        EditProfileData.fromJson(next.data!.data!.toJson());
                  } else if (next.status == NotifierStatus.error) {
                    showErrorBar(context, next.message!);
                  }
                });

                var _widget = LargeButton(
                  title: save,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ref.read(changePhoneProvider.notifier).changePhone(
                            phoneNumber: _phone!,
                          );
                    }
                  },
                );
                return ref.watch(changePhoneProvider).when(
                    done: (done) => _widget,
                    loading: () => SpinKitDemo(),
                    error: (val) => _widget);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
