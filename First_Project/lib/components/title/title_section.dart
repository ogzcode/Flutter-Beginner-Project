import "package:flutter/material.dart";

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _togleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            padding: const EdgeInsets.all(0),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              alignment: Alignment.center,
              icon: (_isFavorited
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border)),
              color: Colors.red[500],
              onPressed: _togleFavorite,
            )),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }
}

class TitleSection extends StatelessWidget {
  TitleSection({Key? key}) : super(key: key);

  final Widget leftSide = Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const Text(
      'Oeschinen Lake Campground',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    Text(
      'Kandersteg, Switzerland',
      style: TextStyle(
        color: Colors.grey[500],
      ),
    )
  ]));

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 32, right: 32, top: 16, bottom: 32),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [leftSide, const FavoriteWidget()],
        ));
  }
}
