import 'package:my_app/assets/colors.dart';
import 'package:my_app/commons/supports/data_local_service.dart';

const String appName = 'DQN';
String appLanguage = 'vi';
AppColor AppColors = AppLightTheme();

class Local {
  static DataLocalService dataLocal = DataLocalService();
}