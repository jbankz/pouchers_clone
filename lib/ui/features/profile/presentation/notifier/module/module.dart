import 'package:pouchers/ui/features/profile/domain/model/bank_account_details/bank_account_details.dart';
import 'package:pouchers/ui/features/profile/domain/model/idenitification_type.dart';
import 'package:pouchers/ui/features/profile/domain/model/user.dart';
import 'package:pouchers/ui/features/profile/domain/model/wallet.dart';
import 'package:pouchers/ui/features/profile/domain/usecase/module/module.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/dto/user_dto.dart';
import '../../../domain/dto/wallet_dto.dart';
import '../../../domain/model/referral/referral.dart';

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

@riverpod
Future<Referral?> referral(ReferralRef ref, {CancelToken? cancelToken}) async =>
    await ref.read(referralUsecaseImpl).execute(cancelToken);

@riverpod
Future<bool> deleteAccount(DeleteAccountRef ref,
        {CancelToken? cancelToken}) async =>
    await ref.read(deleteAccountUsecaseImpl).execute(cancelToken);

@riverpod
Future<bool> disableAccount(DisableAccountRef ref, String reason,
        {CancelToken? cancelToken}) async =>
    await ref
        .read(disableAccountUsecaseImpl)
        .execute(parameter: reason, cancelToken: cancelToken);

@riverpod
Future<BankAccountDetails> validateBankAccount(
        ValidateBankAccountRef ref, WalletDto walletDto,
        {CancelToken? cancelToken}) async =>
    await ref
        .read(validateAccountNumberUseCaseModule)
        .execute(parameter: walletDto, cancelToken: cancelToken);

@riverpod
Future<User?> getUserByTag(GetUserByTagRef ref,
        {required UserDto userDto, CancelToken? cancelToken}) async =>
    await ref
        .read(getUserByTagUseCaseModule)
        .execute(parameter: userDto, cancelToken: cancelToken);

@riverpod
Future<List<User>> getContacts(GetContactsRef ref,
        {required UserDto userDto, CancelToken? cancelToken}) async =>
    await ref
        .read(getContactsUseCaseModule)
        .execute(parameter: userDto, cancelToken: cancelToken);
