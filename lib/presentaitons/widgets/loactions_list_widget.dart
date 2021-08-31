import 'package:rick_and_morty/bloc/morty_bloc_events.dart';
import 'package:rick_and_morty/bloc/morty_block.dart';
import 'package:rick_and_morty/presentaitons/screens/pages/selected_location_page.dart';
import 'package:flutter/material.dart';

import 'package:rick_and_morty/domain/model/location_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationsListWidget extends StatelessWidget {
  final LocationsModel loadedData;
  final TextEditingController cityController;
  LocationsListWidget({this.loadedData, this.cityController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchingWidget(cityController, context),
        Text('Total amount: ${loadedData.info.count}'),
        Expanded(
          child: ListView.builder(
            itemCount: loadedData.results.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SingleCharacteItem(
                      loadedData: loadedData.results[index],
                    );
                  }));
                },
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: 250,
                  child: Column(
                    children: [
                      Flexible(
                          flex: 2,
                          child: Image(
                            image: AssetImage('assets/Location.png'),
                          )),
                      Flexible(
                          flex: 1,
                          child: Column(
                            children: [
                              Text('${loadedData.results[index].name}'),
                              Text(
                                  '${loadedData.results[index].type} * ${loadedData.results[index].dimension}')
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
          BlocProvider.of<RickAndMortyBloc>(context).add(
              SearchingSingleLocationList(locationName: cityController.text));
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
        hintText: "Location name",
        hintStyle: TextStyle(color: Colors.black87),
      ),
      style: TextStyle(color: Colors.black87),
    ),
  );
}
