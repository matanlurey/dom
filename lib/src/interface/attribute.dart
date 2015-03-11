part of dom.src.interface;

/// Virtual attribute API.
class Attribute {
  /// Name of the attribute.
  final String name;

  /// Value of the attribute. Can optionally be null for no value.
  final String value;

  const Attribute(this.name, [this.value]);
}
