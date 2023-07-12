import 'package:flutter/material.dart';

const List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    icon: Icon(Icons.list),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.search),
    label: 'Search',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.add),
    label: 'Add',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.favorite),
    label: 'Likes',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: 'Profile',
  ),
];

const List<Widget> screens = <Widget>[
  
];

class ArticlesView extends StatelessWidget {
  const ArticlesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Hello'),
    );
  }
}
