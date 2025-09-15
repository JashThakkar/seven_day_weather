import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 7,
        child: _TabsNonScrollableDemo(),
      ),
    );
  }
}

class _TabsNonScrollableDemo extends StatefulWidget {
  @override
  __TabsNonScrollableDemoState createState() => __TabsNonScrollableDemoState();
}

class __TabsNonScrollableDemoState extends State<_TabsNonScrollableDemo>
    with SingleTickerProviderStateMixin, RestorationMixin {
  late TabController _tabController;

  final RestorableInt tabIndex = RestorableInt(0);

  @override
  String get restorationId => 'tab_non_scrollable_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    _tabController.index = tabIndex.value;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 7,
      vsync: this,
    );
    _tabController.addListener(() {
      setState(() {
        tabIndex.value = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    tabIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      'Sunday',
      'Monday',
      'Tuesday',
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday"
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Tabs Demo',
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          tabs: [
            for (final tab in tabs) Tab(text: tab),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/e/e4/San_Diego_Comic-Con_2024_Masquerade_-_Cosplay_of_Batman_3.jpg',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 10),
              Text(
                "Cloudy 54°F",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://openclipart.org/image/800px/214449",
                width: 150,
                height: 150,
              ),
              SizedBox(height: 10),
              Text(
                "Snowing -10°F",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://img.freepik.com/premium-vector/cartoon-illustration-sunny-day-with-blue-sky-fluffy-white-clouds-green-grassy-field-with-yellow-flowers_123891-97478.jpg?semt=ais_incoming&w=740&q=80",
                width: 150,
                height: 150,
              ),
              SizedBox(height: 10),
              Text(
                "Sunny 100°F",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://content.mycutegraphics.com/graphics/rain/girl-standing-in-rain.png",
                width: 150,
                height: 150,
              ),
              SizedBox(height: 10),
              Text(
                "Raining 95°F",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://www.shutterstock.com/image-vector/hail-hits-car-damaged-260nw-2103050930.jpg",
                width: 150,
                height: 150,
              ),
              SizedBox(height: 10),
              Text(
                "Hail -10°F",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/e/e4/San_Diego_Comic-Con_2024_Masquerade_-_Cosplay_of_Batman_3.jpg',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 10),
              Text(
                "Cloudy 54°F",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/e/e4/San_Diego_Comic-Con_2024_Masquerade_-_Cosplay_of_Batman_3.jpg',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 10),
              Text(
                "Cloudy 54°F",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
