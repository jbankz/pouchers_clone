import 'package:Pouchers/ui/features/utilities/domain/dto/billers_dto.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/airtime_top_deals.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/billers.dart';
import 'package:Pouchers/ui/features/utilities/domain/model/validate_customer.dart';
import 'package:Pouchers/ui/features/utilities/domain/usecase/module/module.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/dto/mobile_dto.dart';
import '../../../domain/model/cable_service.dart';
import '../../../domain/model/discounts.dart';
import '../../../domain/model/get_cable_service.dart';
import '../../../domain/model/mobile_data_services.dart';
import '../../../domain/model/schedule.dart';
import '../../../domain/model/utility.dart';

part 'module.g.dart';

@riverpod
Future<List<Billers>> billers(BillersRef ref,
        {required BillersDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(getBillersUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<Discounts?> billersDiscounts(BillersDiscountsRef ref,
        {required BillersDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(getBillersDiscountsUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
List<AirtimeTopDeals> airtimeTopDeals(AirtimeTopDealsRef ref) =>
    ref.read(getTopDealsUseCaseModule).execute();

@riverpod
Future<Utility?> utilityPurchase(UtilityPurchaseRef ref,
        {required MobileDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(purchaseUtilityUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<List<MobileOperatorServices>> mobileDataServices(
        MobileDataServicesRef ref,
        {required MobileDto parameter,
        CancelToken? cancelToken}) async =>
    await ref
        .read(getMobileDataServicesUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<Schedule?> schedule(ScheduleRef ref,
        {required MobileDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(scheduleUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<GetCableService> cableServices(CableServicesRef ref,
        {required BillersDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(getCableServiceUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);

@riverpod
Future<ValidateCustomer> validateCustomerInfo(ValidateCustomerInfoRef ref,
        {required BillersDto parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(validateCustomerInfoUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);
