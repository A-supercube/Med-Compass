import 'package:flutter/material.dart';
import 'package:med_compass/pages/profile_screen.dart';
import 'package:med_compass/pages/searchscreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildSelectedScreen(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedScreen() {
    if (_selectedIndex == 0) {
      return _buildHomeScreen();
    } else if (_selectedIndex == 1) {
      return SearchPage();
    } else {
      return ProfileScreen();
    }
  }

  Widget _buildHomeScreen() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/nurse.jpg'), // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCurvedSearchBar(),
              SizedBox(height: 16),
              _buildNearbyHospitals(), // Display nearby hospitals using cards
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileScreen() {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
                'assets/avatar_profile.jpg'), // Replace with your image path
          ),
          SizedBox(height: 16),
          Text(
            'John Doe',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 8),
          Text(
            'Gmail',
            style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
          ),
          SizedBox(height: 16),
          Text(
            'Bio:',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 24, 22, 22)),
          ),
          SizedBox(height: 8),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ],
      ),
    );
  }

  Widget _buildCurvedSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16.0),
        ),
      ),
    );
  }

  Widget _buildNearbyHospitals() {
    // Dummy data for nearby hospitals
    List<Hospital> nearbyHospitals = [
      Hospital(name: 'Hospital A', photoUrl: 'assets/hospital_1.jpg'),
      Hospital(name: 'Hospital B', photoUrl: 'assets/hospital_2.jpg'),
      Hospital(name: 'Hospital C', photoUrl: 'assets/hospital_3.jpg'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nearby Hospitals',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16),
        Container(
          height: 200, // Adjust the height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: nearbyHospitals.length,
            itemBuilder: (context, index) {
              return _buildHospitalCard(nearbyHospitals[index]);
            },
          ),
        ),
        const Text(
          'Top Hospitals',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16),
        Container(
          height: 200, // Adjust the height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: nearbyHospitals.length,
            itemBuilder: (context, index) {
              return _buildHospitalCard(nearbyHospitals[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHospitalCard(Hospital hospital) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120, // Adjust the height as needed
            width: 200, // Adjust the width as needed
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(hospital.photoUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              hospital.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Hospital {
  final String name;
  final String photoUrl;

  Hospital({required this.name, required this.photoUrl});
}
