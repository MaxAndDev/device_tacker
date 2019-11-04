class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.formJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
      );
  }
}

class PostList {
  final List<Post> posts;

  PostList({this.posts,});

  factory PostList.fromJson(List<dynamic> json){

    List<Post> posts = json.map((i)=>Post.formJson(i)).toList();
    return PostList(
      posts: posts,
    );
  }
}