/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setUint64(int byteOffset, int value, [Endianness endian = Endianness.BIG_ENDIAN])
 * Sets the eight bytes starting at the specified [byteOffset] in this object
 * to the unsigned binary representation of the specified [value],
 * which must fit in eight bytes. in other words, [value] must be between
 * 0 and 2<sup>64</sup> - 1, inclusive.
 * @description Checks that the value at the [offset] is set to [value].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var u64 = new Uint64List(16);
  var valuesToBeSet = [123, 95, 25, 98, 0, 113, 20, 9, 1, 9223372036854775807, 18446744073709551615, 25, 69, 52, 125, 31];
  var expectedBigEndian =
  [8863084066665136128, 6845471433603153920, 1801439850948198400, 7061644215716937728, 0, 8142508126285856768,
  1441151880758558720, 648518346341351424, 72057594037927936, 18446744073709551487, 18446744073709551615,
  1801439850948198400, 4971973988617027584, 3746994889972252672, 9007199254740992000, 2233785415175766016];

  var byteDataFromU64 = new ByteData.view(u64.buffer);
  for(int i = 0; i < byteDataFromU64.lengthInBytes / Uint64List.BYTES_PER_ELEMENT; ++i) {
    byteDataFromU64.setUint64(i * Uint64List.BYTES_PER_ELEMENT, valuesToBeSet[i], Endianness.LITTLE_ENDIAN);
  }
  Expect.listEquals(valuesToBeSet, u64);

  for(int i = 0; i < byteDataFromU64.lengthInBytes / Uint64List.BYTES_PER_ELEMENT; ++i) {
    byteDataFromU64.setUint64(i * Uint64List.BYTES_PER_ELEMENT, valuesToBeSet[i]);
  }
  Expect.listEquals(expectedBigEndian, u64);
}
