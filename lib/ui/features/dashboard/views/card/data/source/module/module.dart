import 'package:pouchers/ui/features/dashboard/views/card/data/source/card_source.dart';
import 'package:pouchers/ui/features/dashboard/views/card/data/source/card_source_impl.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../../../../../app/core/network/module/network_module.dart';

final cardSourceModule = Provider<CardSource>(
    (ref) => CardSourceImpl(networkService: ref.watch(networkServiceProvider)));
