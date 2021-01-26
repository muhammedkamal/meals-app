import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_darwer.dart';

class FiltersScreen extends StatefulWidget {
  final Map<String, bool> _currentFilters;
  static const String routeName = 'filters';
  final Function saveFilters;
  FiltersScreen(this.saveFilters, this._currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false,
      _vegetrian = false,
      _vegan = false,
      _lactoseFree = false;
  @override
  void initState() {
    // TODO: implement initState
    _glutenFree = widget._currentFilters['gluten'];
    _lactoseFree = widget._currentFilters['lactose'];
    _vegan = widget._currentFilters['vegan'];
    _vegetrian = widget._currentFilters['vegetrian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final _selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetrian': _vegetrian,
              };
              widget.saveFilters(_selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust Your Prefernces',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchItem("Gulten Free", 'Only Include Gulten Free Meals',
                    _glutenFree, (val) {
                  setState(() {
                    _glutenFree = val;
                  });
                }),
                buildSwitchItem("Lactose Free",
                    'Only Include Lactose Free Meals', _lactoseFree, (val) {
                  setState(() {
                    _lactoseFree = val;
                  });
                }),
                buildSwitchItem(
                    "Vegetrian", 'Only Include Vegetrian Meals', _vegetrian,
                    (val) {
                  setState(() {
                    _vegetrian = val;
                  });
                }),
                buildSwitchItem("Vegan", 'Only Include Vegan Meals', _vegan,
                    (val) {
                  setState(() {
                    _vegan = val;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SwitchListTile buildSwitchItem(
      String title, String subTitle, bool currentValue, Function onChanged) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subTitle),
      onChanged: onChanged,
    );
  }
}
