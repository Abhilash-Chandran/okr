import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:okr/global/service_locator.dart';
import 'package:okr/managers/objectives_manager.dart';
import 'package:okr/screens/objectives_grid.dart';

class LandingScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Your Name',
                        ),
                        controller: _userNameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a user name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  FlatButton.icon(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        setup(_userNameController.text);
                        await GetIt.instance.isReady<ObjectivesManager>();
                        GetIt.I<ObjectivesManager>().loadAllObjectivesCommand();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ObjectivesGrid()),
                        );
                      }
                    },
                    icon: Icon(Icons.save),
                    label: Text('Show my Objectives'),
                  ),
                  FlatButton.icon(
                    onPressed: () {
                      _userNameController.clear();
                    },
                    icon: Icon(Icons.cancel),
                    label: Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
