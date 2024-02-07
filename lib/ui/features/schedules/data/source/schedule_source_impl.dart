import 'dart:io';

import 'package:Pouchers/ui/features/schedules/domain/dto/schedule_dto.dart';
import 'package:Pouchers/ui/features/schedules/domain/model/schedule_model.dart';
import 'package:Pouchers/ui/features/utilities/domain/dto/mobile_dto.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/network/api_path.dart';
import '../../../../../app/core/network/network_service.dart';
import 'schedule_source.dart';

class ScheduleSourceImpl implements ScheduleSource {
  final NetworkService networkService;

  ScheduleSourceImpl({required this.networkService});

  @override
  Future<List<ScheduleModel>> shedules(ScheduleDto scheduleDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: ApiPath.schedules,
        requestType: RequestType.get,
        queryParams: scheduleDto.toQuery(),
        cancelToken: cancelToken);
    return (response.data?['data'] as List<dynamic>)
        .map((e) => ScheduleModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<bool> deleteShedule(ScheduleDto scheduleDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: '${ApiPath.deleteSchedule}/${scheduleDto.scheduleId}',
        requestType: RequestType.delete,
        cancelToken: cancelToken);
    return response.statusCode == HttpStatus.ok;
  }

  @override
  Future<bool> updateSchedule(MobileDto mobileDto,
      {CancelToken? cancelToken}) async {
    final response = await networkService.request(
        path: '${ApiPath.schedule}/${mobileDto.scheduleId}',
        requestType: RequestType.patch,
        data: mobileDto.toJson(),
        cancelToken: cancelToken);
    return response.statusCode == HttpStatus.ok;
  }
}
