import 'package:flock/app/commands/generate.dart';
import 'package:flock/app/commands/help.dart';
import 'package:flock/core/constants.dart';
import 'commands/all_templates.dart';
import 'commands/i_command.dart';

class Program {
  static execute(List<String> arguments) {
    ICommand? command;
    var params = <String>[];

    if (arguments.isNotEmpty) {
      switch (arguments[0]) {
        case CommandLine.generate:
          command = Generate();
          break;
        case CommandLine.showAllTemplates:
          command = AllTemplates();
          break;
        case CommandLine.help:
          command = Help();
          break;
      }
    }

    if (command != null) {
      params = arguments.sublist(1);
      command.setParams(params);
      command.execute();
    } else {
      print(
          "Command not found, see the all commands disponibles with 'flockz help'");
    }
  }
}
