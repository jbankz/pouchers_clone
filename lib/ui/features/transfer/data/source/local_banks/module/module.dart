import 'package:riverpod/riverpod.dart';

import '../../../../../../../app/core/network/module/network_module.dart';
import '../local_bank_source.dart';
import '../local_bank_source_impl.dart';

final localBankSourceModule = Provider<LocalBankSource>((ref) =>
    LocalBankSourceImpl(networkService: ref.watch(networkServiceProvider)));
