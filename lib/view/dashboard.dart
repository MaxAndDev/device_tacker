import 'package:device_tracker/service/http.dart';
import 'package:flutter/material.dart';

import '../model/data_model.dart';
import '../view/add_dialog.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

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




