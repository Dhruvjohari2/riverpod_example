import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivierpod_app/user.dart';
import 'package:http/http.dart' as http;

import 'home.dart';
import 'home_screen.dart';

// providers
// provider

// final nameProvider = Provider<String>((ref) => 'Dhruv Johari');
final ageProvider = Provider<int>((ref) => 26);
final profressionProvider = Provider<String>((ref) => 'Flutter Developer');

// StateProvider
// final nameProvider = StateProvider<String?>((ref) => null);

// StateNotifier and StateNotifierProvider
// final userProvider = StateNotifierProvider<UserNotifier, User>(
//   (ref) => UserNotifier(
//     const User(name: '', age: 0),
//   ),
// );

//ChangeNotifierProvider
// final userChangeNotifierProvider = ChangeNotifierProvider((ref) => UserNotifierChange());

//Future Provider
final fetchUserProvider = FutureProvider((ref) {
  const url = "https://jsonplaceholder.typicode.com/users/1";
  return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomeScreen(),
    );
  }
}
