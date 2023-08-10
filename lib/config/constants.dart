import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConfigConstants {
  ConfigConstants._();

  static const title = 'Github Explorer';
  static const fontFamily = 'Montserrat';
  static const imageExtensions = ['png', 'jpg', 'jpeg'];
  static const locales = [
    'en',
  ]; //Locales auto generated dont remove this comment

  //Desktop app (macOs/Linux/Windows)
  static const defaultWindowSizeWidth = 1366.00;
  static const defaultWindowSizeHeight = 768.00;
  static const minWindowSizeWidth = 500.00;
  static const minWindowSizeHeight = 800.00;

  //RWD
  static const mobileBreakpoint = 650.00;
  static const desktopBreakpoint = 1100.00;

  static var apiUrl = dotenv.env['API_URL'];
  static var token = dotenv.env['TOKEN'];
}
