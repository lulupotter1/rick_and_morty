import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/model/character_model.dart';
import 'package:rick_and_morty/domain/model/episodes_model.dart';
import 'package:rick_and_morty/domain/model/location_model.dart';

@immutable
abstract class RickAndMortyState {}

class InfoIsEmpty extends RickAndMortyState {}

class InfoIsLoading extends RickAndMortyState {}

class CharacterInfoIsLoaded extends RickAndMortyState {
  final CharactersModel typeOfData;
  CharacterInfoIsLoaded({@required this.typeOfData});
}

class EpisodeInfoIsLoaded extends RickAndMortyState {
  final EpisodesModel typeOfData;
  EpisodeInfoIsLoaded({@required this.typeOfData});
}

class LocationInfoIsLoaded extends RickAndMortyState {
  final LocationsModel typeOfData;
  LocationInfoIsLoaded({@required this.typeOfData});
}

class SingleCharacterInfoIsLoaded extends RickAndMortyState {
  final CharactersModel typeOfData;
  SingleCharacterInfoIsLoaded({@required this.typeOfData});
}

class SingleEpisodeInfoIsLoaded extends RickAndMortyState {
  final EpisodesModel typeOfData;
  SingleEpisodeInfoIsLoaded({@required this.typeOfData});
}

// class ListOfEpisodeInfoIsLoaded extends RickAndMortyState {
//   final List<EpisodesModel> typeOfData;
//   ListOfEpisodeInfoIsLoaded({@required this.typeOfData});
// }

class SingleLocationInfoIsLoaded extends RickAndMortyState {
  final LocationsModel typeOfData;
  SingleLocationInfoIsLoaded({@required this.typeOfData});
}

class InfoIsNotLoaded extends RickAndMortyState {}

class InfoError extends RickAndMortyState {}
