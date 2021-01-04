import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:okr/global/service_locator.dart';
import 'package:okr/managers/objectives_manager.dart';
import 'package:okr/managers/theme_manager.dart';
import 'package:okr/models/objective.dart';
import 'package:okr/screens/objectives_grid.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.width * 0.45,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Container(
                  width: 250,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Your Name or a Project Name',
                    ),
                    controller: _userNameController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a user name or a project name';
                      }
                      return null;
                    },
                  ),
                ),
                Spacer(),
                Wrap(
                  spacing: MediaQuery.of(context).size.width * 0.05,
                  runSpacing: MediaQuery.of(context).size.width * 0.05,
                  children: [
                    RaisedButton.icon(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          var userName = _userNameController.text;
                          setupUser(userName);
                          await GetIt.instance.allReady();
                          var _prefs = await GetIt.I<SharedPreferences>();
                          var userDataJson = _prefs.getString(userName);
                          var userData =
                              UserData.fromJson(jsonDecode(userDataJson));
                          GetIt.I<ObjectivesManager>()
                              .loadAllObjectivesCommand();
                          // User previous saved theme
                          GetIt.I<ThemeManager>()
                              .themeChangeCommand(userData.flexTheme);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ObjectivesGrid()),
                          );
                        }
                      },
                      icon: Icon(Icons.view_comfortable),
                      label: Text('Show Objectives'),
                    ),
                    RaisedButton.icon(
                      onPressed: () {
                        _userNameController.clear();
                      },
                      icon: Icon(Icons.clear),
                      label: Text('Clear'),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
