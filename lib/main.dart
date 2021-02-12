import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliver_appbar_ii_example/page/advanced_sliver_appbar.dart';
import 'package:sliver_appbar_ii_example/page/basic_sliver_appbar.dart';
import 'package:sliver_appbar_ii_example/page/tabbar_sliver_appbar.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Sliver App Bar';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: buildBottomBar(),
        body: buildPages(),
      );

  Widget buildBottomBar() {
    final style = TextStyle(color: Colors.white);

    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          icon: Text('SliverAppBar', style: style),
          title: Text('Basic'),
        ),
        BottomNavigationBarItem(
          icon: Text('SliverAppBar', style: style),
          title: Text('Advanced'),
        ),
        BottomNavigationBarItem(
          icon: Text('SliverAppBar', style: style),
          title: Text('TabBar'),
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return BasicSliverAppBar();
      case 1:
        return AdvancedSliverAppBar();
      case 2:
        return TabBarSliverAppbar();
      default:
        return Container();
    }
  }
}
