import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_example/constants/constants.dart';
import 'package:training_example/generated/assets.dart';
import 'package:training_example/models/user_info/bloc/user_info_bloc.dart';
import 'package:training_example/models/user_info/bloc/user_info_event.dart';
import 'package:training_example/models/user_info/user.dart' as user_model;
import '../../../models/user_info/bloc/user_info_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserInfoBloc userInfoBloc;
  late user_model.UserInfo userInfo;
  final categories = Constants.categories;
  bool isImageError = false;

  final CircleAvatar defaultAvatar = const CircleAvatar(
    radius: 25.0,
    backgroundImage: AssetImage(Assets.assetsImageDefault),
    backgroundColor: Colors.transparent,
  );

  @override
  void initState() {
    userInfoBloc = context.read<UserInfoBloc>();
    userInfoBloc.add(FetchCurrentUserInfoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          onPressed: () {},
        ),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 15),
              child: BlocBuilder<UserInfoBloc, UserInfoState>(
                builder: (context, state) {
                  if (state is UserInfoFetchedState) {
                    return isImageError
                        ? defaultAvatar
                        : CircleAvatar(
                            radius: 25.0,
                            backgroundImage: NetworkImage(
                              state.userInfo.imageURL!,
                            ),
                            onBackgroundImageError: (e, t) {
                              setState(() {
                                isImageError = true;
                              });
                            },
                            backgroundColor: Colors.transparent,
                          );
                  } else {
                    return defaultAvatar;
                  }
                },
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 35.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/4),
              child: const Text(
                'Discover Seasonal Fruits and Vegetables',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Mukta-Medium',
                  height: 1.5
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) => TextButton(
                  onPressed: () {},
                  child: Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: Text(
                      categories[index],
                      style: const TextStyle(
                        fontFamily: 'Mukta-Bold',
                        fontSize: 20.0,
                        color: Colors.black
                      ),
                    ),
                  ),
                ),
                scrollDirection: Axis.horizontal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
