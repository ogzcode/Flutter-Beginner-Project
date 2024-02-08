import 'package:flutter/material.dart';
import 'package:getx_example/views/album_list.dart';
import 'package:getx_example/views/fetch_btn.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GetX Counter App'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            FetchBtn(),
            AlbumList(),
          ],
        ),
      );
  }
}