import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:training_example/constants/constants.dart';
import 'package:training_example/features/home/widgets/fruit_item.dart';
import 'package:training_example/features/home/widgets/horizontal_category.dart';
import 'package:training_example/generated/assets.dart';
import 'package:training_example/models/product/bloc/product_bloc.dart';
import 'package:training_example/models/product/bloc/product_event.dart';
import 'package:training_example/models/user_info/bloc/user_info_bloc.dart';
import 'package:training_example/models/user_info/bloc/user_info_event.dart';
import 'package:training_example/models/user_info/user.dart' as user_model;
import '../../../constants/fonts.dart';
import '../../../models/product/bloc/product_state.dart';
import '../../../models/user_info/bloc/user_info_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  late UserInfoBloc userInfoBloc;
  late user_model.UserInfo userInfo;
  final categories = Constants.categories;
  bool isImageError = false;
  late ProductBloc productBloc;

  int currentPickedCategory = 0;

  final CircleAvatar defaultAvatar = const CircleAvatar(
    radius: 25.0,
    backgroundImage: AssetImage(Assets.assetsImageDefault),
    backgroundColor: Colors.transparent,
  );

  @override
  void initState() {
    userInfoBloc = context.read<UserInfoBloc>();
    userInfoBloc.add(FetchCurrentUserInfoEvent());

    productBloc = context.read<ProductBloc>();
    productBloc.add(FetchProductsEvent(category: Constants.categories[0]));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          'Fruity',
          style: TextStyle(
              fontSize: 40,
              color: Colors.green.shade800,
              fontWeight: FontWeight.w900,
              fontFamily: Fonts.dancingBold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.menu_rounded,
            color: Colors.grey,
            size: 35,
          ),
          onPressed: () {},
        ),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 15),
              child: BlocBuilder<UserInfoBloc, UserInfoState>(
                bloc: userInfoBloc,
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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width / 4,
                left: 10.0,
                top: 35.0),
            child: const Text(
              'Discover Seasonal Fruits and Vegetables',
              style: TextStyle(
                fontSize: 30,
                fontFamily: Fonts.muktaMedium,
                height: 1.4,
              ),
            ),
          ),
          HorizontalCategory(
              categories: Constants.categories,
              initialIndex: currentPickedCategory,
              onCategoryChange: (index) {
                setState(() {
                  currentPickedCategory = index!;
                  productBloc.add(FetchProductsEvent(
                      category: Constants.categories[index]));
                });
              }),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductsLoadingState) {
                return const Expanded(
                    child: Center(child: CircularProgressIndicator()));
              } else if (state is ProductsErrorState) {
                return Expanded(
                    child: Center(
                        child:
                            Text('An Error has occurred! \n${state.error}')));
              } else if (state is ProductsFetchedState) {
                return Expanded(
                  child: Scrollbar(
                    thickness: 1.5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  crossAxisCount: 2,
                                  childAspectRatio: 3 / 5),
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            return FruitItem(
                                item: state.products[index],
                                onTap: () {
                                  GoRouter.of(context).pushNamed('detail',
                                      extra: state.products[index]);

                                });
                          }),
                    ),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
