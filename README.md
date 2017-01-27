# dom

A virtual DOM library for Dart.

## Yet another library?

The goal of `package:dom` is to be absolutely framework or implementation
agnostic and instead provide a rich but simple set of classes to represent a
virtual DOM tree and utilities for working with them.

By default, nodes are:

* Deeply immutable (equality and hash-able)
* Serializable (with a proof-of-concept `JSON` codec)
* Have nothing specific to any rendering implementation

This should be enough to build on or extend for most implementations.
