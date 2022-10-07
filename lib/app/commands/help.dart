import 'package:flock/app/commands/i_command.dart';

class Help implements ICommand {
  @override
  execute() {
    print("Commands");
    print("----------------------------------------");
    print("-g : Generate file tlpp or prw.");
    print("Arguments");
    print("# template: object, rest, scheduler or map-exp");
    print("# path: directory+file name + extension tlpp or prw");
    print("# procedure: procedure name");
    print("* Example: flockz -g scheduler path/order procedure_test.tlpp");
    print("----------------------------------------");
    print("-t : Print details templates.");
    print("No Arguments");
    print("* Example: flockz -t");
  }

  @override
  setParams(List<String> params) {}
}
