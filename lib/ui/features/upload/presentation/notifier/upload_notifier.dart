import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pouchers/app/app.locator.dart';
import 'package:pouchers/app/config/app_helper.dart';
import 'package:pouchers/app/core/manager/image_manager.dart';
import 'package:pouchers/ui/common/app_strings.dart';
import 'package:pouchers/ui/features/profile/domain/dto/user_dto.dart';
import 'package:pouchers/ui/features/profile/presentation/notifier/module/module.dart';
import 'package:pouchers/ui/features/upload/presentation/notifier/module/module.dart';

import '../../../../../app/app.logger.dart';
import '../../../../../app/core/router/page_router.dart';
import '../../../../../app/core/state/app_state.dart';
import '../../../../notification/notification_tray.dart';
import '../../domain/dto/upload_dto.dart';

part 'upload_notifier.g.dart';

@riverpod
class UploadNotifier extends _$UploadNotifier {
  final _logger = getLogger('UploadNotifier');

  final ImageManager _imageManager = locator<ImageManager>();

  File? _file;

  @override
  AppState build() => const AppState();

  Future<void> pickImage() async {
    final xfile = await _imageManager.pickImage();

    if (xfile != null) {
      final String dir = path.dirname(xfile.path);
      final String newName = path.join(dir, '${DateTime.now()}.jpg');

      _file = File(xfile.path).renameSync(newName);
      state = state.copyWith(data: _file);
    }
  }

  Future<void> uploadFile(UploadDto uploadDto,
      [CancelToken? cancelToken]) async {
    if (_file == null) {
      AppHelper.handleError(AppString.pleasePickImage);
      return;
    }

    try {
      state = state.copyWith(isBusy: true);

      final imageUrl = await ref.read(uploadFileProvider
          .call(uploadDto: uploadDto, cancelToken: cancelToken)
          .future);

      await ref.read(updateProfileProvider
          .call(userDto: UserDto(utilityBill: imageUrl))
          .future);

      triggerNotificationTray(AppString.utilityUploadMessage);
      PageRouter.pop();
    } catch (e) {
      _logger.e(e);
      state = state.copyWith(isBusy: false);
    }
  }

  Future<void> uploadProfilePic(UploadDto uploadDto,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      final String imageUrl = await ref.read(uploadFileProvider
          .call(uploadDto: uploadDto, cancelToken: cancelToken)
          .future);

      await ref.read(updateProfileProvider
          .call(userDto: UserDto(profilePicture: imageUrl))
          .future);
    } catch (e) {
      _logger.e(e);
      AppHelper.handleError(e);
    } finally {
      state = state.copyWith(isBusy: false);
    }
  }
}
