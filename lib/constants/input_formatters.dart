//

class InputFormatters {
  static String patternName = r'^[\u0621-\u064Aa-zA-Z\d\-_\s]+';
  static String patternEmail =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static String patternNumber = r'[0-9]+.{8,}';
  static String patternNumberFelid = r'[0-9]+.{9,}';
  static String patternPassword = r'^[\u0621-\u064Aa-zA-Z\d\-_\s]+';

  static String phoneNumber =
      r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$';
}
