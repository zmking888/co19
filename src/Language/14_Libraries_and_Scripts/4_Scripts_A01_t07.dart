#! scripts tag
/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A script is a library with a top level function main().
 * scriptDefinition:
 *   scriptTag? libraryDefinition
 * ;
 * @description Checks that it is a compile-time error when a part directive
 * comes before the library name.
 * @compile-error
 * @author vasya
 * @reviewer msyabro
 */

part "3_Part_0.dart";
library Parts_test_lib;

main() {
}