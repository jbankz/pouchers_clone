import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/model/tiers/data.dart';
import '../../../domain/usecase/module/module.dart';

part 'module.g.dart';

@riverpod
Future<Data?> tier(TierRef ref, {CancelToken? cancelToken}) async =>
    await ref.read(getTierUseCaseModule).execute(cancelToken);
