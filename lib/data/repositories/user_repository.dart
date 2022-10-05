import 'package:musify_mobile/data/datasources/preference_data_source.dart';
import 'package:musify_mobile/data/datasources/remote_data_source.dart';
import 'package:musify_mobile/data/models/user.dart';
import 'package:musify_mobile/data/utils/wrapper.dart';

class UserRepository{
  final PreferenceDataSource _preferencesDataSource;
  final RemoteDataSource _remoteDataSource;

  UserRepository(this._preferencesDataSource, this._remoteDataSource);

  void clearAuthToken() {
    _preferencesDataSource.clearAuthToken();
  }

  Future<String?> applyAuthToken() {
    return _preferencesDataSource.getAuthToken().then((value) => _remoteDataSource.token = value);
  }

  void saveAuthToken(String token) {
    _remoteDataSource.token = token;
    _preferencesDataSource.saveAuthToken(token);
  }

  Future<Wrapper<String>> login(User user) async {
    return await _remoteDataSource.login(user);
  }

  Future<Wrapper<User>> register(User user) {
    return _remoteDataSource.register(user);
  }

  Future<Wrapper<String>> getLogin() {
    return _remoteDataSource.getLogin();
  }

  Future<Wrapper<List<User>>> getUsers() {
    return _remoteDataSource.getUsers();
  }
}