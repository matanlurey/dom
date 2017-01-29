// Copyright (c) 2017, package:dom authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:dom/dom.dart';
import 'package:test/test.dart';

void main() {
  test('should encode and decode to JSON', () {
    final tree = new Element('button', attributes: {
      'disabled': null,
      'title': 'Hello World',
    }, children: [
      new Element('span', children: [
        new Text('Hello World'),
      ]),
    ]);
    expect(
      const JsonCodec().encode(
        const JsonCodec().decode(
          tree,
        ),
      ),
      tree,
    );
  });
}
