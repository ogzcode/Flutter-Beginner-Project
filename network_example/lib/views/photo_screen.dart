import "package:flutter/material.dart";
import "../controller/photo_controller.dart";

class PhotoItem extends StatelessWidget {
  final String title;
  final String url;

  const PhotoItem({Key? key, required this.title, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey.shade500,
      color: const Color.fromARGB(255, 255, 255, 255),
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            children: [
              Image.network(url),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(title,
                    style: const TextStyle(fontSize: 16, color: Colors.black)),
              ),
            ],
          )),
    );
  }
}

class PhotoList extends StatelessWidget {
  final int id;
  const PhotoList({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PhotoController photoController = PhotoController();

    return FutureBuilder(
      future: photoController.getPhotosByAlbumId(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          // Hata durumunda işlemler burada yapılabilir
          return Center(
            child: Text('Hata: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // Veri yoksa veya boşsa gösterilecek widget
          return const Center(
            child: Text('Veri bulunamadı'),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return PhotoItem(
                title: snapshot.data![index].title,
                url: snapshot.data![index].url,
              );
            },
          );
        }
      },
    );
  }
}

class PhotoScreen extends StatelessWidget {
  final int id;
  final String name;
  const PhotoScreen({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: PhotoList(id: id),
    );
  }
}
