
class AppError extends Error{
  final int code;

  final String message;

  AppError({this.code, this.message});
}