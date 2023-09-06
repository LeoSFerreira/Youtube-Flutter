import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/video.dart';

const CHAVE_API_YOUTUBE = "";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response res = await http.get(Uri.parse(URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_API_YOUTUBE"
            "&q=$pesquisa"));
    if (res.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(res.body);

      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
    } else {
      throw Exception("Falha na requisição: ${res.statusCode}");
    }
  }
}
