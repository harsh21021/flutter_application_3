import 'package:flutter/material.dart';
import 'package:flutter_application_3/database.dart';
import 'package:flutter_application_3/model/create_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  //int _counter = 0;

  @override
  void initState() {
    super.initState();
    Database.fetchAppUser().then((value) {
      setState(() {
        
      });
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      // _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(bottom: 100),
        itemCount: Database.userData.length,
        itemBuilder: (context, index){
        return ListTile(
          onTap: (){
          Navigator.push(
          context,
          MaterialPageRoute(
          builder: (BuildContext context) => ManageUserNameState(data:Database.userData[index]),
    ),
  ).then((value)  
  {
    if(value!=null && value=='updated')
    {
      // fetch data
    Database.fetchAppUser().then((value) {
      setState(() {
        
      });
    });

    }
    
  });           },
  trailing: Text(Database.userData[index].email!),
          title: Text(Database.userData[index].name!),
          subtitle: Text(Database.userData[index].phone!),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
          context,
          MaterialPageRoute(
          builder: (BuildContext context) => ManageUserNameState(),
    ),
  ).then((value)  
  {
    if(value!=null && value=='updated')
    {
      // fetch data
    Database.fetchAppUser().then((value) {
      setState(() {
        
      });
    });

    }
    
  });        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
