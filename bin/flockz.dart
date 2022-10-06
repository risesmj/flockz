import 'package:flock/app/program.dart';

void main(List<String> arguments) {
  arguments = ["-g", "map-exp", "Teste1/Teste2/FRONMAP.tlpp", "FRONMAP"];
  Program.execute(arguments);
}
