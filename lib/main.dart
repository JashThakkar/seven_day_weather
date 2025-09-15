import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
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
      length: 4,
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
    final tabs = ['Tab 1', 'Tab 2', 'Tab 3', "Tab 4"];
    final colorsForTabs = [ const Color.fromRGBO(33, 150, 243, 1),  Colors.red,  Colors.deepPurpleAccent,  Colors.greenAccent];

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
          Container(
            color: colorsForTabs[0],
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Tab 1 is sooo COOL',
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('My Alert'),
                          content: const Text('I am alerting you'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text('Alert'),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: colorsForTabs[1],
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Text input',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Center(
                      // my image won't show at all I looked up what the reason maybe and I kept seeing that
                      // the image probably isn't cashed and the link is probably not cashed so I tried to 
                      // use the link in the browser but it kept giving me errors, I tried changing the link
                      // and using other images but nothing is working.
                      child: Image.network('https://upload.wikimedia.org/wikipedia/commons/e/e4/San_Diego_Comic-Con_2024_Masquerade_-_Cosplay_of_Batman_3.jpg', 
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: colorsForTabs[2],
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Button pressed in ${tabs[2]} tab!'),
                    ),
                  );
                },
                child: const Text('Click me'),
              ),
            ),
          ),
          Container(
            color: colorsForTabs[3],
            child: ListView(
              children: const [
                Card(
                  child: ListTile(title: Text('Item 1')),
                ),
                Card(
                  child: ListTile(title: Text('Item 2')),
                ),
              ],
            ),
          ),
        ],
    ),
    bottomNavigationBar: BottomAppBar(),
    );
  }
}
