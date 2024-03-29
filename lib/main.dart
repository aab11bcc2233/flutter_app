import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import './Tapbox.dart';

void main() {
//  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        "new_page": (context) => NewRouter(),
        "counter_page": (context) => CounterRouterWidget(),
        "tapbox_page": (context) => TapboxPage(),
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("open new router"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "new_page");
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => NewRouter()));
              },
            ),
            RandomWordsWidget(),
            FlatButton(
              child: Text("counter page"),
              onPressed: () => Navigator.pushNamed(context, "counter_page"),
            ),
            FlatButton(
              child: Text("tapbox page"),
              onPressed: () => Navigator.pushNamed(context, "tapbox_page"),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NewRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New router")),
      body: Center(
        child: Text("This is new router"),
      ),
    );
  }
}

class RandomWordsWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(wordPair.toString()),
    );
  }
}

class CounterRouterWidget extends StatelessWidget {
  static const String _TAG = "CounterRouterWidget: ";

  @override
  Widget build(BuildContext context) {
    print(_TAG + "build()");
//    return CounterWidget();
  return Text("xxx");
  }
}

class CounterWidget extends StatefulWidget {
  static const String _TAG = "CounterWidget: ";

  CounterWidget({Key key, this.initValue: 0}) {
    print(_TAG + "CounterWidget()");
  }

  final int initValue;

  @override
  State createState() {
    print(_TAG + "createState()");
    return _CounterWidgetState();
  }
}

class _CounterWidgetState extends State<CounterWidget> {
  static const String _TAG = "_CounterWidgetState: ";

  int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print(_TAG + "initState()");
  }

  @override
  Widget build(BuildContext context) {
    print(_TAG + "build()");
    return Scaffold(
      body: Center(
        child: FlatButton(
            onPressed: () => setState(() => _counter += 1),
            child: Text("$_counter")),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print(_TAG + "didUpdateWidget()");
  }

  @override
  void deactivate() {
    super.deactivate();
    print(_TAG + "deactivate()");
  }

  @override
  void dispose() {
    super.dispose();
    print(_TAG + "dispose()");
  }

  @override
  void reassemble() {
    super.reassemble();
    print(_TAG + "reassemble()");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print(_TAG + "didChangeDependencies()");
  }
}
