import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'presentation/app/app.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}
// import 'dart:async';
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_sakura_base/data/models/AuthenticationUserModel.dart';
// import 'package:http/http.dart' as http;
//
// import 'domain/entities/authentication_user.dart';
//
// Future<AuthenticationUserModel> fetchAlbum() async {
//
//   final response = await http
//       .get(Uri.parse('http://192.168.0.109:3002/api/v1/user/info/?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjYsImlhdCI6MTY0NzQxNzg1OSwiZXhwIjoxNjc4OTUzODU5fQ.C1Z1ZhJbawLyG2zptGHtDqMUCA5eyhZGUN7wiWQFY2Y'));
//   if (response.statusCode == 200) {
//     return AuthenticationUserModel.fromJson(jsonDecode(response.body)['data']);
//   } else {
//     throw Exception('Failed to load album');
//   }
// }
//
// class Album {
//   final int userId;
//   final int id;
//   final String title;
//
//   const Album({
//     required this.userId,
//     required this.id,
//     required this.title,
//   });
//
//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   late Future<AuthenticationUserModel> futureAlbum;
//
//   @override
//   void initState() {
//     super.initState();
//     futureAlbum = fetchAlbum();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<AuthenticationUser>(
//             future: futureAlbum,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Text(snapshot.data!.email.toString());
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }
//               return const CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }