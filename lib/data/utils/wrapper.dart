class Wrapper<T> {
  final T? data;
  final String? errorMessage;
  final int status;

  Wrapper({this.data, this.errorMessage, this.status = 200});

  bool get isSuccess => status >= 200 && status < 400;
}
