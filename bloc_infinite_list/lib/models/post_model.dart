part of 'model.dart';

class Post extends Equatable {
  final int id;
  final String title;
  final String content;

  Post({this.id, this.title, this.content});

  @override
  List<Object> get props => [id, title, content];

  @override
  String toString() {
    return 'Post {id: $id}';
  }

  factory Post.createPost(Map<String, dynamic> object) {
    return Post(
        id: object['id'], content: object['body'], title: object['title']);
  }

  static Future<List<Post>> getPostFromAPI(int start, int limit) async {
    String apiUrl = 'https://jsonplaceholder.typicode.com/posts?_start=' +
        start.toString() +
        '&_limit=' +
        limit.toString();

    final result = await http.get(apiUrl);
    if (result.statusCode == 200) {
      final jsonData = json.decode(result.body) as List;

      return jsonData
          .map((item) =>
              Post(content: item['body'], id: item['id'], title: item['title']))
          .toList();
    } else {
      throw Exception('error fetching post from api');
    }
  }
}
