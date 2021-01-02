import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:okr/managers/objectives_manager.dart';
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

  final _objectivesManager = GetIt.I<ObjectivesManager>();

  @override
  void initState() {
    super.initState();
    _objectiveTitleController =
        TextEditingController(text: widget.objective.title);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
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
                            child: !widget.objective.editMode
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
                          if (!widget.objective.editMode)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    _objectivesManager
                                        .toggleEditModeObjectiveCommand(
                                            widget.objective.id);
                                  }),
                            ),
                        ],
                      )),
                  Spacer(
                    flex: 1,
                  ),
                  Divider(),
                  Expanded(
                    flex: 6,
                    child: KeyResultsWidget(
                      objective: widget.objective,
                      objectiveController: _objectiveTitleController,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
