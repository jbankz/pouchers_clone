import 'package:pouchers/ui/features/merchant/domain/model/get_merchants.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/usecase/module/module.dart';

part 'module.g.dart';

@riverpod
Future<GetMerchant> getMerchants(GetMerchantsRef ref,
        {CancelToken? cancelToken}) async =>
    await ref.read(getMerchantsUseCaseModule).execute(cancelToken);
