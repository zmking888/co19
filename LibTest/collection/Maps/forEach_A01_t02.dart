/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Applies [f] to each {key, value} pair of the map.
 * @description Checks that something is thrown when the argument is null or
 * has a type that is incompatible with the required function type.
 * @static-warning
 * @author msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";
import "../../../Utils/dynamic_check.dart";
import "dart:collection";

main() {
  Map<String, Object> map = new Map<String, Object>();
  
  map["1"] = 3;
  map["2"] = 5;
  
  Expect.throws(() => Maps.forEach(map, null));
  Expect.throws(() => Maps.forEach(map, 1)); /// static type warning
}
