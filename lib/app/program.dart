import 'package:flock/app/commands/generate.dart';
import 'package:flock/app/commands/help.dart';
import 'package:flock/core/constants.dart';
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
      }
    }

    if (command != null) {
      params = arguments.sublist(1);
    } else {
      command = Help();
    }

    command.setParams(params);
    command.execute();
  }
}
