/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static final Zone current
 * @description Checks that async callbacks are executed in the zone they
 * have been queued in.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  var z = Zone.current;

  asyncStart();
  new Future.value(1).then((_) {
    Expect.equals(z, Zone.current);

    zoned() {
      var z2 = Zone.current;
      Expect.notEquals(z, z2);

      asyncStart();
      new Future.value(2).then((_) {
        Expect.equals(z2, Zone.current);
        asyncEnd();
      });
    }

    z.fork().run(zoned);
      
    asyncEnd();
  });
}
