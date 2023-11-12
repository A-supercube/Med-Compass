import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


class BuildProfileScreen extends StatefulWidget {
  const BuildProfileScreen({Key? key}) : super(key: key);

  @override
  _BuildProfileScreenState createState() => _BuildProfileScreenState();
}

class _BuildProfileScreenState extends State<BuildProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load user details from JSON file when the screen is initialized
    loadUserDetails();
  }

  Future<void> loadUserDetails() async {
    // Read user details from a JSON file (for simplicity, let's assume the file exists)
    String jsonString = await File('assets/profile.json').readAsString();

    // Parse the JSON string to a Map
    Map<String, dynamic> userDetails = json.decode(jsonString);

    // Update text controllers with the loaded details
    nameController.text = userDetails['name'] ?? '';
    emailController.text = userDetails['email'] ?? '';
    phoneNumberController.text = userDetails['phoneNumber'] ?? '';
    sexController.text = userDetails['sex'] ?? '';
    addressController.text = userDetails['address'] ?? '';
    dobController.text = userDetails['dob'] ?? '';
  }

  Future<void> saveUserDetails() async {
    // Save user details to a JSON file
    Map<String, dynamic> userDetails = {
      'name': nameController.text,
      'email': emailController.text,
      'phoneNumber': phoneNumberController.text,
      'sex': sexController.text,
      'address': addressController.text,
      'dob': dobController.text,
    };

    String jsonString = json.encode(userDetails);

    // Write to the JSON file (for simplicity, let's assume the file exists)
    await File('path_to_your_json_file.json').writeAsString(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/avatar_profile.jpg'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: phoneNumberController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: sexController,
                decoration: const InputDecoration(
                  labelText: 'Sex',
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: dobController,
                decoration: const InputDecoration(
                  labelText: 'Date of Birth',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  // Call function to save user details when the "Update" button is pressed
                  await saveUserDetails();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Details updated successfully!'),
                    ),
                  );
                },
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
