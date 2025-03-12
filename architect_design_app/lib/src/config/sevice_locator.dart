import 'package:get_it/get_it.dart';
import '../ui/data/datasources/firebase/auth_google.dart';

GetIt locator = GetIt.instance;
class ServiceLocator {
  static void init() {
    // locator.registerLazySingleton(() => RepositoryAuth());
    // locator export folder data
    // locator export folder domain
    // locator export folder infrastructure
    // locator export folder presentation
    locator.registerLazySingleton(() => AuthGoogle());
    
  }

}