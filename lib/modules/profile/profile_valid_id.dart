import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/models/profile_model.dart';
import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:Pouchers/modules/account/screens/two_factor_auth/copy_code.dart';
import 'package:Pouchers/modules/profile/profile_modal.dart';
import 'package:Pouchers/modules/profile/profile_success.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ValidId extends ConsumerStatefulWidget {
  static const String routeName = "validId";
  final String? from;

  ValidId({Key? key, this.from}) : super(key: key);

  @override
  ConsumerState<ValidId> createState() => _ValidIdState();
}

class _ValidIdState extends ConsumerState<ValidId> {
  String _prefixText = idMethod;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _id;
  String error = "";

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: validId,
      child: ListenerPage(
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
                    inkWell(
                      onTap: () async {
                        var result = await buildShowModalBottomSheet(
                            context,
                            ProfileModal(
                              methods: idMethodList,
                            ));
                        if (result != null) {
                          if (result.contains("VNIN")) {
                            setState(() => _prefixText = "Virtual NIN");
                          } else {
                            setState(() => _prefixText = result);
                          }
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: kRegularPadding,
                            vertical: kRegularPadding),
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
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 30,
                              color: kSecondaryTextColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: kMicroPadding,
                    ),
                    TextInputNoIcon(
                      textTheme: textTheme,
                      widget: SizedBox(),
                      addSpace: false,
                      hintText: enterIdNumber,
                      onSaved: (val) => setState(() => _id = val),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return emptyField;
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: kSmallPadding,
                    ),
                    error == ""
                        ? SizedBox()
                        : Text(
                            error,
                            style: textTheme.headline3!
                                .copyWith(color: kLightOrange),
                          ),
                    SizedBox(
                      height: kSmallPadding,
                    ),
                    Text(
                      "or",
                      style: textTheme.headline3!.copyWith(color: kIconGrey),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: kSmallPadding,
                    ),
                    Center(
                      child: inkWell(
                        onTap: () async {
                          var result = await startDojahWidget(
                            context,
                            type: "custom",
                            config: configObj,
                          );
                          if (result != null) {
                            ref.read(validateIDProvider.notifier).validateID(
                                isUpload: true,
                                firstName: result["firstName"],
                                lastName: result["lastName"],
                                dob: result["dob"],
                                idType: result["docType"]
                                        .toString()
                                        .contains("Driving")
                                    ? "drivers_license"
                                    : result["docType"]
                                            .toString()
                                            .contains("Voter Card")
                                        ? "voters_card"
                                        : result["docType"]
                                                .toString()
                                                .contains("Passport")
                                            ? "passport"
                                            : result["docType"]
                                                    .toString()
                                                    .contains("Id Card")
                                                ? "virtual nin"
                                                : _prefixText.toLowerCase(),
                                idNumber: result["docNo"]);
                          }
                        },
                        child: Container(
                          width: 130,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(kRegularPadding),
                          decoration: BoxDecoration(
                              borderRadius: kBorderRadius,
                              border:
                                  Border.all(color: kLightPurple, width: 1)),
                          child: Row(
                            children: [
                              SvgPicture.asset(AssetPaths.uploadIcon),
                              SizedBox(
                                width: kSmallPadding,
                              ),
                              Text(
                                "Upload ID",
                                style:
                                    textTheme.headline2!.copyWith(fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              _prefixText == "Virtual NIN"
                  ? Expanded(
                      child: ListView(
                        children: [
                          Center(
                            child: Text(
                              "How to get your Virtual NIN",
                              style: textTheme.headline1!.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: kMacroPadding,
                          ),
                          CopyCodeRow(
                            textTheme: textTheme,
                            text: vNin1,
                          ),
                          SizedBox(
                            height: kMediumPadding,
                          ),
                          CopyCodeRow(
                            textTheme: textTheme,
                            text: vNin2,
                          ),
                          SizedBox(
                            height: kMediumPadding,
                          ),
                          CopyCodeRow(
                            textTheme: textTheme,
                            text: vNin3,
                          ),
                          SizedBox(
                            height: kMediumPadding,
                          ),
                          CopyCodeRow(
                            textTheme: textTheme,
                            text: vNin4,
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                height: kMediumPadding,
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
                    ref.read(editProfileInHouseProvider.notifier).state =
                        EditProfileData.fromJson(next.data!.data!.toJson());
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
                            isUpload: false,
                            idType: _prefixText == "Driver’s license"
                                ? "drivers_license"
                                : _prefixText == "Voter’s card"
                                    ? "voters_card"
                                    : _prefixText.contains("passport")
                                        ? "passport"
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
      ),
    );
  }
}
