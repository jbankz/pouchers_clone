import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/helpers/size_config.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/models/profile_model.dart';
import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:Pouchers/modules/profile/profile_success.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

class ProfileUtilityBill extends ConsumerStatefulWidget {
  final String? from;
  static const String routeName = "profileUtilityBill";

  const ProfileUtilityBill({Key? key, this.from}) : super(key: key);

  @override
  ConsumerState<ProfileUtilityBill> createState() => _ProfileUtilityBillState();
}

class _ProfileUtilityBillState extends ConsumerState<ProfileUtilityBill> {
  final picker = ImagePicker();
  XFile? pickedFile;
  String? selectedImage;
  String? selectedPath;
  bool isLoading = false;
  bool isImageUploaded = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: utilityBill,
      child: ListenerPage(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    utilityBillText,
                    style: textTheme.headline3!.copyWith(
                      color: kIconGrey,
                    ),
                  ),
                  SizedBox(
                    height: kMacroPadding,
                  ),
                  Container(
                    padding: EdgeInsets.all(kPadding),
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.circular(kSmallPadding),
                    ),
                    child: inkWell(
                      onTap: isLoading
                          ? null
                          : () {
                              getImage();
                            },
                      child: Row(
                        children: [
                          isLoading
                              ? SpinKitDemo()
                              : Consumer(builder: (context, ref, _) {
                                  ref.listen(getSignedProvider,
                                      (previous, NotifierState<String> next) {
                                    if (next.status == NotifierStatus.done) {
                                      upload(pickedFile!, next.data!);
                                    }
                                  });
                                  var _widget = Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal! * 35,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: kRegularPadding,
                                      ),
                                      decoration: BoxDecoration(
                                        color: kPrimaryWhite,
                                        borderRadius:
                                            BorderRadius.circular(kPadding),
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              AssetPaths.uploadIcon),
                                          SizedBox(
                                            width: kSmallPadding,
                                          ),
                                          Text(
                                            uploadFile,
                                            style: textTheme.headline2,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                  return ref.watch(getSignedProvider).when(
                                      done: (done) => _widget,
                                      loading: () => SpinKitDemo(),
                                      error: (val) => _widget);
                                }),
                          SizedBox(
                            width: kPadding,
                          ),
                          Expanded(
                            child: Text(
                              selectedImage == null ? "" : selectedImage!,
                              style: textTheme.subtitle1!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: kMediumPadding,
                  ),
                  buildUtilityRow(textTheme, utilityInstruction),
                  SizedBox(
                    height: kPadding,
                  ),
                  buildUtilityRow(textTheme, utilityInstruction2),
                ],
              ),
            ),
            Consumer(builder: (context, ref, _) {
              ref.listen(editProfileProvider,
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
                  // Navigator.pop(context);
                  // showSuccessBar(context, next.data!.message);
                  ref.read(editProfileInHouseProvider.notifier).state =
                      EditProfileData.fromJson(next.data!.data!.toJson());
                } else if (next.status == NotifierStatus.error) {
                  showErrorBar(context, next.message!);
                }
              });
              var _widget = LargeButton(
                  title: submit,
                  disableColor:
                      !isImageUploaded ? kPurpleColor100 : kPrimaryColor,
                  onPressed: !isImageUploaded
                      ? () {}
                      : () {
                          ref
                              .read(editProfileProvider.notifier)
                              .editProfile(utilityBill: selectedImage!);
                        });
              return ref.watch(editProfileProvider).when(
                  done: (done) => _widget,
                  loading: () => SpinKitDemo(),
                  error: (val) => _widget);
            })
          ],
        ),
      ),
    );
  }

  Row buildUtilityRow(TextTheme textTheme, String text) {
    return Row(
      children: [
        Container(
          height: kPadding,
          width: kPadding,
          decoration: BoxDecoration(color: kIconGrey, shape: BoxShape.circle),
        ),
        Text(
          text,
          style: textTheme.headline2!.copyWith(
            color: kIconGrey,
          ),
        ),
      ],
    );
  }

  Future<void> getImage() async {
    setState(() {
      isImageUploaded = false;
    });
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
      print(pickedFile!.name.substring(pickedFile!.name.lastIndexOf('.')));
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
          isImageUploaded = true;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      showErrorBar(context, 'Error uploading photo');
    }
  }
}
