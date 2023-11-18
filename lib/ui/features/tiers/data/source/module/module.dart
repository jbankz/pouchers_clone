import 'package:Pouchers/ui/features/tiers/data/source/tier_source.dart';
import 'package:Pouchers/ui/features/tiers/data/source/tier_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../app/core/network/module/network_module.dart';

final tierSourceModule = Provider<TierSource>(
    (ref) => TierSourceImpl(networkService: ref.watch(networkServiceProvider)));
