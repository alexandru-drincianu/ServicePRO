class PaginatedResult<T> {
  int rowscount;
  List<T> data;

  PaginatedResult({required this.rowscount, required this.data});

  factory PaginatedResult.fromJson(
    Map<String, dynamic> json,
    Function(Map<String, dynamic>) fromJson,
  ) {
    return PaginatedResult<T>(
      rowscount: json['rowsCount'],
      data: List<T>.from(
        json['data'].map((x) => fromJson(x)),
      ),
    );
  }
}
