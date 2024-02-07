import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:Pouchers/app/app.router.dart';
import 'package:Pouchers/app/core/router/page_router.dart';
import 'package:Pouchers/ui/common/app_colors.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../ui/common/app_strings.dart';

enum ProfileOptionAction { viewImage, profileCamera, library, remove }

class ImagePickerHandler {
  Future<void> pickImage({required Function(XFile file) file}) async {
    final ProfileOptionAction? action = await _showModalBottomSheet();

    if (action == null) return;

    final getFile = await _handleProfileAction(action: action);
    if (getFile != null) file(getFile);
  }

  Future<ProfileOptionAction?> _showModalBottomSheet() async {
    final isAndroid = Platform.isAndroid;
    return await showModalBottomSheet(
      context: PageRouter.globalContext,
      showDragHandle: false,
      shape: isAndroid
          ? const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            )
          : null,
      backgroundColor: isAndroid ? null : Colors.transparent,
      builder: (context) => isAndroid
          ? _buildAndroidBottomSheet(context)
          : _buildIOSActionSheet(context),
    );
  }

  Widget _buildAndroidBottomSheet(BuildContext context) => BottomSheet(
        onClosing: () {},
        builder: (context) => Wrap(
          children: <Widget>[
            ListTile(
              title: const Center(
                  child: Text('View Profile Photo',
                      style: TextStyle(color: AppColors.kPrimaryBlack))),
              onTap: () => PageRouter.pop(ProfileOptionAction.viewImage),
            ),
            const Divider(),
            ListTile(
              title: const Center(
                  child: Text('Pick From Library',
                      style: TextStyle(color: AppColors.kPrimaryBlack))),
              onTap: () => PageRouter.pop(ProfileOptionAction.library),
            ),
            const Divider(),
            ListTile(
              title: const Center(
                  child: Text('Take A Photo',
                      style: TextStyle(color: AppColors.kPrimaryBlack))),
              onTap: () => PageRouter.pop(ProfileOptionAction.profileCamera),
            ),
            InkWell(
              onTap: () => PageRouter.pop(ProfileOptionAction.remove),
              child: Container(
                // width: context.size?.width,
                padding: const EdgeInsets.all(12.0),
                color: Colors.grey[200],
                child: const Center(
                    child: Text('Cancel',
                        style: TextStyle(color: AppColors.kPrimaryBlack))),
              ),
            ),
          ],
        ),
      );

  Widget _buildIOSActionSheet(BuildContext context) => CupertinoActionSheet(
        actions: <Widget>[
          CupertinoButton(
            child: const Text('View Profile Photo',
                style: TextStyle(color: AppColors.kPrimaryBlack)),
            onPressed: () => PageRouter.pop(ProfileOptionAction.viewImage),
          ),
          CupertinoButton(
            child: const Text('Pick From Library',
                style: TextStyle(color: AppColors.kPrimaryBlack)),
            onPressed: () => PageRouter.pop(ProfileOptionAction.library),
          ),
          CupertinoButton(
            child: const Text('Take A Photo',
                style: TextStyle(color: AppColors.kPrimaryBlack)),
            onPressed: () => PageRouter.pop(ProfileOptionAction.profileCamera),
          ),
        ],
        cancelButton: CupertinoButton(
          child: const Text('Cancel',
              style: TextStyle(color: AppColors.kPrimaryBlack)),
          onPressed: () => PageRouter.pop(),
        ),
      );

  Future<XFile?>? _handleProfileAction(
      {@required ProfileOptionAction? action}) async {
    switch (action!) {
      case ProfileOptionAction.viewImage:
        PageRouter.pushNamed(Routes.profileImageView);
        return null;
      case ProfileOptionAction.library:
        final permission = await Permission.photos.request();
        if (!(permission.isGranted)) await AppSettings.openAppSettings();

        return _getImage(ImageSource.gallery);
      case ProfileOptionAction.profileCamera:
        final permission = await Permission.camera.request();
        if (!(permission.isGranted)) await AppSettings.openAppSettings();

        return _getImage(ImageSource.camera);
      case ProfileOptionAction.remove:
        break;
    }
    return null;
  }

  Future<XFile?> _getImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    try {
      final pickedFile = await imagePicker.pickImage(
        source: source,
        preferredCameraDevice: CameraDevice.front,
        maxWidth: 1080,
        maxHeight: 1080,
        imageQuality: 50,
      );
      if (pickedFile != null) return await _cropImage(pickedFile);
    } catch (e) {
      debugPrint('Error: $e');
    }
    return null;
  }

  Future<XFile?> _cropImage(XFile imageFile) async {
    final img = ImageCropper();
    final croppedImage = await img.cropImage(
      sourcePath: imageFile.path,
      maxWidth: 1080,
      maxHeight: 1080,
      compressFormat: ImageCompressFormat.png,
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: AppString.appName,
          toolbarColor: Colors.black,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(minimumAspectRatio: 1.0),
      ],
    );
    final response = await _compressImageFiles(croppedImage!);

    return response;
  }

  Future<XFile?> _compressImageFiles(CroppedFile mFile) async {
    final dir = await _findLocalPath();
    final targetPath = "${dir.absolute.path}/${_generateKey(15)}.jpg";
    final XFile? result = await FlutterImageCompress.compressAndGetFile(
      mFile.path,
      targetPath,
      quality: 10,
    );
    return result;
  }

  Future<Directory> _findLocalPath() async {
    final directory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return directory!;
  }

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String _generateKey(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
