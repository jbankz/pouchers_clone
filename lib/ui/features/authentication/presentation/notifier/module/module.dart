import 'package:pouchers/ui/features/authentication/domain/dto/two_fa_dto.dart';
import 'package:pouchers/ui/features/authentication/domain/model/create_tag_model/create_tag_model.dart';
import 'package:pouchers/ui/features/authentication/domain/model/generate_2fa_token.dart';
import 'package:pouchers/ui/features/authentication/domain/model/set_questions.dart';
import 'package:pouchers/ui/features/authentication/domain/model/sign_in_model/sign_in_model.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../profile/domain/model/user.dart';
import '../../../domain/dto/auth_dto.dart';
import '../../../domain/model/create_pin_model/create_pin_model.dart';
import '../../../domain/model/request_otp_model/request_otp_model.dart';
import '../../../domain/model/reset_password_model/reset_password_model.dart';
import '../../../domain/model/security_questions.dart';
import '../../../domain/model/selected_questions.dart';
import '../../../domain/model/validate_reset_password_model/validate_reset_password_model.dart';
import '../../../domain/model/sign_up_model/sign_up_model.dart';
import '../../../domain/model/verify_account_model/verify_account_model.dart';
import '../../../domain/usecase/module/module.dart';

part 'module.g.dart';

@riverpod
Future<SignUpModel?> signUpUser(SignUpUserRef ref,
        {required AuthDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(getSignUpUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<SignInModel?> signInUser(SignInUserRef ref,
        {required AuthDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(getSignInUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<RequestOtpModel?> requestOTP(RequestOTPRef ref,
        {required AuthDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(getRequestOtpUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<VerifyAccountModel?> verifyOTP(VerifyOTPRef ref,
        {required AuthDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(getVerifyAccountUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<CreateTagModel?> createTag(CreateTagRef ref,
        {required AuthDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(getCreateTagUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<CreatePinModel?> createTransactionPin(CreateTransactionPinRef ref,
        {required AuthDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(getCreatePinUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<bool> forgotPassword(ForgotPasswordRef ref,
        {required AuthDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(getForgotPasswordUseCaseImpl)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<ValidateResetPasswordModel> validateResetPassword(
        ValidateResetPasswordRef ref,
        {required AuthDto parameter,
        CancelToken? cancelToken}) async =>
    await ref
        .read(getValidateResetPasswordUseCaseImpl)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<ResetPasswordModel> resetPassword(ResetPasswordRef ref,
        {required AuthDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(getResetPasswordUseCaseImpl)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<bool> changePin(ChangePinRef ref,
        {required AuthDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(resetPinUseCaseImpl)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<bool> validatePin(ValidatePinRef ref,
        {required AuthDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(validatePinUseCaseImpl)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<List<SecurityQuestions>> securityQuestions(SecurityQuestionsRef ref,
        {CancelToken? cancelToken}) async =>
    await ref.read(getSecurityQuestionsUseCaseImpl).execute(cancelToken);

@riverpod
Future<List<SetQuestions>> answerQuestion(
        AnswerQuestionRef ref, TwoFaDto twoFaDto,
        {CancelToken? cancelToken}) async =>
    await ref
        .read(answerSecurityQuestionUseCaseImpl)
        .execute(parameter: twoFaDto, cancelToken: cancelToken);

@riverpod
Future<Generate2faToken> generateTwoFaToken(GenerateTwoFaTokenRef ref,
        {CancelToken? cancelToken}) async =>
    await ref.read(generate2faUseCaseImpl).execute(cancelToken);

@riverpod
Future<bool> validate2faCode(Validate2faCodeRef ref, TwoFaDto twoFaDto,
        {CancelToken? cancelToken}) async =>
    await ref
        .read(validate2faUseCaseImpl)
        .execute(parameter: twoFaDto, cancelToken: cancelToken);

@riverpod
Future<bool> validate2faAnswer(Validate2faAnswerRef ref, TwoFaDto twoFaDto,
        {CancelToken? cancelToken}) async =>
    await ref
        .read(validate2faQuestionUseCaseImpl)
        .execute(parameter: twoFaDto, cancelToken: cancelToken);

@riverpod
Future<List<SelectedQuestions>> selectedQuestions(SelectedQuestionsRef ref,
        {CancelToken? cancelToken}) async =>
    await ref.read(getSelectedQuestionsUseCaseImpl).execute(cancelToken);

@riverpod
Future<User?> disableTwoFa(DisableTwoFaRef ref, AuthDto authDto,
        {CancelToken? cancelToken}) async =>
    await ref
        .read(disable2faUseCaseImpl)
        .execute(parameter: authDto, cancelToken: cancelToken);
