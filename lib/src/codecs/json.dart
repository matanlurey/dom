// Copyright (c) 2017, package:dom authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:dom/dom.dart';

/// Implements a naive virtual DOM tree <--> JSON codec.
///
/// The outputted value of the codec should not be considered stable and could
/// change at any time - the current implementation is quite native and not
/// optimized for size or anything else.
class JsonCodec extends Codec<String, Element> {
  const JsonCodec();

  @override
  final Converter<Element, String> decoder = const _JsonDecoder();

  @override
  final Converter<String, Element> encoder = const _JsonEncoder();
}

class _JsonDecoder extends Converter<Element, String> {
  const _JsonDecoder();

  @override
  String convert(Element input) {
    final context = <String, dynamic>{};
    input.accept(const _JsonDecoderVisitor(), context);
    return JSON.encode(context);
  }
}

class _JsonDecoderVisitor implements Visitor<Map<String, dynamic>> {
  const _JsonDecoderVisitor();

  @override
  void visitAttribute(Attribute node, [Map<String, dynamic> context]) {
    context
      ..['name'] = node.name
      ..['type'] = 'attribute';
    if (node.value != null) {
      context['value'] = node.value;
    }
  }

  @override
  void visitElement(Element node, [Map<String, dynamic> context]) {
    context
      ..['name'] = node.name
      ..['type'] = 'element';
    if (node.children.isNotEmpty) {
      context['children'] = node.children.map((node) {
        final child = <String, dynamic>{};
        node.accept(this, child);
        return child;
      }).toList();
    }
  }

  @override
  void visitText(Text node, [Map<String, dynamic> context]) {
    context
      ..['text'] = node.value
      ..['type'] = 'text';
  }
}

class _JsonEncoder extends Converter<String, Element> {
  const _JsonEncoder();

  @override
  Element convert(String input) =>
      _convertElement(JSON.decode(input) as Map<String, dynamic>);

  static Node _convertAny(Map<String, dynamic> node) {
    switch (node['type']) {
      case 'element':
        return _convertElement(node);
      case 'text':
        return _convertText(node);
      case 'attribute':
        return _convertAttribute(node);
      default:
        return null;
    }
  }

  static Attribute _convertAttribute(Map<String, dynamic> node) =>
      new Attribute(node['name'], node['value']);

  static Element _convertElement(Map<String, dynamic> node) =>
      new Element(node['name'],
          children:
              (node['children'] as List ?? const []).map(_convertAny).toList());

  static Text _convertText(Map<String, dynamic> node) => new Text(node['text']);
}
