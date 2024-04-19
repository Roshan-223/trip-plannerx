import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:trip_plannerx/db/database_file/schedule_db.dart';
import 'package:trip_plannerx/model/model.dart';
import 'package:trip_plannerx/screens/loginscreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await  Hive.initFlutter();
  Hive.registerAdapter(LoginAdapter());
  Hive.registerAdapter(ScheduleAdapter());
   await Hive.openBox<Schedule>('addtrip');

  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trip PlannerX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
