part of dom.src.interface;

/// Virtual element API.
class Element extends Parent {
  /// The attributes.
  final Iterable<Attribute> attributes;

  /// The name of the tag of the element.
  final String tagName;

  const Element(
      this.tagName, {
      List<Node> childNodes: const [],
      List<Attribute> attributes: const []})
          : super(childNodes),
            this.attributes = attributes;
}
