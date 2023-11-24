import 'package:Pouchers/ui/features/admin/domain/dto/admin_dto.dart';
import 'package:Pouchers/ui/features/admin/domain/model/envs/envs.dart';
import 'package:Pouchers/ui/features/admin/domain/usecase/module/module.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'module.g.dart';

@riverpod
Future<List<Envs>> envs(EnvsRef ref,
        {AdminDto? parameter, CancelToken? cancelToken}) async =>
    await ref
        .read(getEnvsUseCaseModule)
        .execute(parameter: parameter, cancelToken: cancelToken);
