import 'package:Pouchers/app/helpers/service_constants.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/flushbar.dart';
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
  String? _selectedMethod;
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
                            IdModal(
                              idTypes: idTypesList,
                            ));
                        if (result != null) {
                          setState(() {
                            _selectedMethod = result;
                          });
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
                                _selectedMethod ??
                                    "Select Identification Method",
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
                          if (_selectedMethod != null &&
                              _selectedMethod!.isNotEmpty) {
                            final fName =
                                ref.watch(editProfileInHouseProvider).firstName;
                            final lName =
                                ref.watch(editProfileInHouseProvider).lastName;
                            final dob =
                                ref.watch(editProfileInHouseProvider).dob;
                            var result = await startDojahWidget(
                              context,
                              type: "custom",
                              userData: fName != null &&
                                      fName.isNotEmpty &&
                                      lName != null &&
                                      lName.isNotEmpty &&
                                      dob != null &&
                                      dob.isNotEmpty
                                  ? {
                                      "first_name": fName,
                                      "last_name": lName,
                                      "dob":
                                          "${dob.split("-")[2]}-${dob.split("-")[1]}-${dob.split("-")[0]}",
                                    }
                                  : null,
                              config: {
                                "debug": false,
                                "mobile": true,
                                "widget_id": getWidgetId(_selectedMethod!),
                              },
                              govtDataVerification:
                                  _selectedMethod == "Driver’s license" ||
                                      _selectedMethod == "VNIN" ||
                                      _selectedMethod == "NIN",
                            );
                            if (result != null) {
                              ref.read(validateIDProvider.notifier).validateID(
                                  isUpload: true,
                                  firstName: result["firstName"],
                                  lastName: result["lastName"],
                                  dob: result["dob"],
                                  idType: result["docType"]
                                              .toString()
                                              .contains("Driving") ||
                                          result["docType"]
                                              .toString()
                                              .contains("dl")
                                      ? "drivers_license"
                                      : result["docType"]
                                              .toString()
                                              .contains("Voter Card")
                                          ? "voters_card"
                                          : result["docType"]
                                                  .toString()
                                                  .contains("Passport")
                                              ? "passport"
                                              : result["docType"].toString() ==
                                                      "nin"
                                                  ? "nin"
                                                  : result["docType"]
                                                              .toString() ==
                                                          "vnin"
                                                      ? "vnin"
                                                      : result["docType"]
                                                          .toString(),
                                  idNumber: result["docNo"]);
                            }
                          } else {
                            showErrorBar(context,
                                "Kindly select a means of Identification");
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
              _selectedMethod == "VNIN"
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
                              idType: _selectedMethod == "Driver’s license"
                                  ? "drivers_license"
                                  : _selectedMethod == "Voter’s card"
                                      ? "voters_card"
                                      : _selectedMethod ==
                                              "International passport"
                                          ? "passport"
                                          : _selectedMethod == "NIN"
                                              ? "nin"
                                              : _selectedMethod == "VNIN"
                                                  ? "vnin"
                                                  : "",
                              idNumber: _id!,
                            );
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

String? getWidgetId(String idSelection) {
  final testEnv = Env.getEnvironment() == EnvState.test;
  if (idSelection == "Driver’s license") {
    if (testEnv) {
      return "6508474a05a8aa004199cdcc";
    }
    return "6504156005a8aa0041787e21";
  }

  if (idSelection == "Voter’s card") {
    if (testEnv) {
      return "6508485633cd05004305b933";
    }
    return "6504160d05a8aa0041788d37";
  }

  if (idSelection == "International passport") {
    if (testEnv) {
      return "6508485633cd05004305b933";
    }
    return "6504232033cd050043e590c8";
  }

  if (idSelection == "VNIN") {
    if (testEnv) {
      return "6508474a05a8aa004199cdcc";
    }
    return "6504224805a8aa004179a3bc";
  }

  if (idSelection == "NIN") {
    if (testEnv) {
      return "6508474a05a8aa004199cdcc";
    }
    return "6508466205a8aa004199a494";
  }

  return null;
}
