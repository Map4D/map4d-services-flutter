import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:map4d_services/map4d_services.dart';

void main() {
  runApp(const MyApp());
}

final List<ListTile> _list = <ListTile>[
  const ListTile(title: Text('Place Detail'),),
  const ListTile(title: Text('Auto Suggest'),),
  const ListTile(title: Text('Text Search'),),
  const ListTile(title: Text('Nearby Search'),),
  const ListTile(title: Text('Viewbox Search'),),
];

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void _placeDetail() async {
    final detail = await MFServices.places.getPlaceDetail('5c88df71d2c05acd14848f9e');
    //detail['result']['name'];
    print('Place Detail: $detail');
  }

  void _autoSuggest() async {
    final places = await MFServices.places.getPlacesSuggestion('Tam Giang',
      location: const MFLocationComponent(latitude: 16.575619, longitude: 107.530756),
      acronym: false,
    );
    print('Auto Suggest: $places');
  }

  void _textSearch() async {
    final places = await MFServices.places.getPlacesByTextSearch('abc',
      types: ['atm'],
      datetime: DateTime.now(),
      location: const MFLocationComponent(latitude: 16.075177, longitude: 108.220228)
    );
    //textSearch['result'][0]['name'];
    print('Text Search: $places');
  }

  void _nearbySearch() async {
    final places = await MFServices.places.getPlacesByNearbySearch(
      const MFLocationComponent(latitude: 16.075177, longitude: 108.220228),
      20000,
      text: 'Sịa',
      tags: ['point'],
      types: ['point'],
      datetime: DateTime.now(),
    );
    print('Nearby Search: $places');
  }

  void _viewboxSearch() async {
    final places = await MFServices.places.getPlacesByViewboxSearch(
      const MFViewboxComponent(southwest: MFLocationComponent(latitude: 16.056453967981348, longitude: 108.19387435913086),
                               northeast: MFLocationComponent(latitude: 16.093031550262133, longitude: 108.25927734375)),
      text: 'a',
      tags: ['Coopmart'],
      types: ['atm'],
      datetime: DateTime.now(),
    );
    print('Viewbox Search: $places');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Map4D Services'),
        ),
        body: ListView(children: [
          ListTile(
            leading: const Icon(Icons.place),
            title: const Text('Place Detail'),
            onTap: _placeDetail,),
          ListTile(
            leading: const Icon(Icons.place),
            title: const Text('Auto Suggest'),
            onTap: _autoSuggest,),
          ListTile(
            leading: const Icon(Icons.place),
            title: const Text('Text Search'),
            onTap: _textSearch,),
          ListTile(
            leading: const Icon(Icons.place),
            title: const Text('Nearby Search'),
            onTap: _nearbySearch,),
          ListTile(
            leading: const Icon(Icons.place),
            title: const Text('Viewbox Search'),
            onTap: _viewboxSearch,),
        ],),
      ),
    );
  }
}
