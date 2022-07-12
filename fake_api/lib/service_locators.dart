
import 'package:fake_api/services/api_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocators() {
  locator.registerSingleton<ApiService>(ApiService());
  // locator.registerSingleton<AuthController>(AuthController());
}