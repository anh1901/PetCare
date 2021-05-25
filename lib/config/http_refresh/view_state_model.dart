import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:petcare/widgets/toast.dart';

import 'http_base.dart';
import 'view_state.dart';

class ViewStateModel extends ChangeNotifier {
  ViewStateModel({ViewState viewState})
      : _viewState = viewState ?? ViewState.idle {}

  bool _disposed = false;
  ViewStateError _viewStateError;
  ViewStateError get viewStateError => _viewStateError;
  ViewState _viewState;

  ViewState get viewState => _viewState;

  set viewState(ViewState viewState) {
    _viewStateError = null;
    _viewState = viewState;
    notifyListeners();
  }

  bool get isBusy => viewState == ViewState.busy;

  bool get isIdle => viewState == ViewState.idle;

  bool get isEmpty => viewState == ViewState.empty;

  bool get isError => viewState == ViewState.error;
  void setIdle() {
    viewState = ViewState.idle;
  }

  void setBusy() {
    viewState = ViewState.busy;
  }

  void setEmpty() {
    viewState = ViewState.empty;
  }

  void setError(e, stackTrace, {String message}) {
    ViewStateErrorType errorType = ViewStateErrorType.defaultError;

    if (e is DioError) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.sendTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        errorType = ViewStateErrorType.networkTimeOutError;
        message = e.error;
      } else if (e.type == DioErrorType.response ||
          e.type == DioErrorType.cancel) {
        message = e.error;
      } else {
        e = e.error;
        if (e is UnAuthorizedException) {
          stackTrace = null;
          errorType = ViewStateErrorType.unauthorizedError;
        } else if (e is NotSuccessException) {
          errorType = ViewStateErrorType.networkTimeOutError;
          message = e.message;
        } else {
          message = e.message;
        }
      }
    }

    viewState = ViewState.error;
    _viewStateError =
        ViewStateError(errorType, message: message, errorMessage: e.toString());
    onError(_viewStateError);
  }

  void onError(ViewStateError viewStateError) {}
  showErrorMessage(context, {String message}) {
    if (viewStateError != null || message != null) {
      if (viewStateError.isNetworkTimeOut) {
        message ??= '';
      } else {
        message ??= viewStateError.message;
      }
      Toast.showError(message);
    }
  }

  @override
  String toString() {
    return 'BaseModel{_viewState: $viewState, _viewStateError: $_viewStateError}';
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
