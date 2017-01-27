// Copyright (c) 2017, package:dom authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:dom/src/visitor.dart';

/// Represents a node in an a virtual DOM tree.
abstract class Node {
  // Prevent inheritance.
  const Node._();

  /// Visit this node using [visitor].
  void accept<C>(Visitor<C> visitor, [C context]);
}
