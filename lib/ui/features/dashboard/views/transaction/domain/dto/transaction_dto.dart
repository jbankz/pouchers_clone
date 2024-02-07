class TransactionDto {
  final int? page;
  final int? perPage;
  final String? category;

  TransactionDto({this.page = 1, this.perPage = 25, this.category});

  Map<String, dynamic> toJson() => {
        if (page != null) 'page': page,
        if (perPage != null) 'per_page': perPage,
        if (category != null) 'category': category
      };
}
