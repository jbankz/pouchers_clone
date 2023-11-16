import 'package:Pouchers/ui/features/profile/data/source/wallet_sorce.dart';
import 'package:Pouchers/ui/features/profile/data/source/wallet_sorce_impl.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../../../app/core/network/module/network_module.dart';

final walletSourceModule = Provider<WalletSource>((ref) =>
    WalletSourceImpl(networkService: ref.watch(networkServiceProvider)));
