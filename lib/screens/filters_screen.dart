import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _firstYear = false;
  bool _secondYear = false;
  bool _thirdYear = false;
  bool _fourthYear = false;

  @override
  initState() {
    // _glutenFree = widget.currentFilters['gluten'];
    // _lactoseFree = widget.currentFilters['lactose'];
    // _vegetarian = widget.currentFilters['vegetarian'];
    // _vegan = widget.currentFilters['vegan'];
    _firstYear = widget.currentFilters['firstYear'];
    _secondYear = widget.currentFilters['secondYear'];
    _thirdYear = widget.currentFilters['thirdYear'];
    _fourthYear = widget.currentFilters['fourthYear'];

    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'firstYear': _firstYear,
                'secondYear': _secondYear,
                'thirdYear': _thirdYear,
                'fourthYear': _fourthYear,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Filter posts according to year',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'First Year',
                  'Only include posts from first year.',
                  _firstYear,
                  (newValue) {
                    setState(
                      () {
                        _firstYear = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Second Year',
                  'Only include posts from second year.',
                  _secondYear,
                  (newValue) {
                    setState(
                      () {
                        _secondYear = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Third Year',
                  'Only include posts from third year.',
                  _thirdYear,
                  (newValue) {
                    setState(
                      () {
                        _thirdYear = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Fourth Year',
                  'Only include posts from fourth year.',
                  _fourthYear,
                  (newValue) {
                    setState(
                      () {
                        _fourthYear = newValue;
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
