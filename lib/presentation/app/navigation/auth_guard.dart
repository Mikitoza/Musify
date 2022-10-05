import 'package:auto_route/auto_route.dart';
import 'package:musify_mobile/domain/usecases/navigation_usecase.dart';

import 'navigation_constants.dart';

class AuthorizationGuard extends AutoRouteGuard {
  final NavigationUsecase _navigationUsecase;

  AuthorizationGuard(this._navigationUsecase);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (await _navigationUsecase.isUserAuthorized()) {
      resolver.next(true);
    } else {
      router.replaceNamed(loginPath);
    }
  }
}
