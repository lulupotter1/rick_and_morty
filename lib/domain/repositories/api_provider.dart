import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/constants/constants.dart';
import 'package:rick_and_morty/domain/model/character_model.dart';
import 'package:rick_and_morty/domain/model/episodes_model.dart';
import 'package:rick_and_morty/domain/model/location_model.dart';

class RickAndMortyProvider {
  Future<CharactersModel> getCharactersList() async {
    var url = Uri.https(Constants.weatherBaseUrlDomain,
        Constants.weatherForecastPath + Constants.character);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return CharactersModel.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }

  Future<LocationsModel> getLocationsList() async {
    var url = Uri.https(Constants.weatherBaseUrlDomain,
        Constants.weatherForecastPath + Constants.location);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return LocationsModel.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }

  Future<EpisodesModel> getEpisodesList(String episodeSeason) async {
    final queryParameters = {
      'episode': episodeSeason,
    };

    var url = Uri.https(Constants.weatherBaseUrlDomain,
        Constants.weatherForecastPath + Constants.episode, queryParameters);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return EpisodesModel.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }

  //single get

  Future<CharactersModel> getSingleCharacterList(
      Map<String, String> queryParameters) async {
    var url = Uri.https(Constants.weatherBaseUrlDomain,
        Constants.weatherForecastPath + Constants.character, queryParameters);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return CharactersModel.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }

  Future<LocationsModel> getSingleLocationList(String locationName) async {
    final queryParameters = {
      'name': locationName,
    };

    var url = Uri.https(Constants.weatherBaseUrlDomain,
        Constants.weatherForecastPath + Constants.location, queryParameters);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return LocationsModel.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }

  Future<EpisodesModel> getSingleEpisodeList(String episodeName) async {
    final queryParameters = {
      'name': episodeName,
    };

    var url = Uri.https(Constants.weatherBaseUrlDomain,
        Constants.weatherForecastPath + Constants.episode, queryParameters);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return EpisodesModel.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}
