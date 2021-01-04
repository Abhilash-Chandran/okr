import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_command/command_builder.dart';
import 'package:get_it/get_it.dart';
import 'package:okr/managers/objectives_manager.dart';
import 'package:okr/managers/theme_manager.dart';
import 'package:okr/models/common_data.dart';
import 'package:okr/models/objective.dart';
import 'package:okr/screens/objective_widget.dart';

class ObjectivesGrid extends StatefulWidget {
  @override
  _ObjectivesGridState createState() => _ObjectivesGridState();
}

class _ObjectivesGridState extends State<ObjectivesGrid> {
  final ObjectivesManager _objectivesManager = GetIt.I<ObjectivesManager>();
  final ThemeManager _themeManager = GetIt.I<ThemeManager>();
  final ScrollController _gridScrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return CommandBuilder<FlexTheme, FlexTheme>(
        command: _themeManager.themeChangeCommand,
        onData: (context, flexTheme, param) {
          return MaterialApp(
            themeMode: flexTheme.themeMode,
            theme: FlexColorScheme.light(
              colors: FlexColor.schemesList[flexTheme.themeIndex].light,
              surfaceStyle: FlexSurface.medium,
              // Use comfortable on desktops instead of compact, devices as default.
              visualDensity: FlexColorScheme.comfortablePlatformDensity,
              fontFamily: 'Roboto',
            ).toTheme,
            darkTheme: FlexColorScheme.dark(
              colors: FlexColor.schemesList[flexTheme.themeIndex].light,
              surfaceStyle: FlexSurface.medium,
              // Use comfortable on desktops instead of compact, devices as default.
              visualDensity: FlexColorScheme.comfortablePlatformDensity,
              fontFamily: 'Roboto',
            ).toTheme,
            home: Scaffold(
              key: _scaffoldKey,
              drawer: Drawer(
                child: ListView(
                  children: [
                    Text('Hello'),
                    Text('Hello00'),
                  ],
                ),
              ),
              body: LayoutBuilder(builder: (context, constraints) {
                bool small = constraints.maxWidth <= 414;
                // bool medium =
                //     constraints.maxWidth > 414 && constraints.maxWidth <= 760;
                // bool large = constraints.maxWidth > 760;
                return Column(
                  children: [
                    // Show all the objectives in a grid view
                    Expanded(
                      flex: 1,
                      child: CommandBuilder<void, UserData>(
                        command: _objectivesManager.loadAllObjectivesCommand,
                        onData: (context, data, params) {
                          return data == null
                              ? Container()
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GridView.count(
                                    physics: ScrollPhysics(),
                                    controller: _gridScrollController,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    crossAxisCount: small ? 1 : 3,
                                    children: data.objectives
                                        .map(
                                          (objective) => Card(
                                            elevation: 10,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
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

                    // Add an objective button. Edit Theme. Change user/project.
                    Row(
                      children: [
                        Spacer(),
                        VerticalDivider(),
                        IconButton(
                            icon: Icon(Icons.format_paint),
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return CommandBuilder<FlexTheme, FlexTheme>(
                                        command:
                                            _themeManager.themeChangeCommand,
                                        onData: (_, flexTheme, __) {
                                          return Column(
                                            children: [
                                              FlexThemeModeSwitch(
                                                themeMode: flexTheme.themeMode,
                                                onThemeModeChanged:
                                                    (ThemeMode themeMode) {
                                                  _themeManager
                                                      .themeChangeCommand(
                                                          flexTheme.copyWith(
                                                              themeMode:
                                                                  themeMode));
                                                },
                                                flexSchemeData:
                                                    FlexColor.schemesList[
                                                        flexTheme.themeIndex],
                                              ),
                                              Divider(),
                                              Expanded(
                                                flex: 1,
                                                child: ListView.builder(
                                                  itemCount: FlexColor
                                                      .schemesList.length,
                                                  itemBuilder: (_, index) {
                                                    var colorScheme = FlexColor
                                                        .schemesList[index];
                                                    var color =
                                                        flexTheme.themeMode ==
                                                                ThemeMode.dark
                                                            ? colorScheme
                                                                .dark.primary
                                                            : colorScheme
                                                                .light.primary;
                                                    return ListTile(
                                                      leading: CircleAvatar(
                                                        backgroundColor: color,
                                                      ),
                                                      title: Text(
                                                          colorScheme.name),
                                                      onTap: () => _themeManager
                                                          .themeChangeCommand(
                                                        flexTheme.copyWith(
                                                            themeIndex: index),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              )
                                            ],
                                          );
                                        });
                                  });
                            }),
                        Spacer(
                          flex: 1,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton.icon(
                              onPressed: () {
                                _objectivesManager
                                    .initiateNewObjectiveCommand();
                                _gridScrollController.animateTo(
                                  _gridScrollController
                                      .position.maxScrollExtent,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.easeIn,
                                );
                              },
                              icon: Icon(Icons.add),
                              label: Text('New Objective')),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        IconButton(
                            icon: Icon(Icons.person),
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pop(true);
                            }),
                        Spacer(),
                      ],
                    )
                  ],
                );
              }),
            ),
          );
        });
  }
}
