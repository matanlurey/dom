part of dom.src.interface;

/// Virtual attribute API.
abstract class Attribute {
  /// Name of the attribute.
  String get name;

  /// Value of the attribute. Can optionally be null for no value.
  String get value;
}
