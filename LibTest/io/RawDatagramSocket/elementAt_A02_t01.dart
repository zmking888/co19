/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> elementAt(int index)
 * Returns the value of the indexth data event of this stream.
 * . .  .
 * If a done event occurs before the value is found, the future completes with
 * a RangeError.
 *
 * @description Checks that if a done event occurs before the value is found,
 * the future completes with a RangeError.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

main() {
  asyncStart();
  var address = InternetAddress.LOOPBACK_IP_V4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();
      receiver.close();

      Future fValue = receiver.elementAt(1);
      fValue.then((value) {
        Expect.equals(RawSocketEvent.CLOSED, value);
      }).catchError((e) {
        Expect.isTrue(e is RangeError);
      }).whenComplete(() {
        asyncEnd();
      });
    });
  });
}