import 'package:flutter/material.dart';
import 'package:my_first_project/screens/Profile/My Orders/my_orders_screen.dart'; // Ensure this file is created and imported
import 'package:my_first_project/constants.dart';
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
            backgroundColor: Colors.black.withOpacity(0.8),
          title: const Text('My Profile'),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 29.0,
            fontWeight: FontWeight.w400,
          ),
          actions: [
            IconButton(
              color: Colors.white,
              iconSize: 35,
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("images/profile3.png"),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Matilda Brown",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "matildabrown@mail.com",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              child: Divider(),
            ),
            ProfileMenuItem(
              title: "My orders",
              subtitle: "Already have 12 orders",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyOrdersScreen()),
                );
              },
            ),
            const SizedBox(height: 1),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(),
            ),
            ProfileMenuItem(
              title: "Shipping addresses",
              subtitle: "3 addresses",
              onTap: () {},
            ),
            const SizedBox(height: 1),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(),
            ),
            ProfileMenuItem(
              title: "Payment methods",
              subtitle: "Visa **34",
              onTap: () {},
            ),
            const SizedBox(height: 1),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(),
            ),
            ProfileMenuItem(
              title: "Promocodes",
              subtitle: "You have special promocodes",
              onTap: () {},
            ),
            const SizedBox(height: 1),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(),
            ),
            ProfileMenuItem(
              title: "My reviews",
              subtitle: "Reviews for 4 items",
              onTap: () {},
            ),
            const SizedBox(height: 1),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(),
            ),
            ProfileMenuItem(
              title: "Settings",
              subtitle: "Notifications, password",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const ProfileMenuItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
