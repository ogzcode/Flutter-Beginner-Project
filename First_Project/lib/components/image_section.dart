import "package:flutter/material.dart";

class ImageSection extends StatelessWidget {
  ImageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "images/lake.jpg",
              fit: BoxFit.cover,
            )));
  }
}
