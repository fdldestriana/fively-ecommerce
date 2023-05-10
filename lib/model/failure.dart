class Failure implements Exception {
  String message;

  Failure({required this.message});

  @override
  String toString() {
    return message;
  }
}
