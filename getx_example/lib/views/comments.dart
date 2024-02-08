import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controller/albums_controller.dart';

class Comments extends StatefulWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comments> {
  final AlbumsController albumsController = Get.find();

  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String id = Get.parameters['id']!;
    final comments = albumsController.albums
        .firstWhere((element) => element.id == int.parse(id))
        .comments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Obx(() => albumsController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.blue,
            ))
          : Container(
              padding: const EdgeInsets.all(24),
              child: Column(children: [
                TextField(
                  controller: _commentController,
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                    focusColor: Colors.black,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    hintText: 'Yorumunuzu girin',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_commentController.text.isNotEmpty) {
                      albumsController.addComment(id, _commentController.text);
                      _commentController.clear();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Yorum Yap'),
                ),
                const SizedBox(height: 32),
                Visibility(
                  visible: comments.isNotEmpty,
                  replacement: const Center(
                    child: Text(
                      'Bu albüm için henüz yorum yok.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  child: Expanded(
                    child: ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: ListTile(
                            title: Text(comments[index]),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0), // 8px yuvarlaklık
                              side: const BorderSide(color: Colors.blue), // Kenarlık rengi ve kalınlığı
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ]),
            )),
    );
  }
}
