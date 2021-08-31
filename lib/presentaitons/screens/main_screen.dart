import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/morty_bloc_events.dart';
import 'package:rick_and_morty/bloc/morty_bloc_states.dart';
import 'package:rick_and_morty/bloc/morty_block.dart';
import 'package:rick_and_morty/domain/repositories/rick_and_morty_repositrorie.dart';
import 'package:rick_and_morty/presentaitons/screens/settings_page.dart';
import 'package:rick_and_morty/presentaitons/widgets/characters_list_widget.dart';
import 'package:rick_and_morty/presentaitons/widgets/episodes_list_widget.dart';
import 'package:rick_and_morty/presentaitons/widgets/loactions_list_widget.dart';

class MainScreen extends StatelessWidget {
  final rickAndMortyRepository = RickAndMortyRepository();
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(20.0),
        child: AppBar(),
      ),
      body: BlocBuilder<RickAndMortyBloc, RickAndMortyState>(
        builder: (context, state) {
          if (state is InfoIsEmpty) {
            return Center(child: Text('Pusto InfoIsEmpty'));
          }

          if (state is InfoIsLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is CharacterInfoIsLoaded) {
            return CharactersListWidget(
                cityController: cityController, loadedData: state.typeOfData);
          }

          if (state is EpisodeInfoIsLoaded) {
            return EpisodesListWidget(
              loadedData: state.typeOfData,
              cityController: cityController,
            );
          }

          if (state is LocationInfoIsLoaded) {
            return LocationsListWidget(
              loadedData: state.typeOfData,
              cityController: cityController,
            );
          }

          if (state is InfoError) {
            return Center(child: Text('Error'));
          }

          return Center(child: Text('Nothing in mainscreen'));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: 'Characters',
            icon: Icon(Icons.ac_unit),
          ),
          BottomNavigationBarItem(
            label: 'Episodes',
            icon: Icon(Icons.ac_unit),
          ),
          BottomNavigationBarItem(
            label: 'Locations',
            icon: Icon(Icons.ac_unit),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(Icons.ac_unit),
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              BlocProvider.of<RickAndMortyBloc>(context)
                  .add(SearchingCharactersList());
              break;
            case 1:
              BlocProvider.of<RickAndMortyBloc>(context)
                  .add(SearchingEpisodesList(episode: '01'));
              break;
            case 2:
              BlocProvider.of<RickAndMortyBloc>(context)
                  .add(SearchingLocationsList());
              break;
            case 3:
              ThemeMode themeMode = EasyDynamicTheme.of(context).themeMode;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SettingsPage(
                            themeMode: themeMode,
                          )));
              break;
            //
          }
        },
      ),
    );
  }
}
