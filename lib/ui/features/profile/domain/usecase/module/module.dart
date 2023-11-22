import 'package:Pouchers/ui/features/profile/data/repository/module/module.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../app/core/usecase/poucher_usecase.dart';
import '../get_profile_usecase.dart';
import '../valid_ids_usecase.dart';
import '../validate_bvn_usecase.dart';
import '../validate_id_usecase.dart';
import '../wallet_usecase.dart';

final getWalletUseCaseModule = Provider<PoucherUseCaseWithOutParam>(
    (ref) => WalletUseCaseImpl(ref.read(walletRepoModule)));

final getValidateBVNUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => ValidateBvnUseCaseImpl(ref.read(userRepoModule)));

final getValidateIDUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => ValidateIdUseCaseImpl(ref.read(userRepoModule)));

final getValidIdsUseCaseModule = Provider<PoucherUseCaseWithOutParam>(
    (ref) => ValidIdsUseCaseImpl(ref.read(validIdRepoModule)));

final getUsersProfileUseCaseImpl = Provider<PoucherUseCaseWithOutParam>(
    (ref) => GetProfileUseCaseImpl(ref.read(userRepoModule)));
