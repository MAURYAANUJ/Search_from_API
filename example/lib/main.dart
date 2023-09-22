import 'package:example/searchfield.dart';
import 'package:flutter/material.dart';

import 'data_modal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search From API',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String name = "";
  List<dynamic> zoneData = [];
  List<dynamic> newZoneData = [];
  List<Modal> zoneListStatusMap = [];
  bool sectorBool = true;
  bool addressBool = true;
  TextEditingController selectSector = TextEditingController();

  @override
  void initState() {
    getDataFromAPI();
    super.initState();
  }

  void getDataFromAPI() {
    var data = [
      {
        "id": "78",
        "name": "01",
      },
      {
        "id": "425",
        "name": "1",
      },
      {
        "id": "453",
        "name": "1",
      },
      {
        "id": "45",
        "name": "10",
      },
      {
        "id": "87",
        "name": "10",
      },
      {
        "id": "85",
        "name": "10-New",
      },
      {
        "id": "786",
        "name": "11",
      },
      {
        "id": "465",
        "name": "11",
      },
      {
        "id": "657",
        "name": "11-New",
      },
      {
        "id": "5",
        "name": "12",
      },
      {
        "id": "57",
        "name": "12",
      },
      {
        "id": "8",
        "name": "12-New",
      },
      {
        "id": "49",
        "name": "13",
      },
      {
        "id": "47",
        "name": "13",
      },
      {
        "id": "7890",
        "name": "13-New",
      },
      {
        "id": "568",
        "name": "14",
      },
      {
        "id": "542",
        "name": "14",
      },
      {
        "id": "853",
        "name": "14-New",
      },
      {
        "id": "964",
        "name": "3",
      },
      {
        "id": "7805",
        "name": "3",
      },
    ];
    setState(() {
      zoneData = data;
      newZoneData = data;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _runZone(String enteredKeyword) {
    List<dynamic> results = [];
    if (enteredKeyword.isEmpty) {
      results = zoneData;
    } else {
      results = zoneData
          .where((user) => user["name"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      newZoneData = results;
      zoneListStatusMap =
          (newZoneData).map<Modal>((de) => Modal.fromMap(de)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (newZoneData.isNotEmpty) {
      zoneListStatusMap =
          (newZoneData).map<Modal>((de) => Modal.fromMap(de)).toList();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 45,
          ),
          Focus(
            onFocusChange: (cal) {
              var contain = zoneData
                  .where((element) => element['name'] == selectSector.text);
              if (contain.isEmpty) {
                setState(() {
                  selectSector.clear();
                });
              }
            },
            child: SearchField(
              suggestions: zoneListStatusMap
                  .map((Modal map) =>
                      SearchFieldListItem(map.name!, item: map))
                  .toList(),
              hint: "select Zone",
              suggestionState: Suggestion.hidden,
              onChange: (val) {
                _runZone(val);
              },
              cursorColor: sectorBool ? Colors.black54 : Colors.red,
              controller: selectSector,
              suggestionDirection: SuggestionDirection.down,
              onSuggestionTap: (SearchFieldListItem<Modal> x) {
                setState(() {
                  FocusManager.instance.primaryFocus?.unfocus();
                  setState(() {
                    if(x.item?.name==null){
                      name = x.item?.name??"";
                    }

                  });
                });
              },
            ),
          ),
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
