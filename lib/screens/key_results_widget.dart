import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:get_it/get_it.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:okr/managers/objectives_manager.dart';
import 'package:okr/models/objective.dart';

class KeyResultsWidget extends StatefulWidget {
  final Objective objective;
  final TextEditingController objectiveController;
  final Command<bool, bool> toggleEditModeCommand;
  const KeyResultsWidget({
    Key key,
    @required this.toggleEditModeCommand,
    @required this.objective,
    @required this.objectiveController,
  }) : super(key: key);

  @override
  _KeyResultsWidgetState createState() => _KeyResultsWidgetState();
}

class _KeyResultsWidgetState extends State<KeyResultsWidget> {
  List<KeyResult> _internalKeyResults;
  List<TextEditingController> _titleControllers = [];
  List<TextEditingController> _progressControllers = [];

  ObjectivesManager _objectivesManager = GetIt.I<ObjectivesManager>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommandBuilder(
        command: widget.toggleEditModeCommand,
        onData: (_, editMode, __) {
          _internalKeyResults = widget.objective.keyResults;
          if (_internalKeyResults.isEmpty) {
            var newKeyResult = KeyResult('', 0.0);
            _internalKeyResults.add(newKeyResult);
          }
          _internalKeyResults.forEach((element) {
            _titleControllers.add(TextEditingController(text: element.title));
            _progressControllers
                .add(TextEditingController(text: element.progress.toString()));
          });
          print('editmode for ${widget.objective.id} is $editMode');
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Key Result'),
                    Text('Progress'),
                  ],
                ),
              ),
              Divider(
                color: Theme.of(context).primaryColor,
              ),
              Expanded(
                flex: 5,
                child: ListView.separated(
                  itemCount: _internalKeyResults.length,
                  separatorBuilder: (_, __) {
                    return Divider();
                  },
                  itemBuilder: (context, index) {
                    var keyResult = _internalKeyResults[index];
                    return Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: editMode
                              ? TextFormField(
                                  controller: _titleControllers[index],
                                  decoration: InputDecoration(),
                                )
                              : Text(keyResult.title),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 2,
                          child: editMode
                              ? NumberInputPrefabbed.squaredButtons(
                                  controller: _progressControllers[index],
                                  initialValue: keyResult.progress,
                                  min: 0,
                                  max: 10,
                                  incDecBgColor: Theme.of(context)
                                      .accentColor
                                      .withAlpha(150),
                                  incIconSize: 22,
                                  decIconSize: 22,
                                  numberFieldDecoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                )
                              : Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CircularProgressIndicator(
                                      value: keyResult.progress / 10,
                                    ),
                                    Text(keyResult.progress.toString())
                                  ],
                                ),
                        ),
                        if (editMode)
                          Container(
                            height: 50,
                            child: VerticalDivider(
                              width: 20,
                            ),
                          ),
                        if (editMode)
                          IconButton(
                              icon: Icon(Icons.add),
                              color: Theme.of(context).accentColor,
                              onPressed: () {
                                setState(() {
                                  var newKeyResult = KeyResult('', 0.0);
                                  _internalKeyResults.add(newKeyResult);
                                  _titleControllers.add(TextEditingController(
                                      text: newKeyResult.title));
                                  _progressControllers.add(
                                      TextEditingController(
                                          text: newKeyResult.progress
                                              .toString()));
                                });
                              },
                              tooltip: 'Add key result'),
                        if (editMode)
                          IconButton(
                              icon: Icon(Icons.delete),
                              color: Colors.red,
                              onPressed: () {
                                if (_internalKeyResults.length != 1) {
                                  setState(() {
                                    _internalKeyResults.removeAt(index);
                                    _titleControllers.removeAt(index);
                                    _progressControllers.removeAt(index);
                                  });
                                }
                              },
                              tooltip: 'Remove key result'),
                      ],
                    );
                  },
                ),
              ),
              Divider(),
              if (editMode)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton.icon(
                        color: Theme.of(context).accentColor,
                        onPressed: () {
                          List<KeyResult> newKeyResults = [];
                          for (int i = 0; i < _internalKeyResults.length; i++) {
                            newKeyResults.add(KeyResult(
                                _titleControllers[i].text,
                                double.tryParse(_progressControllers[i].text)));
                          }
                          Objective newObjective = widget.objective.copyWith(
                              title: widget.objectiveController.text,
                              keyResults: newKeyResults);

                          if (newObjective.id.contains('temp_')) {
                            _objectivesManager
                                .addObjectiveCommand(newObjective);
                          } else {
                            _objectivesManager
                                .updateObjectiveCommand(newObjective);
                          }
                          widget.toggleEditModeCommand(false);
                        },
                        icon: Icon(Icons.add),
                        label: Text('Save Objective')),
                    RaisedButton.icon(
                        color: Theme.of(context).accentColor,
                        onPressed: () {
                          _objectivesManager
                              .cancelEditObjectiveCommand(widget.objective.id);
                          widget.toggleEditModeCommand(false);
                        },
                        icon: Icon(Icons.cancel),
                        label: Text('Cancel')),
                    if (!widget.objective.id.contains('temp_'))
                      RaisedButton.icon(
                          color: Theme.of(context).accentColor,
                          onPressed: () {
                            _objectivesManager
                                .deleteObjective(widget.objective.id);
                            widget.toggleEditModeCommand(false);
                          },
                          icon: Icon(Icons.delete),
                          label: Text('Delete')),
                  ],
                ),
            ],
          );
        });
  }
}
