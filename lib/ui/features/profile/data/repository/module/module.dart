import 'package:Pouchers/ui/features/profile/data/repository/user_repo_impl.dart';
import 'package:Pouchers/ui/features/profile/domain/repository/wallet_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/user_repo.dart';
import '../../source/user/module/module.dart';
import '../../source/wallet/module/module.dart';
import '../wallet_repo_impl.dart';

final walletRepoModule =
    Provider<WalletRepo>((ref) => WalletRepoImpl(ref.read(walletSourceModule)));

final userRepoModule =
    Provider<UserRepo>((ref) => UserRepoImpl(ref.read(userSourceModule)));
