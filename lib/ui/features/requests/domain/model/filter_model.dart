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
