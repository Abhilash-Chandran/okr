import 'package:flutter/material.dart';
import 'package:flutter_command/command_builder.dart';
import 'package:get_it/get_it.dart';
import 'package:okr/managers/objectives_manager.dart';
import 'package:okr/models/objective.dart';
import 'package:okr/screens/objective_widget.dart';

class ObjectivesGrid extends StatelessWidget {
  final ObjectivesManager _objectivesManager = GetIt.I<ObjectivesManager>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool small = constraints.maxWidth <= 414;
      bool medium = constraints.maxWidth > 414 && constraints.maxWidth <= 760;
      // bool large = constraints.maxWidth > 760;
      return Column(
        children: [
          // Show all the objectives in a grid view
          Expanded(
            flex: 1,
            child: CommandBuilder<void, Objectives>(
              command: _objectivesManager.loadAllObjectivesCommand,
              onData: (context, data, params) {
                return data == null
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.count(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          crossAxisCount: small
                              ? 1
                              : medium
                                  ? 3
                                  : 3,
                          children: data.objectives
                              .map(
                                (objective) => Card(
                                  elevation: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ObjectiveWidget(objective),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      );
              },
              whileExecuting: (_, __, ___) => Center(
                child: Column(
                  children: [
                    LinearProgressIndicator(),
                    Text('Known is a drop, unknown is an ocean'),
                  ],
                ),
              ),
            ),
          ),

          // Add an objective button
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              color: Theme.of(context).accentColor,
              child: FlatButton.icon(
                  onPressed: () {
                    _objectivesManager.initiateNewObjectiveCommand();
                  },
                  icon: Icon(Icons.add),
                  label: Text('Add an Objective')),
            ),
          )
        ],
      );
    });
  }
}
