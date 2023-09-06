// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:youtube/util/api.dart';
import 'package:youtube/views/video_view.dart';

import '../models/video.dart';

class Inicio extends StatefulWidget {
  String pesquisa;
  Inicio(this.pesquisa);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _ListarVideos(String p) {
    Api api = Api();

    return api.pesquisar(p);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _ListarVideos(widget.pesquisa),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
            // ignore: dead_code
            break;
          case ConnectionState.active:
            break;
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    List<Video>? videos = snapshot.data;
                    Video video = videos![index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (contex) =>
                                    VideoView(videoID: video.id.toString())));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(video.imagem ?? ""),
                                    fit: BoxFit.cover)),
                          ),
                          ListTile(
                            title: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                video.titulo ?? "",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(video.canal ?? ""),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                  itemCount: snapshot.data!.length);
            } else {
              return Center(
                child: Text("Nenhum dado a ser exibido!"),
              );
            }
            // ignore: dead_code
            break;
        }
        return Center();
      },
    );
  }
}
