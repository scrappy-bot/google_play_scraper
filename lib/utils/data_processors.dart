import 'package:html_unescape/html_unescape.dart';

// ignore: non_constant_identifier_names
unescape_text(String s) {
  HtmlUnescape htmlUnescape = HtmlUnescape();
  var text = htmlUnescape.convert(s.replaceAll("<br>", "\r\n"));
  return text;
}