import 'package:flutter/material.dart';

import 'booksapp_data_list_tile.dart';

class BooksAppDataListView extends StatelessWidget {
  const BooksAppDataListView({
    super.key,
    required this.leadsList,
  });

  final List leadsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return BooksAppDataListTile(currentLead: leadsList[index]);
      },
      itemCount: leadsList.length,
      shrinkWrap: true,
    );
  }
}
