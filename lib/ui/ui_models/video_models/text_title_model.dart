import 'package:flutter/material.dart';

class TextTitleModel extends StatelessWidget {
  const TextTitleModel({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(child: Text(title, style: theme.textTheme.bodyLarge));
  }
}
