/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var style = new Element.html('''
      <style>
          /* Must be positioned absolute or static, must have margins to push it out view. */
          .positioned {
              position: absolute;
              margin-top: 100%;
          }

          /* Any kind of quote will do, can be either :before or :after */
          .positioned:before,
          .focusable:before {
              content: open-quote;
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>Bug 109616 - ASSERT(!renderer()->needsLayout()) when calling Element::focus() with generated content</p>

      <!--
          This is testing a case where RenderQuote::updateDepth would mark the RenderQuote
          and its ancestors as needing layout in the middle of a layout of its ancestor.
          When its ancestor finishes the layout it will mark itself and the ancestors
          farther up as no longer needing layout. The end result is some subtree
          needing layout, but the RenderView and possibly other ancestors of the subtree
          not needing layout.

          ex.

          RenderView <- !needsLayout
              \
             RenderBlock (.focusable) <- needsLayout
                  \
                   RenderBlock (generated content) <- needsLayout
                      \
                       RenderQuote <- needsLayout
      -->

      <div class="positioned"></div>
      <div class="focusable" tabindex="1"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  // .focusable still needs layout at this point, but RenderView doesn't
  // think any descendants need layout.
  document.querySelector('.focusable').focus();
}
