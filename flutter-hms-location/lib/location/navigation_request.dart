/*
    Copyright 2020. Huawei Technologies Co., Ltd. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';

class NavigationRequest {
  static const int OVERPASS = 1;
  static const int IS_SUPPORT_EX = 2;

  int type;
  Map<String, String> extras;

  NavigationRequest({
    this.type,
    this.extras,
  });

  void putExtras(String key, String value) {
    if (extras == null) {
      extras = Map<String, String>();
    }
    extras.putIfAbsent(key, () => value);
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'extras': extras,
    };
  }

  factory NavigationRequest.fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;

    return NavigationRequest(
      type: map['type'],
      extras: Map<String, String>.from(map['extras']),
    );
  }

  String toJson() => json.encode(toMap());

  factory NavigationRequest.fromJson(String source) =>
      NavigationRequest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NavigationRequest(type: $type, extras: $extras)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is NavigationRequest &&
        o.type == type &&
        mapEquals(o.extras, extras);
  }

  @override
  int get hashCode {
    return hashList([
      type,
      extras,
    ]);
  }
}