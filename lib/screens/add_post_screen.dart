import 'package:flutter/material.dart';
import 'package:instagram_flutter/utils/color.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

// .............
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: IconButton(
    //     icon: const Icon(
    //       Icons.upload
    //     ),
    //     onPressed: () {

    //     },
    //     ),
    // );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('post to'),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Post',
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/rani.png'),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'write a caption....',
                  border: InputBorder.none,
                  hintMaxLines: 8,
                ),
              ),
            ),
            SizedBox(
              height: 45,
              width: 45,
              child: AspectRatio(
                aspectRatio: 487 / 451,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/rani.png'),
                    fit: BoxFit.fill,
                    alignment: FractionalOffset.topCenter,
                  )),
                ),
              ),
            ),
            const Divider(),
          ],
        )
      ]),
    );
  }
}
