import 'package:flutter/material.dart';
import 'post_model.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  PostDetail({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      title: CircleAvatar(
                        child: Text(post.id.toString()),
                      ),
                    ),
                    ListTile(
                      title: const Text("title"),
                      subtitle: Text(post.title, style: TextStyle(fontWeight: FontWeight.w400),),
                      
                    ),
                    ListTile(
                      title: const Text("body"),
                      subtitle: Text(post.body),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
