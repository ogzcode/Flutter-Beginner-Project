import 'package:flutter/material.dart';

import '../screen/add.dart';
import '../screen/decrement.dart';
import '../screen/reset.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(),
          body: const TabBarView(children: [
            Add(),
            Decrement(),
            Reset(),
          ]),
          bottomNavigationBar: const TabBar(
            tabs: [
              Tab(
                  text: 'Add',
                  icon: Icon(
                    Icons.add_box,
                    size: 32,
                  )),
              Tab(
                  text: 'Decrement',
                  icon: Icon(
                    Icons.do_not_disturb_on,
                    size: 32,
                  )),
              Tab(
                  text: 'Reset',
                  icon: Icon(
                    Icons.autorenew,
                    size: 32,
                  )),
            ],
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.blue,
            indicatorColor: Colors.blue,
            indicatorWeight: 5,
            indicatorPadding: EdgeInsets.all(2),
            indicatorSize: TabBarIndicatorSize.label,
          ),
        ));
  }
}
