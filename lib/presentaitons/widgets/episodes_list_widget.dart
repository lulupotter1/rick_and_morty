import 'package:rick_and_morty/bloc/morty_bloc_events.dart';
import 'package:rick_and_morty/bloc/morty_block.dart';
import 'package:rick_and_morty/presentaitons/screens/pages/selected_episode_page.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/constants.dart';
import 'package:rick_and_morty/domain/model/episodes_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EpisodesListWidget extends StatelessWidget {
  final EpisodesModel loadedData;
  final TextEditingController cityController;
  EpisodesListWidget({this.loadedData, this.cityController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchingWidget(cityController, context),
        Expanded(
          child: ListView.builder(
            itemCount: loadedData.results.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SingleEpisodeItem(
                        loadedData: loadedData.results[index]);
                  }));
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 1,
                          child: Container(
                              child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      AssetImage('assets/episodes.png')))),
                      SizedBox(
                        width: 15.0,
                      ),
                      Flexible(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                episodeString(
                                    loadedData.results[index].episode),
                                style: TextStyle(
                                    color: MainColors.colorOfAmberText,
                                    fontSize: 14.0),
                              ),
                              SizedBox(
                                height: 2.0,
                              ),
                              Text(
                                '${loadedData.results[index].name}',
                                style: TextStyle(fontSize: 20.0),
                              ),
                              SizedBox(
                                height: 2.0,
                              ),
                              Text('${loadedData.results[index].created}',
                                  style: TextStyle(
                                      color: MainColors.colorOfGreyText,
                                      fontSize: 12.0)),
                            ],
                          ))
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

String episodeString(String episode) {
  return 'Episode ${episode.substring(4, 6)}';
}

Widget searchingWidget(
    TextEditingController cityController, BuildContext context) {
  // String gender;
  // String status;
  return Container(
    height: 70.0,
    padding: EdgeInsets.all(8.0),
    child: TextFormField(
      onEditingComplete: () {
        if (cityController.text != null ||
            cityController.text != ' ' ||
            cityController.text != '') {
          BlocProvider.of<RickAndMortyBloc>(context)
              .add(SearchingSingleEpisodeList(
            episodeName: cityController.text,
          ));
        }
      },
      controller: cityController,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black87,
        ),
        suffix: IconButton(
          icon: Icon(Icons.filter_9_plus_sharp, color: Colors.black87),
          onPressed: () {},
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide:
                BorderSide(color: Colors.black87, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide:
                BorderSide(color: Colors.black87, style: BorderStyle.solid)),
        hintText: "Episode name",
        hintStyle: TextStyle(color: Colors.black87),
      ),
      style: TextStyle(color: Colors.black87),
    ),
  );
}
