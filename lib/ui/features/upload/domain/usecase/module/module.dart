import 'package:pouchers/ui/features/upload/data/repository/module/module.dart';
import 'package:pouchers/ui/features/upload/domain/usecase/upload_usecase.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../app/core/usecase/poucher_usecase.dart';

final getUploadFileUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => UploadUseCaseImpl(uploadRepo: ref.read(uploadRepoModule)));
