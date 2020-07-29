part of 'view.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter BLoC'),
      ),
      body: Container(
          child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
        if (state is PostInitial) {
          return Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          PostSuccess postLoaded = state as PostSuccess;
          return ListView.builder(
              itemCount: postLoaded.posts.length,
              itemBuilder: (context, index) {
                return SinglePost(post: postLoaded.posts[index]);
              });
        }
      })),
    );
  }
}
