import 'package:Pouchers/ui/features/profile/domain/model/idenitification_type.dart';
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

@riverpod
List<IdentificationType> validIds(ValidIdsRef ref) =>
    ref.read(getValidIdsUseCaseModule).execute();

@riverpod
Future<User?> getUsersProfile(GetUsersProfileRef ref,
        {CancelToken? cancelToken}) async =>
    await ref.read(getUsersProfileUseCaseImpl).execute(cancelToken);

@riverpod
Future<User?> updateProfile(UpdateProfileRef ref,
        {required UserDto userDto, CancelToken? cancelToken}) async =>
    await ref
        .read(updateProfileUseCaseImpl)
        .execute(parameter: userDto, cancelToken: cancelToken);

@riverpod
Future<User?> changePhoneNumber(ChangePhoneNumberRef ref,
        {required UserDto userDto, CancelToken? cancelToken}) async =>
    await ref
        .read(changePhoneNumberUsecaseImpl)
        .execute(parameter: userDto, cancelToken: cancelToken);

@riverpod
Future<User?> requestPhoneNumberOtp(RequestPhoneNumberOtpRef ref,
        {required UserDto userDto, CancelToken? cancelToken}) async =>
    await ref
        .read(requestPhoneNumberOtpUsecaseImpl)
        .execute(parameter: userDto, cancelToken: cancelToken);

@riverpod
Future<User?> validatePhoneNumberOtp(ValidatePhoneNumberOtpRef ref,
        {required UserDto userDto, CancelToken? cancelToken}) async =>
    await ref
        .read(validatePhoneNumberOtpUsecaseImpl)
        .execute(parameter: userDto, cancelToken: cancelToken);
