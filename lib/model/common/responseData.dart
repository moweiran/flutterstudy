class ResponseData<T> {
  T data;
  ResponseData({this.data});
  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(data: json['data']);
  }
}
