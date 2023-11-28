import 'dart:io';

import 'package:Pouchers/app/app.locator.dart';
import 'package:Pouchers/app/core/manager/image_manager.dart';
import 'package:Pouchers/ui/common/app_strings.dart';
import 'package:Pouchers/ui/features/upload/presentation/notifier/module/module.dart';
import 'package:Pouchers/ui/notification/notification_tray.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../app/app.logger.dart';
import '../../../../../app/core/state/app_state.dart';
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
      _file = File(xfile.path);
      state = state.copyWith(data: _file);
    }
  }

  Future<bool> uploadFile(UploadDto uploadDto,
      [CancelToken? cancelToken]) async {
    if (_file == null) {
      triggerNotificationTray(AppString.pleasePickImage, error: true);
      return false;
    }

    try {
      state = state.copyWith(isBusy: true);

      await ref.read(uploadFileProvider
          .call(uploadDto: uploadDto, cancelToken: cancelToken)
          .future);
      state = state.copyWith(isBusy: false);
      return true;
    } catch (e) {
      _logger.e(e);
      state = state.copyWith(isBusy: false);
      return false;
    }
  }

  Future<void> uploadProfilePic(UploadDto uploadDto,
      [CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);

      await ref.read(uploadFileProvider
          .call(uploadDto: uploadDto, cancelToken: cancelToken)
          .future);
    } catch (e) {
      _logger.e(e);
      triggerNotificationTray(e.toString(), error: true);
    }
    state = state.copyWith(isBusy: false);
  }
}
