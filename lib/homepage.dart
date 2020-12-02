import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.drawerAction}) : super(key: key);

  final Function drawerAction;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  bool drawer_open = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => drawer_open ? toggleDrawer() : null,
      onHorizontalDragEnd: (details) {},
      onHorizontalDragDown: (details) {
        details.globalPosition.direction;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => toggleDrawer(),
            child: Icon(drawer_open ? Icons.close : Icons.menu),
          ),
          title: Text('Helio World !'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  toggleDrawer() {
    drawer_open = !drawer_open;
    widget.drawerAction();
  }
}
