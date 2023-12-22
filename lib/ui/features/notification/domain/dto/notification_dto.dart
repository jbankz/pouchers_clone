class NotificationDto {
  final int page;
  final int perPage;

  NotificationDto({this.page = 1, this.perPage = 25});

  Map<String, dynamic> toQuery() => {'page': page, 'per_page': perPage};
}
