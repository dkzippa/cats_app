import 'package:flutter/material.dart';

class LoadingError extends StatelessWidget {
  final String errorText;

  const LoadingError({super.key, required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.error, color: Colors.redAccent),
        Text(errorText),
      ],
    );
  }
}
