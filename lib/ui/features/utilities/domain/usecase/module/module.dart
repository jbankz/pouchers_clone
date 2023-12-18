import 'package:Pouchers/ui/features/utilities/data/repository/module/billers_repo_module.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../app/core/usecase/poucher_usecase.dart';
import '../airtime_top_deals_usecase.dart';
import '../billers_usecase.dart';
import '../discounts_usecase.dart';
import '../mobile_data_services_usecase.dart';
import '../schedule_usecase.dart';
import '../utility_usecase.dart';

final getBillersUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => BillersUseCaseImpl(ref.read(billersRepoModule)));

final getBillersDiscountsUseCaseModule =
    Provider<PoucherUseCaseWithRequiredParam>(
        (ref) => BillersDiscountsUseCaseImpl(ref.read(billersRepoModule)));

final getTopDealsUseCaseModule = Provider<PoucherUseCaseWithOutParam>(
    (ref) => AirtimeTopDealsUseCaseImpl(ref.read(billersRepoModule)));

final purchaseUtilityUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => UtilityUseCaseImpl(ref.read(billersRepoModule)));

final getMobileDataServicesUseCaseModule =
    Provider<PoucherUseCaseWithRequiredParam>(
        (ref) => MobileDataServicesUseCaseImpl(ref.read(billersRepoModule)));

final scheduleUseCaseModule = Provider<PoucherUseCaseWithRequiredParam>(
    (ref) => ScheduleUseCaseImpl(ref.read(billersRepoModule)));
