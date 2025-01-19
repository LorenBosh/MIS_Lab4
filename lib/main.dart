import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/event_provider.dart';
import './screens/calendar_screen.dart';
import './services/notifications_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final notificationHelper = NotificationHelper();
  await notificationHelper.initialize();

  runApp(
    ChangeNotifierProvider(
      create: (_) => EventProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Schedule',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.indigo,
        ),
      ),
      home: const CalendarScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

