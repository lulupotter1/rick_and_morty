import 'package:rick_and_morty/bloc/morty_bloc_events.dart';
import 'package:rick_and_morty/bloc/morty_block.dart';
import 'package:rick_and_morty/presentaitons/screens/pages/selected_character_page.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/constants/constants.dart';
import 'package:rick_and_morty/domain/model/character_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersListWidget extends StatefulWidget {
  final CharactersModel loadedData;
  final TextEditingController cityController;
  CharactersListWidget({this.cityController, this.loadedData}) : super();

  @override
  _CharactersListWidgetState createState() => _CharactersListWidgetState(
      loadedData: loadedData, cityController: cityController);
}

class _CharactersListWidgetState extends State<CharactersListWidget> {
  final CharactersModel loadedData;
  final TextEditingController cityController;
  _CharactersListWidgetState({this.cityController, this.loadedData}) : super();
  int numberOfAxisCount;
  Icon icon;

  @override
  void initState() {
    super.initState();
    numberOfAxisCount = 1;
    icon = Icon(Icons.ac_unit);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        searchingWidget(cityController, context),
        Container(
          padding: EdgeInsets.all(8.0),
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total amount ${loadedData.info.count}'),
              IconButton(
                  icon: icon,
                  onPressed: () {
                    setState(() {
                      if (numberOfAxisCount == 1) {
                        numberOfAxisCount = 2;
                        icon = Icon(Icons.access_alarm);
                      } else if (numberOfAxisCount == 2) {
                        numberOfAxisCount = 1;
                        icon = Icon(Icons.ac_unit);
                      }
                    });
                  })
            ],
          ),
        ),
        Expanded(child: listViewWidget(numberOfAxisCount))
      ],
    );
  }

  GridView listViewWidget(int numberOfAxisCount) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: numberOfAxisCount,
      ),
      itemCount: loadedData.results.length,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SingleSelectedItem(
                        loadedData: loadedData.results[index])));
          },
          child: Row(
            children: [
              Flexible(
                  flex: 1,
                  child: CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          NetworkImage(loadedData.results[index].image))),
              SizedBox(
                width: 15.0,
              ),
              Flexible(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${loadedData.results[index].status}',
                        style: TextStyle(
                            color: MainColors.colorOfAmberText, fontSize: 14.0),
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
                      Text(
                          '${loadedData.results[index].species}, ${loadedData.results[index].gender}',
                          style: TextStyle(
                              color: MainColors.colorOfGreyText,
                              fontSize: 12.0)),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
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
              .add(SearchingSingleCharacterList(queryParameters: {
            'name': cityController.text,
          }));
        }
      },
      controller: cityController,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black87,
        ),
        suffix: IconButton(
          icon: Icon(
            Icons.filter_9_plus_sharp,
          ),
          onPressed: () {},
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(style: BorderStyle.solid)),
        hintText: "Character name",
        // hintStyle: TextStyle(),
      ),
      style: TextStyle(),
    ),
  );
}
