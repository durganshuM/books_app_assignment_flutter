import 'package:books_app_assignment/screens/home_screen.dart';
import 'package:books_app_assignment/services/book_app_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getBooksAppData();
  }

  void getBooksAppData() async {
    BookAppData bookAppData = BookAppData();
    var booksAppData = await bookAppData.postBookAppData();
    navigation(booksAppData);
  }

  void navigation(dynamic booksAppData) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            booksAppData: booksAppData,
          ),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: SpinKitFoldingCube(
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}
