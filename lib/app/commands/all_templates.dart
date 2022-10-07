import 'package:flock/app/commands/i_command.dart';

class AllTemplates implements ICommand {
  @override
  execute() {
    print("All templates disponibles");
    print("----------------------------------------");
    print("* object: Create CLASS object");
    print("* rest: Create API REST");
    print("* scheduler: Create scheduler for Jobs");
    print("* map-exp: Create customer map");
  }

  @override
  setParams(List<String> params) {}
}
