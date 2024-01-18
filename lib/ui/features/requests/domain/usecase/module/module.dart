import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../app/core/usecase/poucher_usecase.dart';
import '../../../data/repository/module/request_repo_module.dart';
import '../request_usecase.dart';
import '../requested_money_usecase.dart';

final requestUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => RequestUseCaseImpl(requestRepo: ref.read(requestRepoModule)));

final requestedMoneyUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => RequestedUseCaseImpl(requestRepo: ref.read(requestRepoModule)));
