import 'package:flutter/material.dart';
import 'package:fullstack_flutter_app/network_services/api.dart';
import 'package:fullstack_flutter_app/pages/update_data.dart';

class UpdateUser extends StatefulWidget {
  const UpdateUser({Key? key}) : super(key: key);

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext) => UpdateData(
                                      userList: userList[index])));
                            },
                            icon: Icon(Icons.edit))),
                  );
                })
                : const Center(child: CircularProgressIndicator())));
  }
}
