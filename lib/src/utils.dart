// Copyright (c) 2017, package:dom authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// An internal facade to a few functions from external libraries.
///
/// It should be easy to swap these out at a future point of time if needed.
library dom.src.utils;

import 'package:collection/collection.dart' as collection;
import 'package:quiver/core.dart' as quiver;

/// Use this function to guard debugging or developer-only code.
///
/// When Dart is compiled in production mode then code guarded using this
/// function is tree-shaken away, reducing code size and improving runtime
/// performance where you want to make developer-only conditional checks:
/// ```
/// if (assertionsEnabled()) {
///   // Code here is removed in production mode.
/// }
/// ```
///
/// **WARNING**: The exact size of this method is designed to have no more AST
/// nodes than the maximum allowed by back-ends like `dart2js` to inline it.
bool assertionsEnabled() {
  var k = false;
  assert(k = true);
  return k;
}

/// Returns whether iterable collections [a] and [b] have the same elements.
bool equalsAll(Iterable a, Iterable b) =>
    const collection.IterableEquality().equals(a, b);

/// Returns whether lists [a] and [b] have the same elements.
bool equalsList(List a, List b) => const collection.ListEquality().equals(a, b);

/// Returns whether maps [a] and [b] have the same key-value pairs.
bool equalsMap(Map a, Map b) => const collection.MapEquality().equals(a, b);

/// Returns [input] as an immutable list in developer/checked mode.
///
/// In production mode, this function does nothing and should be tree-shaken.
List<E> freezeList<E>(List<E> input) => assertionsEnabled()
    ? new List<E>.unmodifiable(input)
    : input;

/// Returns [input] as an immutable map in developer/checked mode.
///
/// In production mode, this function does nothing and should be tree-shaken.
Map<K, V> freezeMap<K, V>(Map<K, V> input) => assertionsEnabled()
    ? new Map<K, V>.unmodifiable(input)
    : input;

/// Returns [input] as a [List], only creating one if it is not already a list.
List<E> maybeToList<E>(Iterable<E> input) {
  if (input.isEmpty) {
    return const <E>[];
  }
  if (input is List<E>) {
    return input;
  }
  return input.toList();
}

/// Generates a hash code representing [a] and [b].
int hash2(a, b) => quiver.hash2(a, b);

/// Generates a hash code representing [a], [b], and [c].
int hash3(a, b, c) => quiver.hash3(a, b, c);

/// Generates a hash code representing [a], [b], [c], and [d].
int hash4(a, b, c, d) => quiver.hash4(a, b, c, d);

/// Generates a hash code representing all elements in [all].
int hashAll(Iterable all) => const collection.IterableEquality().hash(all);

/// Generates a hash code representing all elements in [list].
int hashList(List list) => const collection.ListEquality().hash(list);

/// Generates a hash code representing all key-value pairs in [map].
int hashMap(Map map) => const collection.MapEquality().hash(map);
