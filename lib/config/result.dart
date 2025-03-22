// lib/core/utils/result.dart

import 'package:erelis/config/failures.dart';

class Result<T> {
  final T? data;
  final Exception? error;

  Result({this.data, this.error});

  bool get isSuccess => error == null && data != null;
  bool get isError => error != null;

  // Método fold similar al de Either
  R fold<R>(R Function(Exception) onError, R Function(T) onSuccess) {
    if (isError) {
      return onError(error!);
    } else {
      return onSuccess(data as T);
    }
  }
}

class Success<T> extends Result<T> {
  final T value;

  Success(this.value);

  R when<R>({
    required R Function(T) success,
    required R Function(Failure) error,
  }) {
    return success(value);
  }
}

class Error<T> extends Result<T> {
  final Failure failure;

  Error(this.failure);

  R when<R>({
    required R Function(T) success,
    required R Function(Failure) error,
  }) {
    return error(failure);
  }
}
