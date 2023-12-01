import 'package:Pouchers/ui/features/authentication/data/repository/module/auth_repo_module.dart';
import 'package:Pouchers/ui/features/authentication/domain/usecase/request_otp_usecase.dart';
import 'package:Pouchers/ui/features/authentication/domain/usecase/sign_up_usecase.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../app/core/usecase/poucher_usecase.dart';
import '../create_pin_usecase.dart';
import '../create_tag_usecase.dart';
import '../forgot_password_usecase.dart';
import '../generate_two_fa_token_usecase.dart';
import '../reset_password_usecase.dart';
import '../reset_pin_usecase.dart';
import '../security_questions_usecase.dart';
import '../selected_questions_usecase.dart';
import '../set_questions_usecase.dart';
import '../validate_pin_usecase.dart';
import '../validate_reset_password_usecase.dart';
import '../sign_in_usecase.dart';
import '../validate_two_fa_answer_usecase.dart';
import '../validate_two_fa_code_usecase.dart';
import '../verify_account_usecase.dart';

final getSignUpUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => SignUpUseCaseImpl(ref.read(authRepoModule)));

final getSignInUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => SignInUseCaseImpl(ref.read(authRepoModule)));

final getVerifyAccountUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => VerifyAccountUseCaseImpl(ref.read(authRepoModule)));

final getRequestOtpUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => RequestOtpUseCaseImpl(ref.read(authRepoModule)));

final getCreateTagUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => CreateTagUseCaseImpl(ref.read(authRepoModule)));

final getCreatePinUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => CreatePinUseCaseImpl(ref.read(authRepoModule)));

final getForgotPasswordUseCaseImpl = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => ForgotPasswordUseCaseImpl(ref.read(authRepoModule)));

final getValidateResetPasswordUseCaseImpl =
    Provider<PoucherUseCaseWithRequiredParam>(
        (ref) => ValidateResetPasswordUseCaseImpl(ref.read(authRepoModule)));

final getResetPasswordUseCaseImpl = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => ResetPasswordUseCaseImpl(ref.read(authRepoModule)));

final resetPinUseCaseImpl = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => ResetUseCaseImpl(ref.read(authRepoModule)));

final validatePinUseCaseImpl = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => ValidatePinUseCaseImpl(ref.read(authRepoModule)));

final getSecurityQuestionsUseCaseImpl = Provider<PoucherUseCaseWithOutParam>(
    (ref) => SecurityQuestionsUseCaseImpl(ref.read(authRepoModule)));

final getSelectedQuestionsUseCaseImpl = Provider<PoucherUseCaseWithOutParam>(
    (ref) => SelectedQuestionsUseCaseImpl(ref.read(authRepoModule)));

final answerSecurityQuestionUseCaseImpl =
    Provider<PoucherUseCaseWithRequiredParam>(
        (ref) => AnswerQuestionsUseCaseImpl(ref.read(authRepoModule)));

final validate2faQuestionQuestionUseCaseImpl =
    Provider<PoucherUseCaseWithRequiredParam>(
        (ref) => ValidateTwoFaQuestionUseCaseImpl(ref.read(authRepoModule)));

final generate2faUseCaseImpl = Provider<PoucherUseCaseWithOutParam>(
    (ref) => GenerateTwoFaUseCaseImpl(ref.read(authRepoModule)));

final validate2faUseCaseImpl = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => ValidateTwoFaCodeUseCaseImpl(ref.read(authRepoModule)));
