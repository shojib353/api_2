import 'package:api_practice_2/presentation/widgets/add_post.dart';
import 'package:flutter/material.dart';


import '../../data/database/post_db.dart';
import '../../data/models/post.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Post> result = [];
  bool isLoading = true;
  PostDb postDb = PostDb();
  @override
  void initState() {
    //* Initial State
    super.initState();
    _loadPosts();
  }

  void _loadPosts() async {
    result = await postDb.postData();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: const Text('Posts'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    useSafeArea: true,
                    backgroundColor: Colors.lime.shade100,
                    isScrollControlled: true,
                    builder: (context) => Padding(
                        padding: EdgeInsets.only(
                          //* to adjust the keyboard in the screen
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: AddPost(modalContext: context)),
                  );
                },
                icon: const Icon(Icons.add))
          ],

      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: result.length,
              itemBuilder: (context, index) => ListTile(
                leading: Text("${result[index].id}"),
                title: Text(result[index].title!),
                subtitle: Text(result[index].body!),
              ),
            ),
    );
  }
}
