part of 'view.dart';

class SinglePost extends StatelessWidget {
  final Post post;

  const SinglePost({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '${post.id}',
        style: TextStyle(fontSize: 10.0),
      ),
      title: Text(post.title),
      isThreeLine: true,
      subtitle: Text(post.content),
      dense: true,
    );
  }
}
