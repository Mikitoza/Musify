import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musify_mobile/data/models/user.dart';
import 'package:musify_mobile/presentation/app/navigation/app_router.gr.dart';
import 'package:musify_mobile/presentation/app/navigation/navigation_constants.dart';
import 'package:musify_mobile/presentation/di/injection.dart';
import 'package:musify_mobile/presentation/pages/login/login_state.dart';

import '../../../domain/usecases/registration_usercase.dart';


class LoginCubit extends Cubit<LoginState>{
  final RegistrationUsecase _registrationUsecase;
  final appRouter = i.get<AppRouter>();

  LoginCubit(this._registrationUsecase) : super(LoginState.initState());

  void register({required String password, required String username}) async {
    final result = await _registrationUsecase.registerUser(
      User(
        login: username,
        nickname: username,
        password: password,
        userRole: 0,
        userId: 0,
      ),
    );
  }


  void login({required String password, required String username}) async {
    final result = await _registrationUsecase.authorizeUser(
      User(
        login: username,
        nickname: username,
        password: password,
        userRole: 0,
        userId: 0,
      ),
    );
    result
        ? appRouter.replaceNamed(homePath)
        : emit(state.newState(showLoginError: true));
  }

  void reset() {
    emit(state.newState(showLoginError: false));
  }

  void resetValidationMessages() {
    emit(state.newState(showPasswordError: false, showUsernameError: false));
  }
}