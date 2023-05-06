import 'package:flutter/material.dart';
import 'package:fullstack_flutter_app/network_services/api.dart';

class CreateData extends StatefulWidget {
  const CreateData({Key? key}) : super(key: key);

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

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
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      NetworkApi.addUserDetails(
                          nameController.text,
                          phoneController.text,
                          addressController.text, (isSuccess, response) {
                        if (isSuccess) {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(response['message'])));
                        }
                      });
                    },
                    child: Text('Submit Data'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
