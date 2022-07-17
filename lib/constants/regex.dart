// ignore_for_file: non_constant_identifier_names

class Regex{
  static final NOT_NUMBER = RegExp(r"[^\d]");
  static final SCRIPT = RegExp(r"AF_initDataCallback[\s\S]*?<\/script");
  static final KEY = RegExp(r"(ds:.*?)'");
  static final VALUE = RegExp(r"data:([\s\S]*?), sideChannel: {}}\);<\/");
  static final REVIEWS = RegExp(r"\)]}'\n\n([\s\S]+)");
  static final PERMISSIONS = RegExp(r"\)]}'\n\n([\s\S]+)");
}