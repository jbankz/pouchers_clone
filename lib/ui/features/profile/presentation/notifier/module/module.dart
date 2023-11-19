import 'package:Pouchers/ui/features/profile/domain/model/user.dart';
import 'package:Pouchers/ui/features/profile/domain/model/wallet.dart';
import 'package:Pouchers/ui/features/profile/domain/usecase/module/module.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/dto/user_dto.dart';

part 'module.g.dart';

@riverpod
Future<Wallet?> walletBalance(WalletBalanceRef ref,
        {CancelToken? cancelToken}) async =>
    await ref.read(getWalletUseCaseModule).execute(cancelToken);

@riverpod
Future<User?> validateBVN(ValidateBVNRef ref,
        {required UserDto userDto, CancelToken? cancelToken}) async =>
    await ref
        .read(getValidateBVNUseCaseModule)
        .execute(parameter: userDto, cancelToken: cancelToken);

@riverpod
Future<User?> validateID(ValidateIDRef ref,
        {required UserDto userDto, CancelToken? cancelToken}) async =>
    await ref
        .read(getValidateIDUseCaseModule)
        .execute(parameter: userDto, cancelToken: cancelToken);
