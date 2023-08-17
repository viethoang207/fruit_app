import 'package:flutter/material.dart';
import '../../di/injection.dart';
import '../../generated/assets.dart';
import '../authentication/blocs/auth_bloc.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  var authBloc = getIt.get<AuthBloc>();

  final CircleAvatar defaultAvatar = const CircleAvatar(
    radius: 25.0,
    backgroundImage: AssetImage(Assets.assetsImageDefault),
    backgroundColor: Colors.transparent,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(right: 15, top: 25),
                  child: const CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/trainingexample-f3dec.appspot.com/o/anhthe1.jpeg?alt=media&token=b340a697-1088-4641-8c98-5e1bda201543'),
                    backgroundColor: Colors.transparent,
                  )),
              const SizedBox(height: 25),
              const Text(
                'Nguyễn Trúc Linh',
                maxLines: 1,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    overflow: TextOverflow.ellipsis),
              ),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email, color: Colors.black54),
                  SizedBox(width: 10),
                  Text(
                    'admin2@gmail.com',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                color: const Color.fromRGBO(246, 246, 246, 1),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'ORDER',
                    style: TextStyle(
                        fontFamily: 'Mukta-Bold',
                        letterSpacing: 2,
                        fontSize: 18,
                        color: Color.fromRGBO(159, 159, 159, 1)),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Waiting', style: TextStyle(color: Colors.green)),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 160,
                            child: const Text('0',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis)),
                          ),
                          const Icon(Icons.remove_red_eye_outlined, size: 20)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Confirmed', style: TextStyle(color: Colors.blue)),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 160,
                            child: const Text('2',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis)),
                          ),
                          const Icon(Icons.remove_red_eye_outlined, size: 20)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Canceled', style: TextStyle(color: Colors.red)),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 160,
                            child: const Text('0',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis)),
                          ),
                          const Icon(Icons.remove_red_eye_outlined, size: 20)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: const Color.fromRGBO(246, 246, 246, 1),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'PROFILE',
                    style: TextStyle(
                        fontFamily: 'Mukta-Bold',
                        letterSpacing: 2,
                        fontSize: 18,
                        color: Color.fromRGBO(159, 159, 159, 1)),
                  ),
                ),
              ),
              const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Name'),
                      Row(
                        children: [
                          SizedBox(
                            width: 160,
                            child: Text('Nguyễn Trúc Linh',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis)),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded, size: 20)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Address'),
                      Row(
                        children: [
                          SizedBox(
                            width: 160,
                            child: Text('29 Liễu Giai, Ba Đình, Hà Nội',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis)),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded, size: 20)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Phone'),
                      Row(
                        children: [
                          SizedBox(
                            width: 160,
                            child: Text('0833456456',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis)),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded, size: 20)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: const Color.fromRGBO(246, 246, 246, 1),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'PREFERENCES',
                    style: TextStyle(
                        fontFamily: 'Mukta-Bold',
                        letterSpacing: 2,
                        fontSize: 18,
                        color: Color.fromRGBO(159, 159, 159, 1)),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.public_rounded),
                          SizedBox(width: 10),
                          Text('Language'),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 160,
                            child: const Text('English',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis)),
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded, size: 20)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 50),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.nights_stay_rounded),
                          SizedBox(width: 10),
                          Text('Dark mode'),
                        ],
                      ),
                      Switch.adaptive(
                        value: false,
                        onChanged: (bool value) {},
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  authBloc.add(LogoutRequest());
                },
                child: Container(
                  color: Colors.red,
                  height: 45,
                  width: double.infinity,
                  child: const Align(
                      alignment: Alignment.center,
                      child: Text('Log out',
                          style: TextStyle(color: Colors.white, fontSize: 18))),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
