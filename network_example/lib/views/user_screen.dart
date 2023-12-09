import 'dart:math';
import "package:flutter/material.dart";
import "../controller/user_controller.dart";
import "./album_screen.dart";

class UserItem extends StatelessWidget {
  final String name;
  final String email;
  final int id;
  final List<String> avatarPath = [
    "images/man-1.jpg",
    "images/man-2.jpg",
    "images/woman-1.jpg",
    "images/woman-2.jpg",
  ];

  UserItem(
      {Key? key, required this.name, required this.email, required this.id})
      : super(key: key);

  String getRandomAvatar() {
    final index = Random().nextInt(avatarPath.length);
    return avatarPath[index];
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AlbumScreen(
                      id: id,
                      name: name,
                    )));
      },
      leading: CircleAvatar(
        backgroundImage: AssetImage(getRandomAvatar()),
      ),
      title: Text(name),
      subtitle: Text(email),
    );
  }
}

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController userController = UserController();
    return FutureBuilder(
      future: userController.getUsers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return UserItem(
                name: snapshot.data?[index].name ?? "",
                email: snapshot.data?[index].email ?? "",
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

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: const UserList(),
    );
  }
}
