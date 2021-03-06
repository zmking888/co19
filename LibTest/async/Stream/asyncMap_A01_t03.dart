/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Stream asyncMap(dynamic convert(T event))
 * Creates a new stream with each data event of this stream asynchronously
 * mapped to a new event.
 *
 * This acts like map, except that convert may return a Future, and in that
 * case, the stream waits for that future to complete before continuing with
 * its result.
 *
 * @description Checks that if convert return a Future, the stream waits for
 * that future to complete before continuing with its result.
 * @author ngl@unipro.ru
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(List data) {
  Stream s1 = new Stream.fromIterable(data);
  List sink = new List();
  int len = data.length;
  List<Completer> c = new List<Completer>(len);
  int i = 0;
  for (int k = 0; k < len; k++) {
    c[k] = new Completer();
  }

  asyncStart();
  Stream s2 = s1.asyncMap((var event) => c[i++].future);
  s2.listen((var event) {
      sink.add(event);
    },
    onDone: () {
      Expect.listEquals(data, sink);
      asyncEnd();
    }
  );

  for (int k = 0; k < len; k++) {
    c[k].complete(data[k]);
  }
}

main() {
  check([]);
  check([1, 2, 3, 4]);
  check([null, "2", -3, 4.0, []]);
}
