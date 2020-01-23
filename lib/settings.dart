import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app1/models/thememodel.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: Theme.of(context).textTheme.title),
        centerTitle: true,
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ThemeSettingCard(),
            Card(
              elevation: 0,
              child: InkWell(
                onTap: (){},
                child: ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text("About"),
                  subtitle: Text("Version 0.1.3"),
                ),
              )
            )

          ],
        ),
      ),
    );
  }
}

class ThemeSettingCard extends StatefulWidget {
  @override
  _ThemeSettingCardState createState() => new _ThemeSettingCardState();
}

class _ThemeSettingCardState extends State<ThemeSettingCard> {
  ThemeOptions _currentOption;
  @override
  Widget build(BuildContext context) {
    _currentOption = Provider.of<ThemeModel>(context).currentTheme;
    return Card(
        elevation: 0,
        child: InkWell(
          onTap: (){
            showDialog(
                context: context,
                child: SimpleDialog(
                  title: Text("Choose theme..."),
                  children: <Widget>[
                    RadioListTile<ThemeOptions>(
                      title: Text("System default"),
                      value: ThemeOptions.system,
                      groupValue: _currentOption,
                      onChanged: (value) {
                        Provider.of<ThemeModel>(context).setTheme(value);
                        setState(() {
                          _currentOption = value;
                        });
                        Navigator.pop(context);
                      },
                    ),
                    RadioListTile<ThemeOptions>(
                      title: Text("Light"),
                      value: ThemeOptions.light,
                      groupValue: _currentOption,
                      onChanged: (value) {
                        Provider.of<ThemeModel>(context).setTheme(value);
                        setState(() {
                          _currentOption = value;
                        });
                        Navigator.pop(context);
                      },
                    ),
                    RadioListTile<ThemeOptions>(
                      title: Text("Dark"),
                      value: ThemeOptions.dark,
                      groupValue: _currentOption,
                      onChanged: (value) {
                        Provider.of<ThemeModel>(context).setTheme(value);
                        setState(() {
                          _currentOption = value;
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
            );
          },
          child: ListTile(
            leading: Icon(Icons.palette),
            title: Text("Theme"),
            subtitle: Text((_currentOption == ThemeOptions.system) ? "System default"
                : ((_currentOption == ThemeOptions.light) ? "Light" : "Dark")),
          ),
        )
    );
  }
}