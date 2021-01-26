import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favourits_screen.dart';
import 'package:meals_app/widgets/main_darwer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPage = 0;
  void _selectPage(index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'pageScreen': CategoriesScreen(), 'pageTitle': 'Categories'},
      {
        'pageScreen': FavouritsScreen(widget.favouriteMeals),
        'pageTitle': 'Your Favouites'
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPage]['pageTitle'])),
      drawer: MainDrawer(),
      body: _pages[_selectedPage]['pageScreen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPage,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.category,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.star,
            ),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
/*  Top tab Bar

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dealy Meals'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.category,
                ),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(
                  Icons.star,
                ),
                text: 'Favourites',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [CategoriesScreen(), FavouritsScreen()],
        ),
      ),
    );
  }
}
 */
