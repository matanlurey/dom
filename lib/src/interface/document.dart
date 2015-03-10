part of dom.src.interface;

/// Virtual document API.
abstract class Document implements Parent {
  /// Create an [Element] of type [tagName], with [childNodes].
  Element createElement(String tagName, [List<Node> childNodes]);

  /// Create a [Text] node with [text].
  Text createText(String text);
}
