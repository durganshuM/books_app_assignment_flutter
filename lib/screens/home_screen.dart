import 'package:flutter/material.dart';

import '../components/booksapp_data_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.booksAppData});
  final dynamic booksAppData;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List foundLeads = [];

  @override
  void initState() {
    super.initState();
    foundLeads = widget.booksAppData['leads'];
  }

  void runSearchFilter(String enteredKeyword) {
    List allLeads = widget.booksAppData['leads'];
    List result = [];

    if (enteredKeyword.isEmpty) {
      result = allLeads;
    } else {
      result = allLeads
          .where((lead) => lead['firstName']
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      foundLeads = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Flutter Tutorial',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: (widget.booksAppData == null)
                  ? const Text('Some error occurred')
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'List View Search',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10.0),
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            prefixIconColor: Colors.blueAccent,
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.blueAccent,
                            )),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onChanged: (value) {
                            runSearchFilter(value);
                          },
                        ),
                        BooksAppDataListView(
                          leadsList: foundLeads,
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
