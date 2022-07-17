import 'package:http/http.dart' as http;

// custom exception

class NotFoundError extends Error {
  final String message;
  NotFoundError(this.message);
}

class ExtraHTTPError extends Error {
  final String message;
  ExtraHTTPError(this.message);
}

// ignore: non_constant_identifier_names
Get(String url) async {
  try {
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.statusCode == 404) {
      throw NotFoundError("App not found(404).");
    } else {
      throw ExtraHTTPError(
          "App not found. Status code ${res.statusCode} returned.");
    }
  } catch (e) {
    rethrow;
  }
}

// post(String url, dynamic data, Map<String, String> headers) async {
//   try {
//     Dio dio = Dio();
//     dio.options.headers = headers;
//     print('data: $data');
//     var res = await dio.post(url, data: data);
//     if (res.statusCode == 200) {
//       return res.data;
//     } else if (res.statusCode == 404) {
//       throw NotFoundError("App not found(404).");
//     } else {
//       throw ExtraHTTPError(
//           "App not found. Status code ${res.statusCode} returned.");
//     }
//   } catch (e) {
//     throw e;
//   }
// }

post(String url, dynamic data, Map<String, String> headers) async {
  try {
    var res = await http.post(Uri.parse(url), body: data, headers: headers);
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.statusCode == 404) {
      throw NotFoundError("App not found(404).");
    } else {
      throw ExtraHTTPError(
          "App not found. Status code ${res.statusCode} returned.");
    }
  } catch (e) {
    rethrow;
  }
}
