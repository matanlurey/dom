// Copyright (c) 2017, package:dom authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:dom/dom.dart';
import 'package:test/test.dart';

void main() {
  test('$Attribute should implement equality', () {
    expect(
      new Attribute('title', 'Hello'),
      new Attribute('title', 'Hello'),
    );
  });

  test('$Element should implement equality', () {
    expect(
      new Element(
        'button',
        children: [
          new Attribute('disabled'),
          new Text('Hello'),
        ],
      ),
      new Element(
        'button',
        children: [
          new Attribute('disabled'),
          new Text('Hello'),
        ],
      ),
    );
  });
}
