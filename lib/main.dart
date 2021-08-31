//  import 'package:exexe/bloc/morty_bloc_states.dart';
import 'package:rick_and_morty/bloc/morty_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentaitons/screens/main_screen.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(EasyDynamicThemeWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RickAndMortyBloc>(
        create: (context) => RickAndMortyBloc(),
        child: MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: EasyDynamicTheme.of(context).themeMode,
          home: MainScreen(),
        ));
  }
}
