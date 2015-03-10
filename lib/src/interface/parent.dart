part of dom.src.interface;

/// Virtual [Node] that has [childNodes].
abstract class Parent extends Node {
  /// Child nodes of the current node.
  Iterable<Node> get childNodes;
}
