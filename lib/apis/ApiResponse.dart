class ApiResponse<T> {
  bool hasError;
  T data;

  ApiResponse({
    this.hasError,
    this.data
  });

}