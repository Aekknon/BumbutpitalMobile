import 'package:bumbutpital/Authentication/Profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _controllerName = TextEditingController();
  final _controllerSurname = TextEditingController();
  final _controllerEmail = TextEditingController();
  String profileName = "";
  String profileSurname = "";
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFECF2FF),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0XFFECF2FF),
        elevation: 0,
        title: Text(
          "EDIT PROFILE",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                profileName = _controllerName.text;
                profileSurname = _controllerSurname.text;
                email = _controllerEmail.text;
                print('$profileName' + '$profileSurname' + '$email');
              });
              Navigator.pop(context);
            },
            icon: Icon(Icons.done),
            color: Colors.green,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6yT-obMdemGbSctinso7rd-tJGyxHhnxetinsg4Nwj2Va1nbirK_lT9wy2KEqIiAMjkw&usqp=CAU'),
                  radius: 60,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _controllerName,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Name",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      hintText: '$profileName'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  onChanged: (value) {
                    profileName = value.trim as String;
                  },
                  controller: _controllerSurname,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Surname",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      hintText: '$profileSurname'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _controllerEmail,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      hintText: '$email'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
