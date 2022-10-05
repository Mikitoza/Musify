class User {
  final int userId;
  final String nickname;
  final String login;
  final int userRole;
  final String password;

  const User({
    required this.userId,
    required this.login,
    required this.userRole,
    required this.nickname,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json['id'] as int,
        login: json['login'] as String,
        userRole: json['role'] as int,
        nickname: json['nickname'] as String,
        password: json['password'] as String,
      );

  @override
  Map<String, dynamic>? toJson() {
    return {
      'id': userId,
      'login': login,
      'role': userRole,
      'nickname': nickname,
      'password': password,
    };
  }
}
