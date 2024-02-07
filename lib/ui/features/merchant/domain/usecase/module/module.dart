import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../app/core/usecase/poucher_usecase.dart';
import '../../../data/repository/module/merchants_repo_module.dart';
import '../get_mercants_usecase.dart';

final getMerchantsUseCaseModule = Provider<PoucherUseCaseWithOutParam>(
    (ref) => GetMerchantsUseCaseImpl(ref.read(merchantRepoModule)));
