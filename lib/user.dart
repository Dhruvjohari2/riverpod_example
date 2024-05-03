import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class User {
  final String name;
  final String email;
  const User({
    required this.name,
    required this.email,
  });

  User copyWith({
    String? name,
    String? email,
  }){
    return  User(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'name' :name,
      'age':email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map){
    return User(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson()  => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(name: $name, age: $email)';

  @override
  bool operator ==(Object other){
    if(identical(this, other)) return  true;

    return other is User &&
        other.name == name &&
        other.email == email;
  }

  int get hashcode => name.hashCode ^ email.hashCode;


}







@immutable
// class User {
//   final String name;
//   final int age;
//   const User({
//     required this.name,
//     required this.age,
//   });
//
//   User copyWith({
//     String? name,
//     int? age,
// }){
//     return  User(
//       name: name ?? this.name,
//       age: age ?? this.age,
//     );
//   }
//
//   Map<String, dynamic> toMap(){
//     return{
//       'name' :name,
//       'age':age,
//     };
//   }
//
//   factory User.fromMap(Map<String, dynamic> map){
//     return User(
//       name: map['name'] ?? '',
//       age: map['age']?.toInt() ?? 0,
//     );
//   }
//
//   String toJson()  => json.encode(toMap());
//
//   factory User.fromJson(String source) => User.fromMap(json.decode(source));
//
//   @override
//   String toString() => 'User(name: $name, age: $age)';
//
//   @override
//   bool operator ==(Object other){
//     if(identical(this, other)) return  true;
//
//     return other is User &&
//     other.name == name &&
//     other.age == age;
//    }
//
//    int get hashcode => name.hashCode ^ age.hashCode;
//
//
// }

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);

  void updateName(String n) {
    state = state.copyWith(name: n);
  }
}

// class UserNotifierChange extends ChangeNotifier{
//   User user = const User(name:'',age: 0);
//
//   void updateAge(int n) {
//     user = user.copyWith(age: n);
//     notifyListeners();
//   }
// }
