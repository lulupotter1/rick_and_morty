import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/morty_bloc_events.dart';
import 'package:rick_and_morty/bloc/morty_bloc_states.dart';
import 'package:rick_and_morty/domain/model/character_model.dart';
import 'package:rick_and_morty/domain/model/episodes_model.dart';
import 'package:rick_and_morty/domain/model/location_model.dart';
import 'package:rick_and_morty/domain/repositories/rick_and_morty_repositrorie.dart';

class RickAndMortyBloc extends Bloc<RickAndMortyEvent, RickAndMortyState> {
  RickAndMortyBloc() : super(InfoIsEmpty());

  @override
  Stream<RickAndMortyState> mapEventToState(RickAndMortyEvent event) async* {
    final RickAndMortyRepository rickAndMortyRepository =
        RickAndMortyRepository();
    yield InfoIsEmpty();

    if (event is SearchingCharactersList) {
      yield InfoIsLoading();

      try {
        final CharactersModel _loadedCharactersList =
            await rickAndMortyRepository.getCharacters();
        yield CharacterInfoIsLoaded(typeOfData: _loadedCharactersList);
      } catch (_) {
        yield InfoError();
      }
    }

    if (event is SearchingEpisodesList) {
      yield InfoIsLoading();

      try {
        final EpisodesModel _loadedEpisodesList =
            await rickAndMortyRepository.getEpisodes('01');
        yield EpisodeInfoIsLoaded(typeOfData: _loadedEpisodesList);
      } catch (_) {
        yield InfoError();
      }
    }

    if (event is SearchingLocationsList) {
      yield InfoIsLoading();

      try {
        final LocationsModel _loadedLocationsList =
            await rickAndMortyRepository.getLocations();
        yield LocationInfoIsLoaded(typeOfData: _loadedLocationsList);
      } catch (_) {
        yield InfoError();
      }
    }

    if (event is SearchingSingleCharacterList) {
      yield InfoIsLoading();

      try {
        final CharactersModel _loadedCharactersList =
            await rickAndMortyRepository
                .getSingleCharacter(event.queryParameters);
        yield CharacterInfoIsLoaded(typeOfData: _loadedCharactersList);
      } catch (_) {
        yield InfoError();
      }
    }
    if (event is SearchingSingleEpisodeList) {
      yield InfoIsLoading();

      try {
        final EpisodesModel _loadedEpisodesList =
            await rickAndMortyRepository.getSingleEpisode(event.episodeName);
        yield EpisodeInfoIsLoaded(typeOfData: _loadedEpisodesList);
      } catch (_) {
        yield InfoError();
      }
    }
    if (event is SearchingSingleLocationList) {
      yield InfoIsLoading();

      try {
        final LocationsModel _loadedLocationsList =
            await rickAndMortyRepository.getSingleLocation(event.locationName);
        yield LocationInfoIsLoaded(typeOfData: _loadedLocationsList);
      } catch (_) {
        yield InfoError();
      }
    }

    // if (event is SearchingListEpisodeList) {
    //   yield InfoIsLoading();

    //   try {
    //     final List<EpisodesModel> _loadedEpisodesList =
    //         await rickAndMortyRepository.getListOfEpisode(event.episodeList);
    //     yield ListOfEpisodeInfoIsLoaded(typeOfData: _loadedEpisodesList);
    //   } catch (_) {
    //     yield InfoError();
    //   }
    // }
  }
}
