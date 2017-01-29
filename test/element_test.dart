// Copyright (c) 2017, package:dom authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:dom/dom.dart';
import 'package:test/test.dart';

void main() {
  test('$Element should implement equality', () {
    expect(
      new Element(
        'button',
        attributes: {
          'disabled': null,
        },
        children: [
          new Text('Hello'),
        ],
      ),
      new Element(
        'button',
        attributes: {
          'disabled': null,
        },
        children: [
          new Text('Hello'),
        ],
      ),
    );
  });
}
