import 'package:flutter/cupertino.dart';
// import 'package:exexe/presentaitons/widgets/theme_widget.dart';
import 'package:flutter/material.dart';
// import 'package:equatable/equatable.dart';

@immutable
abstract class RickAndMortyEvent {}

class SearchingCharactersList extends RickAndMortyEvent {}

class SearchingEpisodesList extends RickAndMortyEvent {
  final String episode;
  SearchingEpisodesList({this.episode});
}

class SearchingLocationsList extends RickAndMortyEvent {}

class SearchingSingleCharacterList extends RickAndMortyEvent {
  // final String characterName;
  // final String characterStatus;
  // final String characterGender;

  final Map<String, String> queryParameters;

  SearchingSingleCharacterList({this.queryParameters});
}

class SearchingSingleEpisodeList extends RickAndMortyEvent {
  final String episodeName;

  SearchingSingleEpisodeList({this.episodeName});
}

class SearchingSingleLocationList extends RickAndMortyEvent {
  final String locationName;
  SearchingSingleLocationList({this.locationName});
}

// class SearchingListEpisodeList extends RickAndMortyEvent {
//   final List<String> episodeList;

//   SearchingListEpisodeList({this.episodeList});
// }
