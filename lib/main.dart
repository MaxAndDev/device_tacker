import 'package:device_tracker/service/http.dart';
import 'package:flutter/material.dart';

import 'model/data_model.dart';
import 'view/add_dialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Device Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Device Tracker'),
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

  Future<PostList> post;

  @override
  void initState() {
    super.initState();
    post = fetchPost();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: 
        FutureBuilder<PostList>(
          future: post, 
          builder: (context, snapshot){
            if(snapshot.hasData){
              return(
                ListView.builder(
                  itemCount: snapshot.data.posts.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      leading: Icon(Icons.developer_mode),
                      title: Text(snapshot.data.posts[index].title),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                      onTap: () {
                        
                      },
                    );
                  },
                )
              );
            } else if(snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialogWidget(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}




