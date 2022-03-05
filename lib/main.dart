import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:movies_list/core/serializer.dart';
import 'package:movies_list/locator.dart';
import 'package:movies_list/presentation/routes/route_generator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  driftRuntimeOptions.defaultSerializer = MoviesSerializer();
  setup();
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies list',
      theme: ThemeData.dark(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
