import 'package:flutter/material.dart';
import 'package:res_api/service/get_news_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("RES API")),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await GetUserService.getUser();
        },
      ),
    );
  }
}
