// import 'package:exexe/bloc/morty_bloc_events.dart';
// import 'package:exexe/bloc/morty_block.dart';
import 'package:rick_and_morty/constants/constants.dart';
import 'package:rick_and_morty/domain/model/character_model.dart';
// import 'package:exexe/domain/model/episodes_model.dart';
import 'package:rick_and_morty/domain/repositories/rick_and_morty_repositrorie.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class SingleSelectedItem extends StatefulWidget {
  final CharacterResults loadedData;
  SingleSelectedItem({this.loadedData}) : super();

  @override
  _SingleSelectedItemState createState() =>
      _SingleSelectedItemState(loadedData: loadedData);
}

class _SingleSelectedItemState extends State<SingleSelectedItem> {
  final CharacterResults loadedData;
  _SingleSelectedItemState({this.loadedData});

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<RickAndMortyBloc>(context)
    //               .add(SearchingSingleEpisodeList(isList: true, episodesListUrl:loadedData.episode));
  }

  final RickAndMortyRepository rickAndMortyRepository =
      RickAndMortyRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200.0),
          child: AppBar(
            flexibleSpace: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
              child: Image(
                image: NetworkImage(loadedData.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              child: Center(
                  child: Column(
                children: [
                  Text('${loadedData.name}'),
                  Text('${loadedData.status}'),
                ],
              )),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  'Character decsription Character decsription Character decsription Character decsription Character decsription Character decsription Character decsriptionCharacter decsriptionCharacter decsription'),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text('Gender'),
                          Text('${loadedData.gender}')
                        ],
                      ),
                      SizedBox(
                        width: 150.0,
                      ),
                      Column(
                        children: [
                          Text('Gender'),
                          Text('${loadedData.gender}')
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Origin'),
                          Text('${loadedData.origin.name}')
                        ],
                      ),
                      IconButton(
                          icon: Icon(Icons.arrow_right_alt), onPressed: () {})
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Location'),
                          Text('${loadedData.location.name}')
                        ],
                      ),
                      IconButton(
                          icon: Icon(Icons.arrow_right_alt), onPressed: () {})
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: 20,
              color: Colors.black,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      NetworkImage(loadedData.image)),
                              SizedBox(
                                width: 15.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${loadedData.status}',
                                    style: TextStyle(
                                        color: MainColors.colorOfAmberText,
                                        fontSize: 14.0),
                                  ),
                                  SizedBox(
                                    height: 2.0,
                                  ),
                                  Text(
                                    '${loadedData.name}',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 2.0,
                                  ),
                                  Text(
                                      '${loadedData.species}, ${loadedData.gender}',
                                      style: TextStyle(
                                          color: MainColors.colorOfGreyText,
                                          fontSize: 12.0)),
                                ],
                              ),
                            ]),
                            Icon(Icons.arrow_right_alt)
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ));
  }
}

// List<EpisodesModel> loadEpisodes(List<String> episodesUrl) {
//   return null;
// }

// EpisodeResults gettingSingleEpisodeByNameOfCharacter(String episodeLink) {
//   return null;
// }

// dynamic singeEpisodeLoadedData =
//                         gettingSingleEpisodeByNameOfCharacter(
//                             loadedData.episode[index]);
