import "package:flutter/material.dart";
import "../controller/albums_controller.dart";
import "./photo_screen.dart";

class AlbumItem extends StatelessWidget {
  final String title;
  final int id;

  const AlbumItem({Key? key, required this.title, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PhotoScreen(
                      id: id,
                      name: title,
                    )));
      },
      leading: const CircleAvatar(
        child: Icon(Icons.image),
      ),
      title: Text(title),
    );
  }
}

class AlbumList extends StatelessWidget {
  final int id;
  const AlbumList({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AlbumsController albumsController = AlbumsController();

    return FutureBuilder(
      future: albumsController.getAlbumsByUserId(id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return AlbumItem(
                title: snapshot.data?[index].title ?? "",
                id: snapshot.data?[index].id ?? 0,
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class AlbumScreen extends StatelessWidget {
  final int id;
  final String name;

  const AlbumScreen({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: AlbumList(id: id),
    );
  }
}
