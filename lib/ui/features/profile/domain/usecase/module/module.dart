import 'package:Pouchers/ui/features/profile/data/repository/module/module.dart';
import 'package:Pouchers/ui/features/profile/domain/usecase/get_contacts_usecase.dart';
import 'package:Pouchers/ui/features/profile/domain/usecase/request_phone_number_otp_usecase.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../app/core/usecase/poucher_usecase.dart';
import '../change_phone_number_usecase.dart';
import '../delete_account_usecase.dart';
import '../disable_account_usecase.dart';
import '../get_profile_by_tag_usecase.dart';
import '../get_profile_usecase.dart';
import '../referral_usecase.dart';
import '../update_profile_usecase.dart';
import '../valid_ids_usecase.dart';
import '../validate_account_number_usecase.dart';
import '../validate_bvn_usecase.dart';
import '../validate_id_usecase.dart';
import '../validate_phone_number_otp_usecase.dart';
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

final updateProfileUseCaseImpl = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => UpdateProfileUseCaseImpl(ref.read(userRepoModule)));

final requestPhoneNumberOtpUsecaseImpl =
    Provider<PoucherUseCaseWithRequiredParam>(
        (ref) => RequestPhoneNumberOtpUseCaseImpl(ref.read(userRepoModule)));

final changePhoneNumberUsecaseImpl = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => ChangePhoneNumberOtpUseCaseImpl(ref.read(userRepoModule)));

final validatePhoneNumberOtpUsecaseImpl =
    Provider<PoucherUseCaseWithRequiredParam>(
        (ref) => ValidatePhoneNumberOtpUseCaseImpl(ref.read(userRepoModule)));

final referralUsecaseImpl = Provider<PoucherUseCaseWithOutParam>(
    (ref) => ReferralUseCaseImpl(ref.read(userRepoModule)));

final deleteAccountUsecaseImpl = Provider<PoucherUseCaseWithOutParam>(
    (ref) => DeleteAccountUseCaseImpl(ref.read(userRepoModule)));

final disableAccountUsecaseImpl = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => DisableAccountUseCaseImpl(ref.read(userRepoModule)));

final validateAccountNumberUseCaseModule =
    Provider<PoucherUseCaseWithRequiredParam>((ref) =>
        ValidateBankAccountNumberUseCaseImpl(ref.read(walletRepoModule)));

final getUserByTagUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => GetProfileByTagUseCaseImpl(ref.read(userRepoModule)));

final getContactsUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => GetContactsUseCaseImpl(ref.read(userRepoModule)));
