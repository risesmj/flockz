import 'package:flock/app/commands/i_command.dart';

class Help implements ICommand {
  @override
  execute() {
    print("Commands");
    print("----------------------------------------");
    print("-g : Generate file tlpp or prw.");
    print("Arguments");
    print("# template: object, rest, scheduler, mvc-1 or mvc-2.");
    print("# path: directory+file name + extension tlpp or prw");
    print("# procedure: procedure name");
    print("* Example: flutz -g scheduler path/order procedure_test.tlpp");
  }

  @override
  setParams(List<String> params) {}
}
