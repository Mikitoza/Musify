class LoginState {
  final bool showLoginError;
  final bool showPasswordError;

  const LoginState({
    required this.showLoginError,
    required this.showPasswordError,
  });


  LoginState.initState()
      : this(
    showLoginError: false,
    showPasswordError: false,
  );

  LoginState newState({bool? showLoginError, bool? showPasswordError, bool? showUsernameError}) {
    return LoginState(
      showLoginError: showLoginError ?? this.showLoginError,
      showPasswordError: showPasswordError ?? this.showPasswordError,
    );
  }
}
