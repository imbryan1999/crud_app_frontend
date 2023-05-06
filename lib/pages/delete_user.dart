import 'package:flutter/material.dart';
import 'package:fullstack_flutter_app/network_services/api.dart';
import 'package:fullstack_flutter_app/pages/update_data.dart';

import 'homepage.dart';

class DeleteUser extends StatefulWidget {
  const DeleteUser({Key? key}) : super(key: key);

  @override
  State<DeleteUser> createState() => _DeleteUserState();
}

class _DeleteUserState extends State<DeleteUser> {
  var userList = [];

  @override
  void initState() {
    NetworkApi.getUserDetails(context, (isSuccess, response) {
      if (isSuccess) {
        var data = response as List<dynamic>;
        data.forEach((e) {
          userList.add(e);
          setState(() {});
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: userList.isNotEmpty
                ? ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (BuildContext context, index) {
                      return Card(
                        child: ListTile(
                            title: Text(
                              userList[index]['user_name'],
                              textScaleFactor: 1.5,
                            ),
                            subtitle: Text(userList[index]['user_number']),
                            trailing: IconButton(
                                onPressed: () {
                                  NetworkApi.deleteUser(
                                      context, userList[index]['id'],
                                      (isSuccess, response) {
                                    if (isSuccess) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(content: Text(response['message'])));
                                      userList.removeAt(index);
                                      setState(() {});
                                    }
                                  });
                                },
                                icon: Icon(Icons.delete_forever_sharp))),
                      );
                    })
                : const Center(child: CircularProgressIndicator())));
  }
}
