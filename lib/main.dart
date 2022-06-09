import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:led_control_mobile/mode_screen.dart';
import 'package:led_control_mobile/settings.dart';

const MaterialColor appColor = MaterialColor(0xFFF9D162, {
  50: Color.fromRGBO(238, 232, 224, 1.0),
  100: Color.fromRGBO(236, 227, 200, 1.0),
  200: Color.fromRGBO(245, 230, 191, 1.0),
  300: Color.fromRGBO(245, 222, 161, 1.0),
  400: Color.fromRGBO(245, 214, 130, 1.0),
  500: Color.fromRGBO(246, 208, 102, 1.0),
  600: Color.fromRGBO(245, 201, 79, 1.0),
  700: Color.fromRGBO(248, 198, 60, 1.0),
  800: Color.fromRGBO(252, 192, 27, 1.0),
  900: Color.fromRGBO(255, 186, 0, 1.0),
});

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  List<Widget> pages = [
    const ModePage(), SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
          primarySwatch: appColor,
        ),
        child: Scaffold(
          body: IndexedStack(
            index: selectedIndex,
            children: pages,
          ),
          bottomNavigationBar: buildBottomNavigationBar(),
        ));
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: (value) {
        setState(() {
          selectedIndex = value;
        });
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.wb_incandescent), label: "Режим"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Настройки"),
      ],
    );
  }
}


