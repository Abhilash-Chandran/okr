import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:okr/managers/objectives_manager.dart';
import 'package:okr/models/objective.dart';

class KeyResultsWidget extends StatefulWidget {
  final Objective objective;
  final TextEditingController objectiveController;
  const KeyResultsWidget({
    Key key,
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
    _internalKeyResults = widget.objective.keyResults;
    widget.objective.keyResults.forEach((element) {
      _titleControllers.add(TextEditingController(text: element.title));
      _progressControllers
          .add(TextEditingController(text: element.progress.toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (widget.objective.editMode)
          RaisedButton.icon(
              color: Theme.of(context).accentColor,
              onPressed: () {
                setState(() {
                  var newKeyResult = KeyResult('', 0.0);
                  _internalKeyResults.add(newKeyResult);
                  _titleControllers
                      .add(TextEditingController(text: newKeyResult.title));
                  _progressControllers.add(TextEditingController(
                      text: newKeyResult.progress.toString()));
                });
              },
              icon: Icon(Icons.add),
              label: Text('Add key result')),
        Expanded(
          flex: 1,
          child: ListView.separated(
            itemCount: _internalKeyResults.length,
            separatorBuilder: (_, __) {
              return Divider();
            },
            itemBuilder: (context, index) {
              var keyResult = _internalKeyResults[index];
              print('from key_results $index : $keyResult');
              return Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: widget.objective.editMode
                        ? TextFormField(
                            controller: _titleControllers[index],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Key Result'),
                          )
                        : Text(keyResult.title),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    child: widget.objective.editMode
                        ? TextFormField(
                            controller: _progressControllers[index],
                            decoration: InputDecoration(labelText: 'Progress'),
                          )
                        : Text(keyResult.progress.toString()),
                  )
                ],
              );
            },
          ),
        ),
        if (widget.objective.editMode)
          Row(
            children: [
              RaisedButton.icon(
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    List<KeyResult> newKeyResults = [];
                    for (int i = 0; i < _internalKeyResults.length; i++) {
                      newKeyResults.add(KeyResult(_titleControllers[i].text,
                          double.tryParse(_progressControllers[i].text)));
                    }
                    Objective newObjective = widget.objective.copyWith(
                        title: widget.objectiveController.text,
                        editMode: false,
                        keyResults: newKeyResults);

                    _objectivesManager.addObjectiveCommand(newObjective);
                  },
                  icon: Icon(Icons.add),
                  label: Text('Save Objective')),
              RaisedButton.icon(
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    _objectivesManager
                        .cancelEditObjectiveCommand(widget.objective.id);
                  },
                  icon: Icon(Icons.cancel),
                  label: Text('Cancel'))
            ],
          )
      ],
    );
  }
}
