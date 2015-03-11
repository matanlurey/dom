part of dom.src.interface;

/// Virtual [Node] that has [childNodes].
abstract class Parent extends Node {
  /// Child nodes of the current node.
  final Iterable<Node> childNodes;

  const Parent([List<Node> childNodes = const []])
      : this.childNodes = childNodes;
}
