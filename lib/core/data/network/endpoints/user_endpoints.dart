import 'package:quize/core/data/network/network_config.dart';

class UserEndpoints {
  static String login = NetworkConfig.getFullApiUrl('auth/login');
  static String register = NetworkConfig.getFullApiUrl('auth/register');
}


