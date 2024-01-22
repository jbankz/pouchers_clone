class ScheduleDto {
  final int page;
  final int perPage;
  final String? category;
  final String? scheduleId;
  ScheduleDto(
      {this.page = 1, this.perPage = 25, this.category, this.scheduleId});

  Map<String, dynamic> toQuery() => {
        // 'page': page,
        // 'per_page': perPage,
        if (category != null) 'category': category,
      };
}
