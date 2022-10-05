import 'package:musify_mobile/data/repositories/user_repository.dart';

import '../../data/models/user.dart';

class RegistrationUsecase {
  final UserRepository _userRepository;

  RegistrationUsecase(this._userRepository);

  Future<bool> registerUser(User user) async {
    final result = await _userRepository.register(user);
    if (result.isSuccess && result.data != null) {
      return true;
    }
    return false;
  }

  Future<bool> authorizeUser(User user) async {
    final result = await _userRepository.login(user);
    if (result.isSuccess && result.data != null) {
      print(result.data!);
      _userRepository.saveAuthToken(result.data!);
      return true;
    }
    return false;
  }
}
