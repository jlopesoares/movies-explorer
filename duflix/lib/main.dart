import 'package:duflix/api/watchmode_api.dart';
import 'package:duflix/app_config.dart';
import 'package:duflix/feature/details/details_widget.dart';
import 'package:flutter/material.dart';

final config = AppConfig(
  watchmodeBaseUrl: Uri.parse('https://api.watchmode.com/v1'),
  watchmodeApiKey: 'Idsv1VxxFK80sxF2ES89OlOIB2kSxmQNXj6RuPeB',
);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  void teste() {
    final watchmodeApi = createWatchmodeApi(
      baseUrl: config.watchmodeBaseUrl,
      apiKey: config.watchmodeApiKey,
    );

    // watchmodeApi.listTitlesGet().then((value) {
    //   print(value.body);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sources'),
        ),
        body: const DetailsPage(),
      ),
    );
  }
}
