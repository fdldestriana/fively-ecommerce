class Failure {
  String message;

  Failure({this.message = 'message'});

  @override
  String toString() {
    return message;
  }
}
