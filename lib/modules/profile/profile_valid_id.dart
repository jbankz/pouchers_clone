import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/account/models/profile_model.dart';
import 'package:pouchers/modules/account/providers/account_provider.dart';
import 'package:pouchers/modules/profile/profile_modal.dart';
import 'package:pouchers/modules/profile/profile_success.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class ValidId extends StatefulWidget {
  static const String routeName = "validId";
  final String? from;

  ValidId({Key? key, this.from}) : super(key: key);

  @override
  State<ValidId> createState() => _ValidIdState();
}

class _ValidIdState extends State<ValidId> {
  String _prefixText = idMethod;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _id;
  String error = "";

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: validId,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    validIdSub,
                    style: textTheme.headline3!.copyWith(
                      color: kIconGrey,
                    ),
                  ),
                  SizedBox(
                    height: kMacroPadding,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: kRegularPadding, vertical: kRegularPadding),
                    decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(kSmallPadding)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            _prefixText,
                            style: textTheme.subtitle1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        inkWell(
                            onTap: () async {
                              final result = await buildShowModalBottomSheet(
                                  context,
                                  ProfileModal(
                                    methods: idMethodList,
                                  ));
                              if (result != null) {
                                setState(() => _prefixText = result);
                              }
                            },
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 30,
                              color: kSecondaryTextColor,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: kMicroPadding,
                  ),
                  TextInputNoIcon(
                    textTheme: textTheme,
                    widget: SizedBox(),
                    hintText: enterIdNumber,
                    onSaved: (val) => setState(() => _id = val),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return emptyField;
                      } else {
                        return null;
                      }
                      ;
                    },
                  ),
                  SizedBox(
                    height: kPadding,
                  ),
                  error == ""
                      ? SizedBox()
                      : Text(
                          error,
                          style: textTheme.headline3!
                              .copyWith(color: kLightOrange),
                        )
                ],
              ),
            ),
            Consumer(builder: (context, ref, _) {
              ref.listen(validateIDProvider,
                  (previous, NotifierState<EditProfileResponse> next) {
                if (next.status == NotifierStatus.done) {
                  pushTo(
                      context,
                      ProfileSuccessful(
                        from: widget.from,
                        message: idSuccess,
                      ),
                      settings: const RouteSettings(
                          name: ProfileSuccessful.routeName));
                  print("uitlrknkfnk djnjd${next.data!.data!.utilityBill}");
                  ref.read(editProfileInHouseProvider.notifier).state = EditProfileData.fromJson(next.data!.data!.toJson());

                } else if (next.status == NotifierStatus.error) {
                  setState(() {
                    error = next.message ?? "";
                  });
                }
              });
              var _widget = LargeButton(
                  title: confirm,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      error = "";
                    });
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ref.read(validateIDProvider.notifier).validateID(
                          idType: _prefixText == "Driver’s license"
                              ? "drivers_license"
                              : _prefixText == "Voter’s card"
                                  ? "voters_card"
                                  : _prefixText.toLowerCase(),
                          idNumber: _id!);
                    }
                  });
              return ref.watch(validateIDProvider).when(
                  done: (done) => _widget,
                  loading: () => SpinKitDemo(),
                  error: (val) => _widget);
            }),
          ],
        ),
      ),
    );
  }
}
