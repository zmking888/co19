/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The reserved word this denotes the target of the current instance member
 * invocation.
 * @description Checks that word this cannot be used to declare an interface.
 * @author hlodvig
 * @compile-error
 * @reviewer kaigorodov
 */

interface this{
}

class A implements this{
}

main() {
  try {
    new A();
  } catch(var e) {}
}