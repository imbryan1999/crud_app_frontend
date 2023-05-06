import 'package:flutter/material.dart';
import 'package:fullstack_flutter_app/network_services/api.dart';
import 'package:fullstack_flutter_app/pages/delete_user.dart';
import 'package:fullstack_flutter_app/pages/homepage.dart';

class UpdateData extends StatefulWidget {
  var userList;

  UpdateData({Key? key, this.userList}) : super(key: key);

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.userList['user_name'] ?? '';
    phoneController.text = widget.userList['user_number'] ?? '';
    addressController.text = widget.userList['user_address'] ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration:
                      const InputDecoration(hintText: 'Enter your name here'),
                ),
                TextField(
                  controller: phoneController,
                  decoration:
                      const InputDecoration(hintText: 'Enter your phone here'),
                ),
                TextField(
                  controller: addressController,
                  decoration: const InputDecoration(
                      hintText: 'Enter your address here'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      NetworkApi.updateUser(
                          context,
                          widget.userList['id'].toString(),
                          nameController.text,
                          phoneController.text,
                          addressController.text, (isSuccess, response) {
                        if (isSuccess) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const HomePage()),
                              (route) => false);
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(response['message'])));
                        }
                      });
                    },
                    child: const Text('Update'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
