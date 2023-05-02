import 'package:flutter/material.dart';
import 'package:proarea_catsapp/cat_facts_history/ui/history_page.dart';

class AppbarLeadingBtn extends StatelessWidget {
  const AppbarLeadingBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HistoryPage(),
          ),
        );
      },
      icon: const Icon(Icons.book),
    );
  }
}
