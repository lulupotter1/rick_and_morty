import 'package:rick_and_morty/domain/repositories/api_provider.dart';
import 'package:rick_and_morty/domain/model/character_model.dart';
import 'package:rick_and_morty/domain/model/episodes_model.dart';
import 'package:rick_and_morty/domain/model/location_model.dart';

class RickAndMortyRepository {
  RickAndMortyProvider _rickAndMortyProvider = RickAndMortyProvider();

  Future<CharactersModel> getCharacters() =>
      _rickAndMortyProvider.getCharactersList();

  Future<EpisodesModel> getEpisodes(String episode) =>
      _rickAndMortyProvider.getEpisodesList(episode);

  Future<LocationsModel> getLocations() =>
      _rickAndMortyProvider.getLocationsList();

  //single get

  Future<CharactersModel> getSingleCharacter(
          Map<String, String> queryParametrs) =>
      _rickAndMortyProvider.getSingleCharacterList(queryParametrs);

  Future<EpisodesModel> getSingleEpisode(String episodeName) {
    return _rickAndMortyProvider.getSingleEpisodeList(episodeName);
  }

  // Future<List<EpisodesModel>> getListOfEpisode(
  //      List<String> episodesListUrl) {
  //   return episodesListUrl
  //       .map((e) => _rickAndMortyProvider.getSingleEpisodeList(e)).toList();
  // }

  Future<LocationsModel> getSingleLocation(String locationName) =>
      _rickAndMortyProvider.getSingleLocationList(locationName);
}
