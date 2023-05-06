import 'package:flutter/material.dart';
import 'package:fullstack_flutter_app/model/user_info_model.dart';
import 'package:fullstack_flutter_app/network_services/api.dart';
import 'package:fullstack_flutter_app/pages/update_data.dart';

class FetchData extends StatefulWidget {
  const FetchData({Key? key}) : super(key: key);

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
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
                            subtitle: Text(userList[index]['user_number'])),
                      );
                    })
                : const Center(child: CircularProgressIndicator())));
  }
}
