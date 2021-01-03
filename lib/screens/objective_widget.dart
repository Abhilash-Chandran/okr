import 'package:flutter/material.dart';
import 'package:flutter_command/command_builder.dart';
import 'package:flutter_command/flutter_command.dart';

import 'package:okr/models/objective.dart';
import 'package:okr/screens/key_results_widget.dart';

class ObjectiveWidget extends StatefulWidget {
  final Objective objective;
  ObjectiveWidget(this.objective);
  @override
  _ObjectiveWidgetState createState() => _ObjectiveWidgetState();
}

class _ObjectiveWidgetState extends State<ObjectiveWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _objectiveTitleController;
  // And internal command to hold edit pass editMode flag between widgets.
  Command<bool, bool> toggleEditModeCommand;
  // ObjectivesManager _objectivesManager = GetIt.I<ObjectivesManager>();
  @override
  void initState() {
    super.initState();
    _objectiveTitleController =
        TextEditingController(text: widget.objective.title);
    toggleEditModeCommand = Command.createSync<bool, bool>(
        (x) => x, widget.objective.id.contains('temp_'),
        includeLastResultInCommandResults: true);
    toggleEditModeCommand.thrownExceptions.listen((error, _) {
      print('error in toggleComand \n $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: CommandBuilder(
            command: toggleEditModeCommand,
            onData: (_, editMode, __) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: !editMode
                                      ? Text(widget.objective.title)
                                      : TextFormField(
                                          decoration: InputDecoration(
                                            hintText: 'Objective',
                                          ),
                                          controller: _objectiveTitleController,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter an Objective';
                                            }
                                            return null;
                                          },
                                        ),
                                ),
                              ],
                            )),
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 6,
                          child: KeyResultsWidget(
                            objective: widget.objective,
                            toggleEditModeCommand: toggleEditModeCommand,
                            objectiveController: _objectiveTitleController,
                          ),
                        ),
                        if (editMode) Divider(),
                        if (!editMode)
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    setState(() {
                                      toggleEditModeCommand(true);
                                    });
                                  }),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
