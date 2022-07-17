// ignore_for_file: non_constant_identifier_names

import '../utils/data_processors.dart';
import '../utils/nested_loockup.dart';

_bool(dynamic val) {
  if (val) return true;
  return false;
}

class ElementSpec {
  final int? ds_num;
  final List<int> data_map;
  final dynamic post_processor;
  final dynamic fallback_value;

  ElementSpec(
      {this.ds_num,
      required this.data_map,
      this.post_processor,
      this.fallback_value});

  extract_content(dynamic source) {
    // ignore: prefer_typing_uninitialized_variables
    var result;
    try {
      if (ds_num == null) {
        result = nested_lookup(source, data_map);
      } else {
        result = nested_lookup(source['ds:$ds_num'], data_map);
      }

      if (post_processor != null) {
        result = post_processor!(result);
      }
    } catch (_) {
      if (fallback_value is ElementSpec) {
        result = fallback_value.extract_content(source);
      } else {
        result = fallback_value;
      }
    }
    return result;
  }
}

class ElementSpecs {
  static Map Detail = {
    "title": ElementSpec(ds_num: 4, data_map: [1, 2, 0, 0]),
    "description": ElementSpec(
        ds_num: 4, data_map: [1, 2, 72, 0, 1], post_processor: unescape_text),
    "descriptionHTML": ElementSpec(ds_num: 4, data_map: [1, 2, 72, 0, 1]),
    "summary": ElementSpec(
        ds_num: 4, data_map: [1, 2, 73, 0, 1], post_processor: unescape_text),
    "installs": ElementSpec(ds_num: 4, data_map: [1, 2, 13, 0]),
    "minInstalls": ElementSpec(ds_num: 4, data_map: [1, 2, 13, 1]),
    "realInstalls": ElementSpec(ds_num: 4, data_map: [1, 2, 13, 2]),
    "score": ElementSpec(ds_num: 4, data_map: [1, 2, 51, 0, 1]),
    "ratings": ElementSpec(ds_num: 4, data_map: [1, 2, 51, 2, 1]),
    "reviews": ElementSpec(ds_num: 4, data_map: [1, 2, 51, 3, 1]),
    "histogram": ElementSpec(
      ds_num: 4,
      data_map: [1, 2, 51, 1],
      post_processor: (container) {
        [
          container[1][1],
          container[2][1],
          container[3][1],
          container[4][1],
          container[5][1],
        ];
      },
      fallback_value: [0, 0, 0, 0, 0],
    ),
    "price": ElementSpec(
      ds_num: 4,
      data_map: [1, 2, 57, 0, 0, 0, 0, 1, 0, 0],
      post_processor: (price) {
        return (price / 1000000);
      },
      fallback_value: 0,
    ),
    "free": ElementSpec(
        ds_num: 4,
        data_map: [1, 2, 57, 0, 0, 0, 0, 1, 0, 1],
        post_processor: (s) => s == 0),
    "currency":
        ElementSpec(ds_num: 4, data_map: [1, 2, 57, 0, 0, 0, 0, 1, 0, 1]),
    "sale": ElementSpec(
      ds_num: 3,
      data_map: [0, 2, 0, 0, 0, 14, 0, 0],
      post_processor: _bool,
      fallback_value: false,
    ),
    "saleTime": ElementSpec(ds_num: 3, data_map: [0, 2, 0, 0, 0, 14, 0, 0]),
    "originalPrice": ElementSpec(
      ds_num: 3,
      data_map: [0, 2, 0, 0, 0, 1, 1, 0],
      post_processor: (price) {
        return (price / 1000000);
      },
    ),
    "saleText": ElementSpec(ds_num: 3, data_map: [0, 2, 0, 0, 0, 1, 1, 1]),
    "offersIAP": ElementSpec(
        ds_num: 4,
        data_map: [1, 2, 19, 0],
        post_processor: _bool,
        fallback_value: false),
    "inAppProductPrice": ElementSpec(ds_num: 4, data_map: [1, 2, 19, 0]),
    "developer": ElementSpec(ds_num: 4, data_map: [1, 2, 68, 0]),
    "developerId": ElementSpec(
        ds_num: 4,
        data_map: [1, 2, 68, 1, 4, 2],
        post_processor: (String s) {
          return s.split("id=")[1];
        }),
    "developerEmail": ElementSpec(ds_num: 4, data_map: [1, 2, 69, 1, 0]),
    "developerWebsite": ElementSpec(ds_num: 4, data_map: [1, 2, 69, 0, 5, 2]),
    "developerAddress": ElementSpec(ds_num: 4, data_map: [1, 2, 69, 2, 0]),
    "privacyPolicy": ElementSpec(ds_num: 4, data_map: [1, 2, 99, 0, 5, 2]),
    "genre": ElementSpec(ds_num: 4, data_map: [1, 2, 79, 0, 0, 0]),
    "genreId": ElementSpec(ds_num: 4, data_map: [1, 2, 79, 0, 0, 2]),
    "icon": ElementSpec(ds_num: 4, data_map: [1, 2, 95, 0, 3, 2]),
    "headerImage": ElementSpec(ds_num: 4, data_map: [1, 2, 96, 0, 3, 2]),
    "screenshots": ElementSpec(
      ds_num: 4,
      data_map: [1, 2, 78, 0],
      post_processor: (container) {
        var r = container.map((item) {
          return item[3][2];
        }).toList();
        return r;
      },
      fallback_value: [],
    ),
    "video": ElementSpec(ds_num: 4, data_map: [1, 2, 100, 0, 0, 3, 2]),
    "videoImage": ElementSpec(ds_num: 4, data_map: [1, 2, 100, 1, 0, 3, 2]),
    "contentRating": ElementSpec(ds_num: 4, data_map: [1, 2, 9, 0]),
    "contentRatingDescription":
        ElementSpec(ds_num: 4, data_map: [1, 2, 9, 2, 1]),
    "adSupported":
        ElementSpec(ds_num: 4, data_map: [1, 2, 48], post_processor: _bool),
    "containsAds": ElementSpec(
        ds_num: 4,
        data_map: [1, 2, 48],
        post_processor: _bool,
        fallback_value: false),
    "released": ElementSpec(ds_num: 4, data_map: [1, 2, 10, 0]),
    "updated": ElementSpec(ds_num: 4, data_map: [1, 2, 145, 0, 1, 0]),
    "version": ElementSpec(
      ds_num: 4,
      data_map: [1, 2, 140, 0, 0, 0],
      fallback_value: "Varies with device",
    ),
    "recentChanges": ElementSpec(
        ds_num: 4, data_map: [1, 2, 144, 1, 1], post_processor: unescape_text),
    "recentChangesHTML": ElementSpec(ds_num: 4, data_map: [1, 2, 144, 1, 1]),
    "comments": ElementSpec(
        ds_num: 8,
        data_map: [0],
        post_processor: (container) {
          var r = container.map((item) {
            return item[1];
          }).toList();
          return r;
        },
        fallback_value: []),
  };

