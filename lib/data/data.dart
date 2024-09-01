import 'package:http/http.dart' as http;
import 'package:task7/comments/models/comments_models.dart';
import 'package:task7/posts/models/posts_models.dart';

class DataServecis {
  Future<List<Post>> getPosts() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await http.get(url);
    return postFromJson(response.body);
  }

  Future<List<Comment>> getComments() async {
    var url = Uri.parse(
        "https://jsonplaceholder.typicode.com/comments?postId=${postId}");
    var response = await http.get(url);
    return commentFromJson(response.body);
  }
}

int postId = 1;
