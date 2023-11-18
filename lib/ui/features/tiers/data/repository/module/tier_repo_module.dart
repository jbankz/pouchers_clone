import 'package:Pouchers/ui/features/tiers/domain/repository/tier_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../source/module/module.dart';
import '../tier_repo_impl.dart';

final tierRepoModule =
    Provider<TierRepo>((ref) => TierRepoImpl(ref.read(tierSourceModule)));
