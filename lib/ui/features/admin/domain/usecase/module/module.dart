import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../app/core/usecase/poucher_usecase.dart';
import '../../../data/repository/module/admin_repo_module.dart';
import '../banner_usecase.dart';
import '../envs_usecase.dart';

final getEnvsUseCaseModule = Provider<PoucherUseCaseWithOptionalParam>(
    (ref) => EnvsUseCaseImpl(ref.read(adminRepoModule)));

final getBannersUseCaseModule = Provider<PoucherUseCaseWithOutParam>(
    (ref) => BannerUseCaseImpl(ref.read(adminRepoModule)));
