// Copyright (c) 2017, package:dom authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:dom/src/node.dart';
import 'package:dom/src/utils.dart';
import 'package:dom/src/visitor.dart';
import 'package:meta/meta.dart';

/// Represents an element node in an a virtual DOM tree.
class Element implements Node {
  /// Nodes directly attached to this node.
  final Map<String, String> attributes;

  /// Child nodes (other elements, text).
  final List<Node> children;

  /// Name of the element.
  final String name;

  /// Creates a new virtual element of [name].
  ///
  /// May have any number of [children]. Unlike HTML or XML, child nodes include
  /// nodes like attributes or properties - it is up to the _implementation_
  /// that reads the virtual DOM element to determine rules around this.
  factory Element(
    String name, {
    Iterable<Node> children: const [],
    Map<String, String> attributes: const {},
  }) {
    return new Element._(
      name,
      children: freezeList(maybeToList(children)),
      attributes: freezeMap(attributes),
    );
  }

  // Prevent inheritance.
  const Element._(
    this.name, {
    @required this.children,
    @required this.attributes,
  });

  @override
  void accept<C>(
    Visitor<C> visitor, [
    C context,
  ]) =>
      visitor.visitElement(this, context);

  @override
  bool operator ==(Object o) {
    if (o is Element) {
      return name == o.name &&
          equalsList(children, o.children) &&
          equalsMap(attributes, o.attributes);
    }
    return false;
  }

  @override
  int get hashCode => hash3(name, hashList(children), hashMap(attributes));

  @override
  String toString() => '$Element{$name: $children, $attributes}';
}

/// A text node within an [Element].
class Text implements Node {
  final String value;

  /// Creates a new virtual text node with a [value].
  const factory Text(String value) = Text._;

  const Text._(this.value);

  @override
  void accept<C>(
    Visitor<C> visitor, [
    C context,
  ]) =>
      visitor.visitText(this, context);

  @override
  bool operator ==(Object o) => o is Text && value == o.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => '$Text {$value}';
}
