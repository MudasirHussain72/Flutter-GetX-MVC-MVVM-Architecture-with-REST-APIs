import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/res/components/internet_exception_widget.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_model/controller/home/home_view-models.dart';
import 'package:getx_mvvm/view_model/controller/user_preference/user_preference_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeController = Get.put(HomeController());
  UserPreference userPreference = UserPreference();
  @override
  void initState() {
    _homeController.userListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
              onTap: () {
                userPreference.removeUser().then((value) {
                  Get.toNamed(RouteName.loginScreen);
                });
              },
              child: Icon(Icons.logout)),
        ],
      ),
      body: Obx(() {
        switch (_homeController.rxRequestStatus.value) {
          case Status.LOADING:
            return CircularProgressIndicator();
          case Status.ERROR:
            if (_homeController.error.value == 'No Internetnull') {
              return InternetExceptionWidget(
                onPress: () {
                  _homeController.refreshUserListApi();
                },
              );
            } else {
              return Text(_homeController.error.toString());
            }
          case Status.COMPLETED:
            return ListView.builder(
              itemCount: _homeController.userList.value.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(_homeController
                          .userList.value.data![index].avatar
                          .toString()),
                    ),
                    title: Text(_homeController
                        .userList.value.data![index].firstName
                        .toString()),
                    subtitle: Text(_homeController
                        .userList.value.data![index].email
                        .toString()),
                    trailing: Text(_homeController
                        .userList.value.data![index].id
                        .toString()),
                  ),
                );
              },
            );
        }
      }),
    );
  }
}
