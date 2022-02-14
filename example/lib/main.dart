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

  void _geocode() async {
    final geos = await MFServices.places.getGeocode(
      location: const MFLocationComponent(latitude: 16.024634, longitude: 108.209217),
      address: '31 Lê Văn Duyệt',
      viewbox: const MFViewboxComponent(southwest: MFLocationComponent(latitude: 16.056453967981348, longitude: 108.19387435913086),
                                        northeast: MFLocationComponent(latitude: 16.093031550262133, longitude: 108.25927734375))
    );
    print('Geocode: $geos');
  }

  void _directions() async {
    List<MFRouteType> routeTypes = <MFRouteType>[MFRouteType.motorway, MFRouteType.tunnel];
    List<MFLocationComponent> waypoints = <MFLocationComponent>[
      const MFLocationComponent(latitude: 16.081126855919138, longitude: 108.21412717916483)
    ];
    MFRouteRestriction avoid = MFRouteRestriction.restrictCircleArea(
      const MFLocationComponent(latitude: 16.080611, longitude: 108.218113),
      30,
      types: routeTypes);
    final directions = await MFServices.routes.getDirections(
      const MFLocationComponent(latitude: 16.08116088350121, longitude: 108.21979357460582),
      const MFLocationComponent(latitude: 16.08334260545329, longitude: 108.21651589082553),
      waypoints: waypoints,
      avoid: avoid
    );
    print('Directions: $directions');
  }

  void _routeETA() async {
    List<MFRouteType> routeTypes = <MFRouteType>[MFRouteType.motorway, MFRouteType.tunnel];
    List<MFLocationComponent> origins = <MFLocationComponent>[
      const MFLocationComponent(latitude: 16.039173, longitude: 108.210912, alias: "alias1"),
      const MFLocationComponent(latitude: 16.039402, longitude: 108.211080, alias: 'alias2')
    ];

    MFRouteRestriction avoid = MFRouteRestriction.restrictCircleArea(
      const MFLocationComponent(latitude: 16.044597, longitude: 108.217263),
      30,
      types: routeTypes);

    final etas = await MFServices.routes.getRouteETA(
      origins,
      const MFLocationComponent(latitude: 16.0825981, longitude: 108.2219887),
      avoid: avoid
    );
    print('ETAs: $etas');
  }

  void _routeMatrix() async {
    List<MFRouteType> routeTypes = <MFRouteType>[MFRouteType.motorway, MFRouteType.tunnel];
    List<MFLocationComponent> origins = <MFLocationComponent>[
      const MFLocationComponent(latitude: 16.024634, longitude: 108.209217),
      const MFLocationComponent(latitude: 16.0717664, longitude: 108.2236151)
    ];

    List<MFLocationComponent> destinations = <MFLocationComponent>[
      const MFLocationComponent(latitude: 16.0717664, longitude: 108.2236151),
      const MFLocationComponent(latitude: 16.06104, longitude: 108.2167)
    ];

    MFRouteRestriction avoid = MFRouteRestriction.restrictCircleArea(
      const MFLocationComponent(latitude: 16.080611, longitude: 108.218113),
      30,
      types: routeTypes);

    final matrix = await MFServices.routes.getDistanceMatrix(
      origins,
      destinations,
      avoid: avoid
    );
    print('Matrix: $matrix');
  }

  void _routeGraph() async {
    List<MFRouteType> routeTypes = <MFRouteType>[MFRouteType.motorway, MFRouteType.tunnel];
    List<MFLocationComponent> points = <MFLocationComponent>[
      const MFLocationComponent(latitude: 16.08116088350121, longitude: 108.21979357460582),
      const MFLocationComponent(latitude: 16.08334260545329, longitude: 108.21651589082553)
    ];
    MFRouteRestriction avoid = MFRouteRestriction.restrictCircleArea(
      const MFLocationComponent(latitude: 16.080611, longitude: 108.218113),
      30,
      types: routeTypes);
    final graph = await MFServices.routes.getRouteGraph(
      points,
      avoid: avoid
    );
    print('Graph: $graph');
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
            onTap: _placeDetail,
          ),
          ListTile(
            leading: const Icon(Icons.place),
            title: const Text('Auto Suggest'),
            onTap: _autoSuggest,
          ),
          ListTile(
            leading: const Icon(Icons.place),
            title: const Text('Text Search'),
            onTap: _textSearch,
          ),
          ListTile(
            leading: const Icon(Icons.place),
            title: const Text('Nearby Search'),
            onTap: _nearbySearch,
          ),
          ListTile(
            leading: const Icon(Icons.place),
            title: const Text('Viewbox Search'),
            onTap: _viewboxSearch,
          ),
          ListTile(
            leading: const Icon(Icons.adjust),
            title: const Text('Geocode'),
            onTap: _geocode,
          ),
          ListTile(
            leading: const Icon(Icons.edit_road),
            title: const Text('Directions'),
            onTap: _directions,
          ),
          ListTile(
            leading: const Icon(Icons.edit_road),
            title: const Text('Route ETA'),
            onTap: _routeETA,
          ),
          ListTile(
            leading: const Icon(Icons.edit_road),
            title: const Text('Route Matrix'),
            onTap: _routeMatrix,
          ),
          ListTile(
            leading: const Icon(Icons.edit_road),
            title: const Text('Route Graph'),
            onTap: _routeGraph,
          ),
        ],),
      ),
    );
  }
}