  Map Review = {
    "reviewId": ElementSpec(ds_num: null, data_map: [0]),
    "userName": ElementSpec(ds_num: null, data_map: [1, 0]),
    "userImage": ElementSpec(ds_num: null, data_map: [1, 1, 3, 2]),
    "content": ElementSpec(ds_num: null, data_map: [4]),
    "score": ElementSpec(ds_num: null, data_map: [2]),
    "thumbsUpCount": ElementSpec(ds_num: null, data_map: [6]),
    "reviewCreatedVersion": ElementSpec(ds_num: null, data_map: [10]),
    "at": ElementSpec(
        ds_num: null,
        data_map: [5, 0],
        post_processor: (v) {
          return DateTime.fromMillisecondsSinceEpoch(v);
        }),
  };

  static var Permission_Type = ElementSpec(ds_num: null, data_map: [0]);
  static var Permission_List = ElementSpec(
    ds_num: null,
    data_map: [2],
    post_processor: (container) {
      var r = container.map((item) {
        return item[1];
      }).toList();
      // sort r
      return r;
    },
  );

  static var Searchresult = {
    "appId": ElementSpec(ds_num: null, data_map: [0, 0, 0]),
    "icon": ElementSpec(ds_num: null, data_map: [0, 1, 3, 2]),
    "screenshots": ElementSpec(
      ds_num: null,
      data_map: [0, 2],
      post_processor: (container) {
        var r = container.map((item) {
          return item[3][2];
        }).toList();
        return r;
      },
      fallback_value: [],
    ),
    "title": ElementSpec(ds_num: null, data_map: [0, 3]),
    "score": ElementSpec(ds_num: null, data_map: [0, 4, 1]),
    "genre": ElementSpec(ds_num: null, data_map: [0, 5]),
    "price": ElementSpec(
        ds_num: null,
        data_map: [0, 8, 1, 0, 0],
        post_processor: (price) {
          return (price / 10000000);
        }),
    "free": ElementSpec(
        ds_num: null,
        data_map: [0, 8, 1, 0, 0],
        post_processor: (price) {
          return (price == 0);
        }),
    "currency": ElementSpec(ds_num: null, data_map: [0, 8, 1, 0, 1]),
    "video": ElementSpec(ds_num: null, data_map: [0, 12, 0, 0, 3, 2]),
    "videoImage": ElementSpec(ds_num: null, data_map: [0, 12, 0, 3, 3, 2]),
    "description": ElementSpec(ds_num: null, data_map: [0, 13, 1]),
    "descriptionHTML": ElementSpec(ds_num: null, data_map: [0, 13, 1]),
    "developer": ElementSpec(ds_num: null, data_map: [0, 14]),
    "installs": ElementSpec(ds_num: null, data_map: [0, 15]),
  };
}
