import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
// import 'package:exexe/bloc/morty_bloc_events.dart';
// import 'package:exexe/bloc/morty_block.dart';
import 'package:flutter/material.dart';
// import 'package:exexe/presentaitons/widgets/theme_widget.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatefulWidget {
  final ThemeMode themeMode;
  SettingsPage({@required this.themeMode}) : super();

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingsPage> {
  String _onOrOff;
  final ThemeMode themeMode;

  _SettingPageState({this.themeMode});

  @override
  void initState() {
    super.initState();
    if (themeMode == ThemeMode.dark) {
      _onOrOff = 'on';
    } else {
      _onOrOff = 'off';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          Text('Type'),
          GestureDetector(
            child: Container(
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.palette),
                      SizedBox(
                        width: 8.0,
                      ),
                      Column(
                        children: [
                          Text('Dark theme'),
                          Text('Turn $_onOrOff'),
                        ],
                      )
                    ],
                  )),
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text('Dark theme'),
                        content: Column(
                          children: [
                            TextButton(
                                onPressed: () {
                                  EasyDynamicTheme.of(context)
                                      .changeTheme(dark: true);

                                  setState(() {
                                    _onOrOff = 'on';
                                  });
                                },
                                child: Text('Dark theme')),
                            TextButton(
                                onPressed: () {
                                  EasyDynamicTheme.of(context)
                                      .changeTheme(dark: false);

                                  setState(() {
                                    _onOrOff = 'off';
                                  });
                                },
                                child: Text('Light theme'))
                          ],
                        ),
                      ));
            },
          )
        ],
      ),
    );
  }
}
