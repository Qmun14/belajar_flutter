import 'dart:convert';

import 'package:belajar_flutter/model/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FlutterNetworkPage extends StatefulWidget {
  @override
  _FlutterNetworkPageState createState() => _FlutterNetworkPageState();
}

class _FlutterNetworkPageState extends State<FlutterNetworkPage> {
  Map? post;
  List<Post> listPost = [];

  void getPost() async {
    String url = 'https://jsonplaceholder.typicode.com/posts/1';
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map responseBody = jsonDecode(response.body);
        post = responseBody;
      }
    } catch (e) {
      print(e);
    }
    setState(() {});
  }

  void getListPost() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List responseBody = jsonDecode(response.body);
        responseBody.forEach((itemPost) {
          listPost.add(Post.fromJson(itemPost));
        });
      }
    } catch (e) {
      print(e);
    }
    setState(() {});
  }

  void sendPost() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    try {
      print('Send Post Request');
      var response = await http.post(Uri.parse(url), body: {
        'title': 'foo',
        'body': 'bar',
        'userId': 1.toString(),
      });
      if (response.statusCode == 201) {
        print(response.statusCode);
        var responseBody = jsonDecode(response.body);
        print(responseBody);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getPost();
    getListPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Flutter Network Page'), titleSpacing: 0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              title: Text('Send/Post Data'),
              tileColor: Color.fromARGB(255, 170, 168, 168),
            ),
            ElevatedButton(
              onPressed: () => sendPost(),
              child: const Text('Send Post Data'),
            ),
            const ListTile(
              title: Text('Fetch Single Data'),
              tileColor: Color.fromARGB(255, 170, 168, 168),
            ),
            if (post != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User Id : ${post!['userId']}'),
                    Text('ID : ${post!['id']}'),
                    Text('Title : ${post!['title']}'),
                    Text('Body : ${post!['body']}')
                  ],
                ),
              ),
            const ListTile(
              title: Text('Fetch List Data'),
              tileColor: Color.fromARGB(255, 170, 168, 168),
            ),
            if (listPost.isNotEmpty)
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listPost.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(height: 1, thickness: 1),
                itemBuilder: (context, index) {
                  Post itemPost = listPost[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text('${itemPost.id ?? ''}')),
                    title: Text(itemPost.title ?? ''),
                    subtitle: Text(itemPost.body ?? ''),
                    trailing:
                        CircleAvatar(child: Text('${itemPost.userId ?? ''}')),
                  );
                },
              )
          ],
        ),
      ),
    );
  }
}
