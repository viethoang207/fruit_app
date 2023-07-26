import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:training_example/di/injection.dart';
import 'package:training_example/generated/assets.dart';
import 'package:training_example/repositories/user_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userRepo = getIt.get<UserRepository>();

  @override
  Widget build(BuildContext context) {
    getCurrentUser();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.menu_rounded,
            color: Colors.grey,
            size: 30,
          ),
          onPressed: () {  },
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: const CircleAvatar(
              radius: 25.0,
              backgroundImage:
              NetworkImage('https://giadinh.mediacdn.vn/2019/8/10/photo-1-1565426145297582419488.jpg'),
              backgroundColor: Colors.transparent,
            )
          )
        ],
      ),
      body: const Column(
        children: [

        ],
      ),
    );
  }

  void getCurrentUser(){
    // UserInfo info = await userRepo.getCurrentUserInfo();
    // print(info.toString);
    print(FirebaseAuth.instance.currentUser?.email);
  }
}