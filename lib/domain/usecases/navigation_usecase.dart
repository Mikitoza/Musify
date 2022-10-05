import 'package:musify_mobile/data/repositories/user_repository.dart';

class NavigationUsecase {
  final UserRepository _userRepository;

  NavigationUsecase(this._userRepository);

  @override
  Future<bool> isUserAuthorized() async {
    final token = await _userRepository.applyAuthToken();
    return token?.isNotEmpty == true;
  }
}
