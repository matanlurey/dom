part of dom.src.interface;

/// Virtual element API.
abstract class Element extends Parent {
  /// The attributes.
  Iterable<Attribute> get attributes;

  /// The name of the tag of the element.
  String get tagName;
}
