// import 'package:exexe/bloc/morty_bloc_events.dart';
// import 'package:exexe/bloc/morty_block.dart';
import 'package:rick_and_morty/constants/constants.dart';
// import 'package:exexe/domain/model/character_model.dart';
// import 'package:exexe/domain/model/episodes_model.dart';
import 'package:rick_and_morty/domain/model/location_model.dart';
// import 'package:exexe/domain/model/episodes_model.dart';
import 'package:rick_and_morty/domain/repositories/rick_and_morty_repositrorie.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class SingleCharacteItem extends StatefulWidget {
  final LocationResults loadedData;
  SingleCharacteItem({this.loadedData}) : super();

  @override
  _SingleCharacteItemState createState() =>
      _SingleCharacteItemState(loadedData: loadedData);
}

class _SingleCharacteItemState extends State<SingleCharacteItem> {
  final LocationResults loadedData;
  _SingleCharacteItemState({this.loadedData});

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
                image: AssetImage('assets/Location.png'),
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
                  Text('${loadedData.dimension}'),
                ],
              )),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  'Episode decsription Episode decsription Episode decsription Episode decsription Episode decsription Episode decsription Episode decsription Episode decsription Episode decsription'),
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
                                      AssetImage('assets/Location.png')),
                              SizedBox(
                                width: 15.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${loadedData.created}',
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
                                  Text('${loadedData.dimension}',
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

