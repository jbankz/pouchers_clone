import '../enum/request_type.dart';

class RequestDto {
  final int page;
  final int perPage;
  final RequestType requestType;
  final String? status;

  RequestDto(
      {this.page = 1,
      this.perPage = 25,
      required this.requestType,
      this.status});

  Map<String, dynamic> toQuery() => {
        'page': page,
        'per_page': perPage,
        'type': requestType.name,
        if (status != null) 'status': status
      };
}
