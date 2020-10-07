import 'package:flutter/material.dart';
import 'package:sqflite1/db/database.dart';
import 'package:sqflite1/model/client_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter SQFLite'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          RaisedButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                ClientDatabaseProvider.db.deleteAllClient();
                setState(() {});
              },
              child: Text(
                'Delete all',
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    color: Colors.red),
              ))
        ],
      ),
      body: FutureBuilder<List<Cliente>>(
        future: ClientDatabaseProvider.db.getAllClients(),
        builder: (BuildContext context, AsyncSnapshot<List<Cliente>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              //Count all records
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Cliente item = snapshot.data[index];

                return Dismissible(
                    key: UniqueKey(),
                    background: Container(color: Colors.red),
                    child: ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.phone),
                      leading: CircleAvatar(child: Text(item.id.toString())),
                    ));
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), onPressed: () {}
          //{ Navigator.of.(context).push(MaterialPageRoute(builder: (context) => AddEditClient())); }
          ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
