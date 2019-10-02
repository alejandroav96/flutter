import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'pageone.dart';

void main() => runApp(MyApp());

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
      home: MyHomePage(title: 'Alejandro'),
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  String text = "";
  String mText = "";
  TabController _tcontrol;
  double edad = 30;
  bool term = false;

  final GlobalKey<ScaffoldState> _skey = GlobalKey<ScaffoldState>();


  SimpleDialog _sb;

  @override
  void initState() {
    text = "Contador :";
    _tcontrol = TabController(length: 2, vsync: this);
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      text = "Has sumado +1: ";
    });
  }

  void _resstoreCounter() {
    setState(() {
      _counter = 0;
      text = "Contador: ";
    });
  }

  void _dimissCounter() {
    setState(() {
      text = "Has restado -1: ";
      _counter--;
    });
  }

  void notification1() {
    _skey.currentState.showSnackBar(SnackBar(
      content: Text("Notificación"),
    ));
  }

  SpeedDial buildSpeedDial() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      // child: Icon(Icons.add),
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      visible: true,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
          child: Icon(Icons.exposure_plus_1, color: Colors.white),
          backgroundColor: Colors.deepOrange,
          onTap: _incrementCounter,
          label: 'Sumar',
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelBackgroundColor: Colors.deepOrange,
        ),
        SpeedDialChild(
          child: Icon(Icons.exposure_neg_1, color: Colors.white),
          backgroundColor: Colors.green,
          onTap: _dimissCounter,
          label: 'Restar',
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelBackgroundColor: Colors.greenAccent,
        ),
      ],
    );
  }

  TabBar buildTabBar() {
    return TabBar(
      controller: _tcontrol,
      tabs: <Widget>[
        Tab(
          icon: Icon(Icons.home),
        ),
        Tab(
          icon: Icon(Icons.close),
        ),
      ],
    );
  }

  void dialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(title: Text("Advertencia"),
              content: Text("Errorsdasdasdasdas"),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.close), onPressed: () {
                  Navigator.pop(context);
                },),
                IconButton(icon: Icon(Icons.build), onPressed: () {
                  Navigator.pop(context);
                },)
              ],
            )
    );
  }

  void dialog1() {
    _sb = SimpleDialog(
      title: Text("Dialogo simple"),
      children: <Widget>[
        SimpleDialogOption(
          child: Text("Si"),
          onPressed: () {print("si");},
        ),
        SimpleDialogOption(
          child: Text("No"),
          onPressed: () {print("no");},
        ),
        SimpleDialogOption(
          child: Text("Cerrar"),
          onPressed: () {Navigator.pop(context);},
        )
      ],
    );
    showDialog(context: context, builder: (BuildContext context) => _sb);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _skey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title),
        elevation: 10.0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.restore), onPressed: _resstoreCounter),
        ],
        bottom: buildTabBar(),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Alejandro Álvarez"),
              accountEmail: Text("alejandroav96@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black26,
                child: Text("AA"),
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text("Opcion 1"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () =>
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => pageone('Opcion 1'))),
            ),
            ListTile(
              title: Text("Opcion 2"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () =>
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => pageone('Opcion 2'))),
            ),
            ListTile(
              title: Text("Cerrar"),
              trailing: Icon(Icons.close),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tcontrol,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      text,
                    ),
                    Text(
                      '$_counter',
                      style: Theme
                          .of(context)
                          .textTheme
                          .display1,
                    ),
                  ]),
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: (String txt) {
                    setState(() {
                      mText = txt;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: "Escriba su nombre", labelText: "Nombre"),
                ),
                Slider(
                  value: edad,
                  min: 16,
                  max: 70,
                  divisions: (70 - 16),
                  onChanged: (double value) {
                    setState(() {
                      edad = value;
                    });
                  },
                ),
                Text("Edad: $edad"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Switch(
                      value: term,
                      onChanged: (bool b) {
                        setState(() {
                          term = b;
                        });
                      },
                    ),
                    Text("Terminos y Condiciones")
                  ],
                ),
                RaisedButton(
                  onPressed: () {
                    notification1();
                    dialog1();
                  },
                  child: Text("Enviar"),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: buildSpeedDial(),
    );
  }
}
