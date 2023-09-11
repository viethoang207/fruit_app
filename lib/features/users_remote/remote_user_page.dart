import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:training_example/fake_api/bloc/user_bloc.dart';
import 'package:training_example/fake_api/bloc/user_event.dart';
import 'package:training_example/fake_api/model/users.dart';
import 'package:training_example/features/users_remote/remote_user_widget.dart';

import '../../fake_api/bloc/user_state.dart';

class UsersRemotePage extends StatefulWidget {
  const UsersRemotePage({Key? key}) : super(key: key);

  @override
  State<UsersRemotePage> createState() => _UsersRemotePageState();
}

class _UsersRemotePageState extends State<UsersRemotePage> {
  late RemoteUsersBloc remoteUsersBloc;
  final ScrollController _listController = ScrollController();
  bool _showUpButton = false;
  List<RemoteUser> users = [];
  int loadingThreshold = 10;
  bool _showLoadMore = false;
  int get count => users.length;

  @override
  void initState() {
    _listController.addListener(_scrollListener);
    remoteUsersBloc = context.read<RemoteUsersBloc>();
    remoteUsersBloc.add(FetchRemoteUsersEvent(limit: 20, skip: 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Users'),
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      floatingActionButton: Visibility(
        visible: _showUpButton,
        child: FloatingActionButton(
          mini: true,
          elevation: 0,
          backgroundColor: Colors.grey.shade500,
          onPressed: () {
            _listController.jumpTo(0);
            setState(() {
              _showUpButton = false;
            });
          },
          child: const Icon(
              Icons.vertical_align_top_outlined, color: Colors.white),
        ),
      ),
      body: BlocListener<RemoteUsersBloc, RemoteUsersState>(
        listener: (context, state) {
          if (state is RemoteUsersFetchedState) {
            setState(() {
              _showLoadMore = false;
              users.addAll(state.users);
              print(users.length);
            });
          }
        },
        child: SafeArea(
          child: BlocBuilder<RemoteUsersBloc, RemoteUsersState>(
            builder: (context, state) {
              if (state is RemoteUsersLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is RemoteUsersFetchedState) {
                return RefreshIndicator(
                  onRefresh: () async {
                    remoteUsersBloc.add(
                        FetchRemoteUsersEvent(limit: 20, skip: 0));
                  },
                  child: SizedBox(
                    height: double.infinity,
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification is ScrollUpdateNotification) {
                          setState(() {
                            _showUpButton = true;
                          });
                        }
                        return false;
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              controller: _listController,
                              itemCount: users.length,
                              itemBuilder: (BuildContext context, int index) {
                                return RemoteUserWidget(user: users[index]);
                              },
                            ),
                          ),
                          Visibility(
                            visible: _showLoadMore,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                                Text('Loading...')
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              } else if (state is RemoteUsersErrorState) {
                return Center(
                  child: Text('Some thing went wrong\n${state.error}'),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Future<bool> loadMore() async {
    print('load more');
    setState(() {
      _showLoadMore = true;
    });
    await Future.delayed(const Duration(milliseconds: 2500));
    remoteUsersBloc.add(FetchRemoteUsersEvent(limit: loadingThreshold, skip: users.length));
    return true;
  }

  void _scrollListener() {
    if (_listController.position.extentAfter < 200) {
      loadMore();
    }
  }
}
