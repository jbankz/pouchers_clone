import 'package:Pouchers/ui/features/tiers/data/repository/module/tier_repo_module.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../app/core/usecase/poucher_usecase.dart';
import '../tier_usecase.dart';

final getTierUseCaseModule = Provider<PoucherUseCaseWithOutParam>(
    (ref) => TierUseCaseImpl(ref.read(tierRepoModule)));
