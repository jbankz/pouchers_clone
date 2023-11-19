import 'package:riverpod/riverpod.dart';

import '../../../../../../../app/core/network/module/network_module.dart';
import '../wallet_source.dart';
import '../wallet_source_impl.dart';

final walletSourceModule = Provider<WalletSource>((ref) =>
    WalletSourceImpl(networkService: ref.watch(networkServiceProvider)));
