import 'package:flutter/material.dart';

class ErrorStateProductListView extends StatelessWidget {
  const ErrorStateProductListView({Key? key, required this.message})
      : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
          child: Center(
        child: Text(
          message,
          style: const TextStyle(backgroundColor: Colors.red, fontSize: 15),
          textAlign: TextAlign.center,
        ),
      )),
    );
  }
}
