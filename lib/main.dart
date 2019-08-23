import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      color: Colors.yellow,
      home: DefaultTabController(
        length: 4,
        child: new Scaffold(
          body: TabBarView(
            children: [
              new MyHomePage(
                title: "Colors.yellow",
              ),
              new MyDashBoard(title: "Colors.yellow",),
              new Dashboard(
              ),
              new MyDash(

              ),
            ],
          ),
          bottomNavigationBar: new TabBar(
            tabs: [
              Tab(
                icon: new Icon(Icons.home),
              ),
              Tab(
                icon: new Icon(Icons.rss_feed),
              ),
              Tab(
                icon: new Icon(Icons.perm_identity),
              ),
              Tab(icon: new Icon(Icons.settings),)
            ],
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.red,
          ),
          backgroundColor: Colors.black,
        ),
      ),
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

class MyDashBoard extends StatefulWidget {
  MyDashBoard({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
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
class Lesson {
  String title;
  String level;
  double indicatorValue;
  int price;
  String content;

  Lesson(
      {this.title, this.level, this.indicatorValue, this.price, this.content});
}
class _ListPageState extends State<MyDashBoard> {
  List lessons;

  @override
  void initState() {
    lessons = getLessons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Lesson lesson) => ListTile(
        contentPadding:
        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: Icon(Icons.autorenew, color: Colors.white),
        ),
        title: Text(
          lesson.title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Row(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  // tag: 'hero',
                  child: LinearProgressIndicator(
                      backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                      value: lesson.indicatorValue,
                      valueColor: AlwaysStoppedAnimation(Colors.green)),
                )),
            Expanded(
              flex: 4,
              child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(lesson.level,
                      style: TextStyle(color: Colors.white))),
            )
          ],
        ),
        trailing:
        Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)
    );

    Card makeCard(Lesson lesson) => Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: makeListTile(lesson),
      ),
    );

    final makeBody = Container(height: MediaQuery.of(context).size.height * 0.35,
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(lessons[index]);
        },
      ),
    );


    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: makeBody,
    );
  }
}
class Dashboard extends StatelessWidget {
  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55, 2, 3, 5, 8, 13, 21, 34, 55, 2, 3, 5, 8, 13, 21, 34, 55, 2, 3, 5, 8, 13, 21, 34, 55, 2, 3, 5, 8, 13, 21, 34, 55, 2, 3, 5, 8, 13, 21, 34, 55, 2, 3, 5, 8, 13, 21, 34, 55, 2, 3, 5, 8, 13, 21, 34, 55, 2, 3, 5, 8, 13, 21, 34, 55, 2, 3, 5, 8, 13, 21, 34, 55, 2, 3, 5, 8, 13, 21, 34, 55, 2, 3, 5, 8, 13, 21, 34, 55, 2, 3, 5, 8, 13, 21, 34, 55, 2, 3, 5, 8, 13, 21, 34, 55, 2, 3, 5, 8, 13, 21, 34, 55, 2, 3, 5, 8, 13, 21, 34, 55, 2, 3, 5, 8, 13, 21, 34, 55];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizontal ListView'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        height: MediaQuery.of(context).size.height * 0.20,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: numbers.length, itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Card(
              color: Colors.blue,
              child: Container(
                child: Center(child: Text(numbers[index].toString(), style: TextStyle(color: Colors.white, fontSize: 36.0),)),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class MyDash extends StatelessWidget {
  final List<int> numbers = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            'Headline',
            style: TextStyle(fontSize: 18),
          ),
          Expanded(

            child: ListView.builder(

              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) => Card(
                child: Container(padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                  height: MediaQuery.of(context).size.height * 0.5,child: Text('Dummy Card Text'),)
                ,
              ),
            ),
          ),

          Expanded(

            child: ListView.builder(

              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) => Card(
                child: Container(padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                  height: MediaQuery.of(context).size.height * 0.5,child: Text('Dummy Card Text'),)
                ,
              ),
            ),
          ),
          Text(
            'Demo Headline 2',
            style: TextStyle(fontSize: 18),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (ctx,int){
                return Card(
                  child: ListTile(
                      title: Text('Motivation $int'),
                      subtitle: Text('this is a description of the motivation')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
List getLessons() {
  return [
    Lesson(
        title: "Introduction to Driving",
        level: "Beginner",
        indicatorValue: 0.33,
        price: 20,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Observation at Junctions",
        level: "Beginner",
        indicatorValue: 0.33,
        price: 50,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Reverse parallel Parking",
        level: "Intermidiate",
        indicatorValue: 0.66,
        price: 30,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Reversing around the corner",
        level: "Intermidiate",
        indicatorValue: 0.66,
        price: 30,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Incorrect Use of Signal",
        level: "Advanced",
        indicatorValue: 1.0,
        price: 50,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Engine Challenges",
        level: "Advanced",
        indicatorValue: 1.0,
        price: 50,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Self Driving Car",
        level: "Advanced",
        indicatorValue: 1.0,
        price: 50,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.  ")
  ];
}
