import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/models/profile_model.dart';
import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:Pouchers/modules/account/screens/change_password/change_password.dart';
import 'package:Pouchers/modules/login/models/login_response.dart';
import 'package:Pouchers/modules/profile/profile_account_verification.dart';
import 'package:Pouchers/modules/profile/profile_tier_list.dart';
import 'package:Pouchers/modules/tab_layout/widgets/profile_widget.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/logger.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

class ProfileKYC extends ConsumerStatefulWidget {
  static const String routeName = "profileKYC";

  const ProfileKYC({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileKYC> createState() => _ProfileKYCState();
}

class _ProfileKYCState extends ConsumerState<ProfileKYC> {
  HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
  String? date;
  int? dateNumber = DateTime.now().year;
  int? userTierLevel;
  int? hiveTierLevel;
  List<int> dateTest = [];
  final picker = ImagePicker();
  XFile? pickedFile;

  final dateFormat = DateFormat('dd-MM-yyyy');
  DateTime maximumSelected = DateTime(3000, 12, 31);
  DateTime minimumSelected = DateTime(1800, 01, 31);
  String? selectedDate;
  String? selectedPath;
  String? selectedImage;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      for (int i = minimumSelected.year + 1;
          i < maximumSelected.year + 1;
          i++) {
        dateTest.add(i);
      }
      checkProvider();
      await checkTierLevel();
      setState(() {});
      logPrint("edit profile in house${ref.watch(editProfileInHouseProvider)}");
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    print(userProfile.address);
    return InitialPage(
      color: kPurpleColor800,
      title: profile,
      child: ListenerPage(
        child: ListView(
          children: [
            hiveTierLevel == 3
                ? SizedBox()
                : inkWell(
                    onTap: () {
                      pushTo(
                        context,
                        AccountVerificationStatus(),
                        settings: const RouteSettings(
                            name: AccountVerificationStatus.routeName),
                      ).then((value) {
                        checkTierLevel();
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: kRegularPadding, vertical: kSmallPadding),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kSmallPadding),
                          color: kLightOrange100,
                          border: Border.all(color: kLightOrange200, width: 1)),
                      child: Row(
                        children: [
                          SvgPicture.asset(AssetPaths.shieldIcon),
                          SizedBox(
                            width: kPadding,
                          ),
                          Expanded(
                            child: Text(
                              completeSetUp,
                              style: textTheme.headline2!.copyWith(
                                color: kLightOrange300,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              color: kLightOrange200, size: 18)
                        ],
                      ),
                    ),
                  ),
            SizedBox(
              height: kRegularPadding,
            ),
            isLoading
                ? SpinKitDemo()
                : Consumer(builder: (context, ref, _) {
                    ref.listen(editProfileProvider2,
                        (previous, NotifierState<EditProfileResponse> next) {
                      if (next.status == NotifierStatus.done) {
                        showSuccessBar(context, next.data!.message);
                        ref.read(editProfileInHouseProvider.notifier).state =
                            EditProfileData.fromJson(next.data!.data!.toJson());
                      }
                    });

                    var _widget = Consumer(builder: (context, ref, _) {
                      ref.listen(getSignedProvider,
                          (previous, NotifierState<String> next) {
                        if (next.status == NotifierStatus.done) {
                          upload(pickedFile!, next.data!);
                          print(next.data);
                        }
                      });
                      var _widget = inkWell(
                        onTap: isLoading
                            ? null
                            : () {
                                getImage();
                              },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(116),
                                child: ref
                                            .watch(editProfileInHouseProvider)
                                            .profilePicture ==
                                        null
                                    ? Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kPurple300),
                                        child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: kPrimaryWhite),
                                            child: Container(
                                                padding:
                                                    EdgeInsets.all(kSmallPadding),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: kPrimaryTextColor
                                                        .withOpacity(0.05)),
                                                child: Container(
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: kPurpleColor600,
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          height: kRegularPadding,
                                                          width: kRegularPadding,
                                                          decoration: BoxDecoration(
                                                              shape:
                                                                  BoxShape.circle,
                                                              color:
                                                                  kPrimaryTextColor),
                                                        ),
                                                        SizedBox(
                                                          height: 7,
                                                        ),
                                                        Container(
                                                          height: kRegularPadding,
                                                          width: 35,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          kSmallPadding),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          kPadding),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          kSmallPadding),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          kPadding)),
                                                              color:
                                                                  kPurpleColor500),
                                                        )
                                                      ],
                                                    ))))) : Image.network(
                                    ref
                                        .watch(editProfileInHouseProvider)
                                        .profilePicture ??
                                        "",
                                    fit: BoxFit.cover,
                                    height: 105,
                                    width: 105,
                                    errorBuilder: (context, _, st){
                                      return Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kPurple300),
                                          child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: kPrimaryWhite),
                                              child: Container(
                                                  padding:
                                                  EdgeInsets.all(kSmallPadding),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: kPrimaryTextColor
                                                          .withOpacity(0.05)),
                                                  child: Container(
                                                      padding: EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: kPurpleColor600,
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            height: kRegularPadding,
                                                            width: kRegularPadding,
                                                            decoration: BoxDecoration(
                                                                shape:
                                                                BoxShape.circle,
                                                                color:
                                                                kPrimaryTextColor),
                                                          ),
                                                          SizedBox(
                                                            height: 7,
                                                          ),
                                                          Container(
                                                            height: kRegularPadding,
                                                            width: 35,
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                        kSmallPadding),
                                                                    bottomLeft: Radius
                                                                        .circular(
                                                                        kPadding),
                                                                    topRight: Radius
                                                                        .circular(
                                                                        kSmallPadding),
                                                                    bottomRight: Radius
                                                                        .circular(
                                                                        kPadding)),
                                                                color:
                                                                kPurpleColor500),
                                                          )
                                                        ],
                                                      )))));
                                    },
                                    loadingBuilder: (BuildContext context, Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress.expectedTotalBytes !=
                                              null
                                              ? loadingProgress.cumulativeBytesLoaded /
                                              loadingProgress.expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              left: ref
                                          .watch(editProfileInHouseProvider)
                                          .profilePicture ==
                                      null
                                  ? 80
                                  : 90,
                              child: Icon(
                                Icons.add_circle,
                                size: 35,
                              ),
                            )
                          ],
                        ),
                      );
                      return ref.watch(getSignedProvider).when(
                          done: (done) => _widget,
                          loading: () => SpinKitDemo(),
                          error: (val) => _widget);
                    });
                    return ref.watch(editProfileProvider2).when(
                        done: (done) => _widget,
                        loading: () => SpinKitDemo(),
                        error: (val) => _widget);
                  }),
            SizedBox(
              height: kSmallPadding,
            ),
            Text(
              ref.watch(editProfileInHouseProvider).firstName == null
                  ? "${userProfile.firstName!.substring(0, 1).toUpperCase()}${userProfile.firstName!.substring(1).toLowerCase()} ${userProfile.lastName!.substring(0, 1).toUpperCase()}${userProfile.lastName!.substring(1).toLowerCase()}"
                  : "${ref.watch(editProfileInHouseProvider).firstName!.substring(0, 1).toUpperCase()}${ref.watch(editProfileInHouseProvider).firstName!.substring(1).toLowerCase()} ${ref.watch(editProfileInHouseProvider).lastName!.substring(0, 1).toUpperCase()}${ref.watch(editProfileInHouseProvider).lastName!.substring(1).toLowerCase()}",
              style: textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "@${userProfile.tag}",
              style: textTheme.bodyText1!.copyWith(
                color: kIconGrey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: kRegularPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: kSmallPadding, vertical: 2),
                  decoration: BoxDecoration(
                      color: kColorBackgroundLight,
                      border: Border.all(color: kPurpleColor700),
                      borderRadius: BorderRadius.circular(kSmallPadding)),
                  child: Text(
                    "$tier $hiveTierLevel",
                    style: textTheme.headline4!.copyWith(
                      color: kSecondaryPurple,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  width: kSmallPadding,
                ),
                hiveTierLevel == 3
                    ? SizedBox()
                    : inkWell(
                        onTap: () {
                          pushTo(
                            context,
                            PouchersTierList(
                              tier: hiveTierLevel,
                            ),
                            settings: const RouteSettings(
                              name: PouchersTierList.routeName,
                            ),
                          ).then((value) {
                            checkTierLevel();
                          });
                        },
                        child: Text(
                          upgradeNow,
                          style: textTheme.headline2!.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      )
              ],
            ),
            SizedBox(
              height: kMacroPadding,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: kRegularPadding,
                  right: kRegularPadding,
                  top: kMicroPadding,
                  bottom: kSmallPadding),
              decoration: BoxDecoration(
                  color: kPrimaryWhite,
                  borderRadius: BorderRadius.circular(kRegularPadding)),
              child: Column(
                children: [
                  KYCColumn(
                    textTheme: textTheme,
                    title: fullName,
                    subTitle: ref.watch(editProfileInHouseProvider).firstName ==
                            null
                        ? "${userProfile.firstName!.substring(0, 1).toUpperCase()}${userProfile.firstName!.substring(1).toLowerCase()} ${userProfile.lastName!.substring(0, 1).toUpperCase()}${userProfile.lastName!.substring(1).toLowerCase()}"
                        : "${ref.watch(editProfileInHouseProvider).firstName!.substring(0, 1).toUpperCase()}${ref.watch(editProfileInHouseProvider).firstName!.substring(1).toLowerCase()} ${ref.watch(editProfileInHouseProvider).lastName!.substring(0, 1).toUpperCase()}${ref.watch(editProfileInHouseProvider).lastName!.substring(1).toLowerCase()}",
                    onTap:
                    hiveTierLevel == 2 || hiveTierLevel == 3
                        ? null
                        :
                        () async {
                            final val = await showDialog(
                                context: context,
                                builder: (
                                  context,
                                ) {
                                  return ProfileKYCDialog(
                                    textTheme: textTheme,
                                    child:
                                        EditFullNameModal(textTheme: textTheme),
                                  );
                                });
                            setState(() {
                              checkTierLevel();
                            });
                          },
                  ),
                  KYCColumn(
                    textTheme: textTheme,
                    title: gender,
                    subTitle: ref.watch(editProfileInHouseProvider).gender == null
                        ? userProfile.gender ?? ""
                        : "${ref.watch(editProfileInHouseProvider).gender ?? ""}",
                    onTap: ref
                            .watch(editProfileInHouseProvider)
                            .isUploadedIdentityCard!
                        ? null
                        : () {
                            showDialog(
                                context: context,
                                builder: (
                                  context,
                                ) {
                                  return ProfileKYCDialog(
                                    textTheme: textTheme,
                                    child: GenderModal(textTheme: textTheme),
                                  );
                                });
                          },
                  ),
                  KYCColumn(
                    textTheme: textTheme,
                    title: phoneNumberText,
                    subTitle: ref.watch(editProfileInHouseProvider).phoneNumber ==
                            null
                        ? userProfile.phoneNumber ?? ""
                        : "${ref.watch(editProfileInHouseProvider).phoneNumber ?? ""}",
                    onTap: () {
                      pushTo(
                          context,
                          ChangePassword(
                            changePhone: true,
                          ),
                          settings: const RouteSettings(
                              name: ChangePassword.routeName));
                    },
                  ),
                  KYCColumn(
                    textTheme: textTheme,
                    title: address,
                    subTitle: ref.watch(editProfileInHouseProvider).address ==
                        null
                        ? "${userProfile.address}"
                        : "${ref.watch(editProfileInHouseProvider).address}",
                    onTap: () async {
                      final val = await showDialog(
                          context: context,
                          builder: (
                              context,
                              ) {
                            return ProfileKYCDialog(
                              textTheme: textTheme,
                              child:
                              EditAddressModal(textTheme: textTheme),
                            );
                          });
                      setState(() {
                        checkTierLevel();
                      });
                    },
                  ),
                  KYCColumn(
                    tierLevel: hiveTierLevel,
                    textTheme: textTheme,
                    title: idVerification,
                    subTitle: dataSuccess,
                    onTap: hiveTierLevel == 3
                        ? null
                        : () {
                            pushTo(
                              context,
                              AccountVerificationStatus(),
                              settings: const RouteSettings(
                                  name: AccountVerificationStatus.routeName),
                            ).then((value) {
                              checkTierLevel();
                            });
                          },
                  ),
                  KYCColumn(
                    textTheme: textTheme,
                    title: dateOfBirth,
                    subTitle: ref.watch(editProfileInHouseProvider).dob == null
                        ? userProfile.dob ?? ""
                        : "${ref.watch(editProfileInHouseProvider).dob ?? ""}",
                    onTap: () async {
                      final result = await buildShowModalBottomSheet(
                          context, BirthCalendar());
                      if (result != null) {
                        setState(() {
                          date = result;
                        });
                      }
                    },
                  ),
                  KYCColumn(
                    textTheme: textTheme,
                    title: poucherTag,
                    subTitle: "@${userProfile.tag}",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  checkProvider() {
    if (ref.watch(editProfileInHouseProvider).firstName == null) {
      ref.read(editProfileInHouseProvider.notifier).state = ref
          .read(editProfileInHouseProvider.notifier)
          .state
          .copyWith(
              profilePicture: userProfile.profilePicture,
              firstName: userProfile.firstName,
              lastName: userProfile.lastName,
              tierLevels: userProfile.tierLevels,
              address: userProfile.address,
              gender: userProfile.gender,
              tag: userProfile.tag,
              dob: userProfile.dob,
              phoneNumber: userProfile.phoneNumber,
              email: userProfile.email,
              utilityBill: userProfile.utilityBill,
              isLoginBiometricActive: userProfile.isLoginBiometricActive,
              isPaymentBiometricActive: userProfile.isPaymentBiometricActive,
              isUploadedIdentityCard: userProfile.isUploadedIdentityCard);

      ref.read(biometricProvider.notifier).state =
          ref.read(biometricProvider.notifier).state.copyWith(
                isPaymentBiometricActive: userProfile.isPaymentBiometricActive,
                isLoginBiometricActive: userProfile.isLoginBiometricActive,
              );
    } else {
      ref.read(editProfileInHouseProvider.notifier).state = ref
          .read(editProfileInHouseProvider.notifier)
          .state
          .copyWith(
              profilePicture:
                  ref.watch(editProfileInHouseProvider).profilePicture,
              firstName: ref.watch(editProfileInHouseProvider).firstName,
              lastName: ref.watch(editProfileInHouseProvider).lastName,
              tierLevels: ref.watch(editProfileInHouseProvider).tierLevels,
              address: ref.watch(editProfileInHouseProvider).address,
              gender: ref.watch(editProfileInHouseProvider).gender,
              tag: ref.watch(editProfileInHouseProvider).tag,
              dob: ref.watch(editProfileInHouseProvider).dob,
              phoneNumber: ref.watch(editProfileInHouseProvider).phoneNumber,
              email: ref.watch(editProfileInHouseProvider).email,
              utilityBill: ref.watch(editProfileInHouseProvider).utilityBill,
              isLoginBiometricActive:
                  ref.watch(editProfileInHouseProvider).isLoginBiometricActive,
              isPaymentBiometricActive: ref
                  .watch(editProfileInHouseProvider)
                  .isPaymentBiometricActive,
              isUploadedIdentityCard:
                  ref.watch(editProfileInHouseProvider).isUploadedIdentityCard);

      ref.read(biometricProvider.notifier).state =
          ref.read(biometricProvider.notifier).state.copyWith(
                isPaymentBiometricActive:
                    ref.watch(biometricProvider).isPaymentBiometricActive,
                isLoginBiometricActive:
                    ref.watch(biometricProvider).isLoginBiometricActive,
              );
    }
  }

  Future<void> getImage() async {
    pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 300,
        maxWidth: 300,
        imageQuality: 50);
    if (pickedFile == null) {
      return;
    } else if (pickedFile!.name.substring(pickedFile!.name.lastIndexOf('.')) !=
            ".jpg" &&
        pickedFile!.name.substring(pickedFile!.name.lastIndexOf('.')) !=
            ".jpeg" &&
        pickedFile!.name.substring(pickedFile!.name.lastIndexOf('.')) !=
            ".png") {
      showErrorBar(context, "Only JPG, PNG and JPEG files are allowed");
    } else {
      setState(() {
        selectedImage = pickedFile!.name;
        selectedPath = pickedFile!.path;
      });
      ref
          .read(getSignedProvider.notifier)
          .getSignedUrl(fileName: selectedImage!, isPhoto: true);
    }
  }

  Future<void> upload(XFile image, String url) async {
    try {
      setState(() {
        isLoading = true;
      });
      Uint8List bytes = await image.readAsBytes();
      var response = await http.put(Uri.parse(url), body: bytes);
      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
        ref.read(editProfileProvider2.notifier).editProfile(
            profilePicture:
                "https://poucher-upload.s3.amazonaws.com/$selectedImage");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      showErrorBar(context, 'Error uploading photo');
    }
  }

  checkTierLevel() {
    hiveTierLevel = ref.watch(editProfileInHouseProvider).tierLevels;
    userTierLevel = userProfile.tierLevels;
    if (hiveTierLevel != null) {
      if (userTierLevel! > hiveTierLevel!) {
        ref
            .read(editProfileInHouseProvider.notifier)
            .state
            .copyWith(tierLevels: userProfile.tierLevels);
      } else {
        setState(() {
          hiveTierLevel = ref.watch(editProfileInHouseProvider).tierLevels;
        });
      }
    } else {
      ref.read(editProfileInHouseProvider.notifier).state =
          ref.read(editProfileInHouseProvider.notifier).state.copyWith(
                tierLevels: userProfile.tierLevels,
              );
      setState(() {
        hiveTierLevel = ref.watch(editProfileInHouseProvider).tierLevels;
      });
    }
  }
}
