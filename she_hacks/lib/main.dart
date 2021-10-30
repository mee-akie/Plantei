import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:she_hacks/pages/Conteudo_page.dart';
import 'package:she_hacks/pages/Home_page.dart';
import 'package:she_hacks/pages/Nutricionista_page.dart';
import 'package:she_hacks/pages/Perfil_page.dart';
import 'package:she_hacks/pages/Plantas/Plantas_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPageState(title: 'NOME DO APP'),
    );
  }
}

class MainPageState extends StatefulWidget {
  const MainPageState({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainPageState> createState() => _MainPageState();
}


class _MainPageState extends State<MainPageState> {

  int currentIndex = 0;

  final screens = [
    Home_page(),
    Plantas_page(),
    Nutricionista_page(),
    Conteudo_page(),
    Perfil_page()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(microseconds: 400),
              tabBackgroundColor: Color(0xFF9EBCA7),
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: "Home",
                ),
                GButton(
                  icon: LineIcons.heart,
                  text: 'Plantas',
                ),
                GButton(
                  icon: LineIcons.heart,
                  text: 'Nutricionista',
                ),
               GButton(
                  icon: LineIcons.search,
                  text: "Conteudo",
                ),
                GButton(
                  icon: LineIcons.user,
                  text: "Minha horta",
                ),
              ],
              selectedIndex: currentIndex,
              onTabChange: (index) => setState(() => currentIndex = index),
            ),
          ),
        ),
      ),

      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color(0xFF9EBCA7),
        elevation: 10
      ),
      body: screens[currentIndex],

      drawer: Drawer(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(padding: const EdgeInsets.only(top: 40),
              child: Container(
                child:  Text("Meu atalho 1"),
                )
              ),
              Container(
                child:  const Text("Meu atalho 2"),
              ),
              Container(
                child:  const Text("Meu atalho 3"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

