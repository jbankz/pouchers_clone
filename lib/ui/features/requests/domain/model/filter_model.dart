class Filter {
  final String key;
  final String? value;

  Filter({required this.key, this.value});
}

List<Filter> requestFilter = [
  Filter(key: 'All'),
  Filter(key: 'Accepted', value: 'accepted'),
  Filter(key: 'Pending', value: 'pending'),
  Filter(key: 'Declined', value: 'declined')
];

List<Filter> monthFilter = [
  Filter(key: "January", value: "01"),
  Filter(key: "February", value: "02"),
  Filter(key: "March", value: "03"),
  Filter(key: "April", value: "04"),
  Filter(key: "May", value: "05"),
  Filter(key: "June", value: "06"),
  Filter(key: "July", value: "07"),
  Filter(key: "August", value: "08"),
  Filter(key: "September", value: "09"),
  Filter(key: "October", value: "10"),
  Filter(key: "November", value: "11"),
  Filter(key: "December", value: "12")
];
