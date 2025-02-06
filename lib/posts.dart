import 'package:flutter/material.dart';
import 'http_service.dart';
import 'post_model.dart';
import 'post_detail.dart';

class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post> posts = snapshot.data ?? [];
            return ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                Post post = posts[index];
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: ListTile(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PostDetail(post: post),
                      ),
                    ),
                    title: Text(
                      post.title,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text("User ID: ${post.userId}"),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
