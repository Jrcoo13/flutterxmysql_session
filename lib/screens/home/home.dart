import 'package:code/screens/home/home_page.dart';
import 'package:code/utils/my_shared_preference.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final MySharedPreference _sharedPreference = MySharedPreference();

  int _currentIndex = 0;

  // Method to handle sign out
  Future<void> _signOut() async {
    await _sharedPreference.signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    final navItem = [
      const HomePage(),
      const Center(
        child: Text('Shopping Cart'),
      ),
      const Center(
        child: Text('Category'),
      ),
      Center(
        child: IconButton(
          onPressed: _signOut, // Use the _signOut method here
          icon: const Icon(Icons.logout),
        ),
      ),
    ];

    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.green,
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Shopping Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Category'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          ],
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.orange,
          currentIndex: _currentIndex,
          onTap: _onTapNavigation,
        ),
      ),
      body: navItem[_currentIndex],
    );
  }

  void _onTapNavigation(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
