/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Change classes affecting :-webkit-any and :not.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      .a1 .a2:-webkit-any(.a3, .a4) { background-color: green }
      .b1 .b2:not(.b3) { background-color: green }
      .c1 .c2:-webkit-any(:not(.c3)) { background-color: green }
      .d1:not(.d2) .d3 { background-color: green; }
      .e1 :not(.e2) { background-color: green; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div class="a1">
          <div class="a2" id="t1">Background should be green</div>
      </div>
      <div class="b1">
          <div class="b2 b3" id="t2">Background should be green</div>
      </div>
      <div class="c1">
          <div class="c2 c3" id="t3">Background should be green</div>
      </div>
      <div id="outer-d" class="d1 d2">
          <div id="t4" class="d3">Background should be green</div>
      </div>
      <div id="outer-e">
          <div id="t5">Background should be green</div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.offsetTop; // force style recalc.

  var transparent = 'rgba(0, 0, 0, 0)';
  var green = 'rgb(0, 128, 0)';

  var t1 = document.getElementById("t1");
  shouldBe(getComputedStyle(t1, null).backgroundColor, transparent);
  t1.className = "a2 a3";
  shouldBe(getComputedStyle(t1, null).backgroundColor, green);

  var t2 = document.getElementById("t2");
  shouldBe(getComputedStyle(t2, null).backgroundColor, transparent);
  t2.className = "b2";
  shouldBe(getComputedStyle(t2, null).backgroundColor, green);

  var t3 = document.getElementById("t3");
  shouldBe(getComputedStyle(t3, null).backgroundColor, transparent);
  t3.className = "c2";
  shouldBe(getComputedStyle(t3, null).backgroundColor, green);

  var t4 = document.getElementById("t4");
  shouldBe(getComputedStyle(t4, null).backgroundColor, transparent);
  document.getElementById("outer-d").className = "d1";
  shouldBe(getComputedStyle(t4, null).backgroundColor, green);

  var t5 = document.getElementById("t5");
  shouldBe(getComputedStyle(t5, null).backgroundColor, transparent);
  document.getElementById("outer-e").className = "e1";
  shouldBe(getComputedStyle(t5, null).backgroundColor, green);
}
