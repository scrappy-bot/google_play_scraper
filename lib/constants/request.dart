// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

String Play_Store_Base_Url = "https://play.google.com";

class _Detail {
  String URL_FORMAT =
      "$Play_Store_Base_Url/store/apps/details?id={{app_id}}&hl={{lang}}&gl={{country}}";
  String FALLBACK_URL_FORMAT =
      "$Play_Store_Base_Url/store/apps/details?id={{app_id}}&hl={{lang}}";
  String build(
      {required String app_id, required String lang, required String country}) {
    return URL_FORMAT
        .replaceAll("{{app_id}}", app_id)
        .replaceAll("{{lang}}", lang)
        .replaceAll("{{country}}", country);
  }

  String fallback_build({required String app_id, required String lang}) {
    return FALLBACK_URL_FORMAT
        .replaceAll("{{app_id}}", app_id)
        .replaceAll("{{lang}}", lang);
  }

  String? build_body(String app_id, String lang, String country) {
    return null;
  }
}

class _Reviews {
  String URL_FORMAT =
      "$Play_Store_Base_Url/_/PlayStoreUi/data/batchexecute?hl={{lang}}&gl={{country}}";
  String PAYLOAD_FORMAT_FOR_FIRST_PAGE =
      "f.req=%5B%5B%5B%22UsvDTd%22%2C%22%5Bnull%2Cnull%2C%5B2%2C{sort}%2C%5B{count}%2Cnull%2Cnull%5D%2Cnull%2C%5Bnull%2C{score}%5D%5D%2C%5B%5C%22{app_id}%5C%22%2C7%5D%5D%22%2Cnull%2C%22generic%22%5D%5D%5D";

  build(String lang, String country) {
    return URL_FORMAT
        .replaceAll("{{lang}}", lang)
        .replaceAll("{{country}}", country);
  }

  build_body(
      {required String app_id,
      required int sort,
      required int count,
      required String filter_score_with,
      String? pagination_token}) {
    String result;
    if (pagination_token != null) {
      result = PAYLOAD_FORMAT_FOR_FIRST_PAGE
          .replaceAll("{{app_id}}", app_id)
          .replaceAll("{{sort}}", sort.toString())
          .replaceAll("{{count}}", count.toString())
          .replaceAll("{{score}}", filter_score_with.toString())
          .replaceAll("{{pagination_token}}", pagination_token);
    } else {
      result = PAYLOAD_FORMAT_FOR_FIRST_PAGE
          .replaceAll("{{app_id}}", app_id)
          .replaceAll("{{sort}}", sort.toString())
          .replaceAll("{{count}}", count.toString())
          .replaceAll("{{score}}", filter_score_with.toString());
    }

    return "b'$result'";
  }
}

class _Permissions {
  String URL_FORMAT =
      "$Play_Store_Base_Url/_/PlayStoreUi/data/batchexecute?hl={{lang}}&gl={{country}}";
  String PAYLOAD_FORMAT_FOR_PERMISSION =
      "f.req=%5B%5B%5B%22xdSrCf%22%2C%22%5B%5Bnull%2C%5B%5C%22{{app_id}}%5C%22%2C7%5D%2C%5B%5D%5D%5D%22%2Cnull%2C%221%22%5D%5D%5D";
  String build({required String lang, required String country}) {
    return URL_FORMAT
        .replaceAll("{{lang}}", lang)
        .replaceAll("{{country}}", country);
  }

  build_body(String app_id) {
    String result =
        PAYLOAD_FORMAT_FOR_PERMISSION.replaceAll("{{app_id}}", app_id);
    return result;
  }
}

class _Searchresults {
  String URL_FORMAT =
      "$Play_Store_Base_Url/store/search?q={{query}}&c=apps&hl={{lang}}&gl={{country}}";
  String FALLBACK_URL_FORMAT =
      "$Play_Store_Base_Url/store/search?q={{query}}&c=apps&hl={{lang}}";
  String build(
      {required String query, required String lang, required String country}) {
    return URL_FORMAT
        .replaceAll("{{query}}", query)
        .replaceAll("{{lang}}", lang)
        .replaceAll("{{country}}", country);
  }

  String fallback_build({required String query, required String lang}) {
    return FALLBACK_URL_FORMAT
        .replaceAll("{{query}}", query)
        .replaceAll("{{lang}}", lang);
  }

  String? build_body(String query, String lang, String country) {
    return null;
  }
}

class Formats {
  static _Detail Detail = _Detail();
  static _Reviews Reviews = _Reviews();
  static _Permissions Permissions = _Permissions();
  static _Searchresults Searchresults = _Searchresults();
}
