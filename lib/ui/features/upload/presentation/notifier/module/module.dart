import 'package:pouchers/ui/features/upload/domain/dto/upload_dto.dart';
import 'package:pouchers/ui/features/upload/domain/usecase/module/module.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'module.g.dart';

@riverpod
Future<String> uploadFile(UploadFileRef ref,
        {required UploadDto uploadDto, CancelToken? cancelToken}) async =>
    await ref
        .read(getUploadFileUseCaseModule)
        .execute(parameter: uploadDto, cancelToken: cancelToken);
