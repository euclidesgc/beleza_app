import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:home/src/login/domain/entities/auth_params_entity.dart';
import 'package:home/src/login/domain/usecases/authorize_usecase.dart';
import 'package:package_manager/package_manager.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthorizeUsecase authorizeUsecase;

  LoginBloc({required this.authorizeUsecase}) : super(LoginInitial()) {
    on<LoginRequested>(onLoginRequested);
  }

  Future<void> onLoginRequested(
    LoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoadInProgress());

    try {
      final response = await authorizeUsecase.call(
        authParams: event.authParamsEntity,
      );
      log('$response', name: 'Response');
      //Colocar esse response na Session

      emit(LoginLoadSuccess());
    } catch (error, stack) {
      if (kDebugMode) {
        log('📛 Error', error: error, stackTrace: stack);
      }
      emit(LoginLoadFailure('Errou!'));
    }
  }
}
