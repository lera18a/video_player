import 'package:flutter/material.dart';

class TextDescriptionModel extends StatelessWidget {
  const TextDescriptionModel({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(description, style: theme.textTheme.bodySmall);
  }
}
