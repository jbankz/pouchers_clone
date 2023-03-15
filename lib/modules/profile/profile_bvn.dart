import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/account/models/profile_model.dart';
import 'package:pouchers/modules/account/providers/account_provider.dart';
import 'package:pouchers/modules/account/screens/disable_account/disable_modal.dart';
import 'package:pouchers/modules/profile/profile_success.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class BVNPage extends StatefulWidget {
  static const String routeName = "bVNPage";
 final String? from;
  const BVNPage({Key? key, this.from}) : super(key: key);

  @override
  State<BVNPage> createState() => _BVNPageState();
}

class _BVNPageState extends State<BVNPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _bvn;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: bvn,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: kRegularPadding, vertical: kSmallPadding),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kSmallPadding),
                        color: kLightOrange100,
                        border: Border.all(color: kLightOrange200, width: 1)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info,
                          color: kColorYellow200,
                        ),
                        SizedBox(
                          width: kPadding,
                        ),
                        Expanded(
                          child: Text(
                            bvnWarning,
                            style: textTheme.headline2!.copyWith(
                              color: kLightOrange300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: kLargePadding,
                  ),
                  TextInputNoIcon(
                    textTheme: textTheme,
                    widget: SizedBox(),
                    hintText: enterBvn,
                    onSaved: (val) => setState(() => _bvn = val),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(11)
                    ],
                    validator: (val) {
                      if (val!.isEmpty) {
                        return emptyField;
                      } else if (val.length != 11) {
                        return bvnElevenDigits;
                      } else {
                        return null;
                      }
                    },
                  )
                ],
              ),
            ),
            Consumer(builder: (context, ref, _) {
              ref.listen(validateBvnProvider,
                  (previous, NotifierState<EditProfileResponse> next) {
                if (next.status == NotifierStatus.done) {
                  pushTo(
                      context,
                      ProfileSuccessful(
                        from: widget.from,
                        message: bvnSuccess,
                      ),
                      settings: const RouteSettings(
                          name: ProfileSuccessful.routeName));
                  ref.read(editProfileInHouseProvider.notifier).state = EditProfileData.fromJson(next.data!.data!.toJson());
                } else if (next.status == NotifierStatus.error) {
                  showErrorBar(context, next.message!);
                }
              });
              var _widget = LargeButton(
                  title: verifyBvn,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ref
                          .read(validateBvnProvider.notifier)
                          .validateBVN(bvn: _bvn!);
                    }
                  });
              return ref.watch(validateBvnProvider).when(
                    done: (data) => _widget,
                    loading: () => SpinKitDemo(),
                    error: (val) => _widget,
                  );
            }),
            SizedBox(
              height: kMacroPadding,
            ),
            inkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) {
                    return CommonModal(
                      buttonText: getBvn,
                      color: kPrimaryColor,
                      textTheme: Theme.of(context).textTheme,
                      title: cantRememberBvn,
                      subTitle: "",
                      widget: RichText(
                          text: TextSpan(
                              text: retrieveBvn,
                              style: textTheme.bodyText1!
                                  .copyWith(color: kIconGrey),
                              children: [
                            TextSpan(
                                text: retrieveBvnCode,
                                style: textTheme.subtitle1!.copyWith(
                                  fontWeight: FontWeight.w500,
                                )),
                            TextSpan(
                              text: retrieveBvnContd,
                              style: textTheme.bodyText1!
                                  .copyWith(color: kIconGrey),
                            ),
                          ])),
                    );
                  },
                );
              },
              child: Text(
                rememberBvn,
                style: textTheme.headline2,
              ),
            ),
            SizedBox(
              height: kRegularPadding,
            ),
          ],
        ),
      ),
    );
  }
}
