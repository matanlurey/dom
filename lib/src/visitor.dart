// Copyright (c) 2017, package:dom authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:dom/dom.dart';

/// Implements methods for traversing a virtual DOM tree.
abstract class Visitor<C> {
  /// Re-usable method for visiting all child nodes of [parent].
  static void visitChildren<C>(
    Visitor<C> visitor,
    Element parent, [
    C context,
  ]) {
    for (var i = 0; i < parent.children.length; i++) {
      final node = parent.children[i];
      node.accept(visitor, context);
    }
  }

  /// Called for every attribute in a tree.
  void visitAttribute(Element node, String name, String value, [C context]);

  /// Called for every element in a tree.
  void visitElement(Element node, [C context]);

  /// Called for every text node in a tree.
  void visitText(Text node, [C context]);
}

/// Does nothing.
class IdentityVisitor<C> implements Visitor<C> {
  const IdentityVisitor();

  @override
  void visitAttribute(Element node, String name, String value, [C context]) {}

  @override
  void visitElement(Element node, [C context]) {}

  @override
  void visitText(Text node, [C context]) {}
}
