/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This tests that HttpRequest open() disallows synchronous HTTP(S)
 * requests when a non-default responseType is set.
 */
import "dart:html";
import "../../../Utils/expect.dart";

void main() {
    HttpRequest xhr;

    // HTTP
    xhr = new HttpRequest();
    xhr.responseType = 'document';
    Expect.throws((){
       xhr.open('GET', 'http://mydomain/', async:false);
    }, (e)=>true
    , 'http://mydomain/');

    // HTTPS
    xhr = new HttpRequest();
    xhr.responseType = 'document';
    Expect.throws((){
       xhr.open('GET', 'https://mysecuredomain/', async:false);
    }, (e)=>true
    , "https://mysecuredomain/");

    // FILE
    // Expect.equals('file:', window.location.protocol); -- wrong
    xhr = new HttpRequest();
    xhr.responseType = 'document';
    Expect.throws((){
       xhr.open('GET', 'window.location.href', async:false);
    }, (e)=>true
    , "window.location.href");

    // DATA
    var dataUrl = 'data:text/html;charset=utf-8,%3C%21DOCTYPE%20' +
                  'html%3E%0D%0A%3Chtml%20lang%3D%22en%22%3E%0D%0A%3Chead%' +
                  '3E%3Ctitle%3EEmbedded%20Window%3C%2Ftitle%3E%3C%2Fhead%' +
                  '3E%0D%0A%3Cbody%3E%3Ch1%3E42%3C%2Fh1%3E%3C%2Fbody%3E%0A' +
                  '%3C%2Fhtml%3E%0A%0D%0A';
    xhr = new HttpRequest();
    xhr.responseType = 'document';
    Expect.throws((){
       xhr.open('GET', dataUrl, async:false);
    }, (e)=>true
    , dataUrl);
}