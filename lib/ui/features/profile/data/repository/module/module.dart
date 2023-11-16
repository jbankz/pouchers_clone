import 'package:Pouchers/ui/features/profile/domain/repository/wallet_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../source/module/module.dart';
import '../wallet_repo_impl.dart';

final walletRepoModule =
    Provider<WalletRepo>((ref) => WalletRepoImpl(ref.read(walletSourceModule)));
