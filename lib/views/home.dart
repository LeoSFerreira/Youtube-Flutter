import 'package:flutter/material.dart';
import 'package:youtube/util/custom_search.dart';
import 'package:youtube/views/biblioteca.dart';
import 'package:youtube/views/em_alta.dart';
import 'package:youtube/views/inicio.dart';
import 'package:youtube/views/inscricoes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _itemAtual = 0;
  String _res = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> _telas = [Inicio(_res), EmAlta(), Inscricoes(), Biblioteca()];

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey, opacity: 1),
          title: Image.asset(
            "images/youtube.png",
            width: 98,
            height: 22,
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.videocam),
            ),
            IconButton(
              onPressed: () async {
                // ignore: unused_local_variable
                String? r = await showSearch(
                    context: context, delegate: CustomSearch());
                setState(() {
                  _res = r!;
                });
              },
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_circle),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: _telas[_itemAtual],
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.red,
            onTap: (value) {
              setState(() {
                _itemAtual = value;
              });
            },
            currentIndex: _itemAtual,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.whatshot), label: "Em alta"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.subscriptions), label: "Inscrições"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_add_rounded), label: "Biblioteca"),
            ]));
  }
}
