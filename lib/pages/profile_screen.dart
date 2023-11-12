import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController =
      TextEditingController(text: 'Ahad Hashmi');
  TextEditingController countryCodeController =
      TextEditingController(text: '+1');
  TextEditingController phoneController =
      TextEditingController(text: '1234567890');
  TextEditingController addressController =
      TextEditingController(text: 'abc address, xyz city');
  TextEditingController emailController =
      TextEditingController(text: 'ahadhashmideveloper@gmail.com');
  TextEditingController genderController = TextEditingController(text: 'Male');
  TextEditingController dobController =
      TextEditingController(text: '1990-01-01');
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/user.JPG'),
            ),
            const SizedBox(height: 20),
            _editableItem('Name', nameController, CupertinoIcons.person),
            const SizedBox(height: 10),
            _editableItem(
                'Country Code', countryCodeController, CupertinoIcons.globe),
            const SizedBox(height: 10),
            _editableItem('Phone', phoneController, CupertinoIcons.phone),
            const SizedBox(height: 10),
            _editableItem(
                'Address', addressController, CupertinoIcons.location),
            const SizedBox(height: 10),
            _editableItem('Email', emailController, CupertinoIcons.mail),
            const SizedBox(
              height: 20,
            ),
            _editableItem('Gender', genderController, CupertinoIcons.person_2),
            const SizedBox(height: 10),
            _editableItem(
                'Date of Birth', dobController, CupertinoIcons.calendar),
            const SizedBox(
              height: 20,
            ),
            if (isEditing)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _saveChanges();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text('Save Changes'),
                ),
              ),
            if (!isEditing)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isEditing = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text('Edit Profile'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _editableItem(
      String title, TextEditingController controller, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.deepOrange.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          )
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: isEditing
            ? TextField(
                controller: controller,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                ),
              )
            : Text(controller.text),
        leading: Icon(iconData),
        trailing: isEditing
            ? null
            : Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _saveChanges() async {
    setState(() {
      isEditing = false;
    });

    _showSnackbar('Profile updated!');
  }
}
