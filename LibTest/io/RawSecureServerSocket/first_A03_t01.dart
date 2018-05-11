/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Future<RawSecureSocket> first
 * The first element of the stream.
 * . . .
 * Except for the type of the error, this method is equivalent to
 * this.elementAt(0).
 *
 * @description Checks that the [first] is equivalent to this.elementAt(0).
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

String localFile(path) => Platform.script.resolve(path).toFilePath();

SecurityContext serverContext = new SecurityContext()
  ..useCertificateChain(localFile('../certificates/server_chain.pem'))
  ..usePrivateKey(localFile('../certificates/server_key.pem'),
      password: 'co19test');

SecurityContext clientContext = new SecurityContext()
  ..setTrustedCertificates(localFile('../certificates/trusted_certs.pem'));

check(InternetAddress address) {
  const messageSize = 10;
  List<int> expected = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  var v1 = null;
  var v2 = null;
  var closed = 0;
  asyncStart();
  RawSecureServerSocket.bind(address, 0, serverContext).then((server) {
    Stream<RawSecureSocket> bs = server.asBroadcastStream();
    bs.first.then((value) {
      v1 = value;
    }).whenComplete(() {
      if (v1 != null && v2 != null) {
        Expect.equals(v1, v2);
        asyncEnd();
      }
    });

    bs.elementAt(0).then((value) {
      v2 = value;
    }).whenComplete(() {
      if (v1 != null && v2 != null) {
        Expect.equals(v1, v2);
        asyncEnd();
      }
    });

    bs.listen((client) {
      int bytesRead = 0;
      int bytesWritten = 0;
      List<int> data = new List<int>(messageSize);
      client.writeEventsEnabled = false;
      client.listen((event) {
        switch (event) {
          case RawSocketEvent.READ:
            Expect.isTrue(client.available() > 0);
            var buffer = client.read();
            if (buffer != null) {
              data.setRange(bytesRead, bytesRead + buffer.length, buffer);
              bytesRead += buffer.length;
              Expect.listEquals(expected, buffer);
            }
            if (bytesRead == data.length) {
              Expect.listEquals(expected, data);
              client.writeEventsEnabled = true;
            }
            break;
          case RawSocketEvent.WRITE:
            Expect.listEquals(expected, data);
            bytesWritten +=
                client.write(data, bytesWritten, data.length - bytesWritten);
            if (bytesWritten < data.length) {
              client.writeEventsEnabled = true;
            }
            if (bytesWritten == data.length) {
              client.shutdown(SocketDirection.SEND);
            }
            break;
          case RawSocketEvent.READ_CLOSED:
            closed++;
            break;
          default:
            throw "Unexpected event $event";
        }
      }).onDone(() {
        if (closed == 2) {
          server.close();
        }
      });
    });

    for (int i = 1; i <= 2; i++) {
      RawSocket.connect(server.address, server.port).then((socket) {
        RawSecureSocket.secure(socket, context: clientContext).then((client) {
          var completer = new Completer();
          int bytesRead = 0;
          int bytesWritten = 0;
          List<int> dataSent = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
          List<int> dataReceived = new List<int>(dataSent.length);
          client.listen((event) {
            switch (event) {
              case RawSocketEvent.READ:
                Expect.isTrue(client.available() > 0);
                var buffer = client.read();
                if (buffer != null) {
                  dataReceived.setRange(
                      bytesRead, bytesRead + buffer.length, buffer);
                  bytesRead += buffer.length;
                }
                break;
              case RawSocketEvent.WRITE:
                Expect.isTrue(bytesRead == 0);
                bytesWritten += client.write(
                    dataSent, bytesWritten, dataSent.length - bytesWritten);
                if (bytesWritten < dataSent.length) {}
                break;
              case RawSocketEvent.READ_CLOSED:
                Expect.listEquals(expected, dataReceived);
                completer.complete(client);
                break;
              default:
                throw "Unexpected event $event";
            }
          });
          completer.future.then((_) {
            socket.close();
          });
        });
      });
    }
  });
}

main() {
  check(InternetAddress.LOOPBACK_IP_V4);
  check(InternetAddress.LOOPBACK_IP_V6);
}