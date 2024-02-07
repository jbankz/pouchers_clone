class ScheduleFilter {
  final String key;
  final String? value;

  ScheduleFilter({required this.key, required this.value});
}

List<ScheduleFilter> scheduleFilters = [
  ScheduleFilter(key: 'All', value: null),
  ScheduleFilter(key: 'Airtime', value: 'airtime'),
  ScheduleFilter(key: 'Transfer', value: 'transfer'),
  ScheduleFilter(key: 'Data', value: 'data'),
  ScheduleFilter(key: 'Electricity', value: 'electricity'),
  ScheduleFilter(key: 'Cable', value: 'cable'),
  // ScheduleFilter(key: 'Internet', value: 'internet'),
  // ScheduleFilter(key: 'Betting', value: 'betting'),
];
