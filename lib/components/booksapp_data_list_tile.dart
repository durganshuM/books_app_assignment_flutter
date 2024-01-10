import 'package:flutter/material.dart';

class BooksAppDataListTile extends StatelessWidget {
  const BooksAppDataListTile({super.key, required this.currentLead});

  final dynamic currentLead;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          '${currentLead['firstName'].toString()} ${currentLead['lastName'].toString()}'),
      subtitle: Text(
        currentLead['email'].toString(),
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.blueAccent,
        child: Text(
          currentLead['firstName'].toString()[0],
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
