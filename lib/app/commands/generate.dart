import 'dart:io';
import 'package:flock/app/commands/i_command.dart';
import 'package:flock/core/constants.dart';
import 'package:flock/resources.resource_importer.dart' as resources;
import 'package:flock/core/util.dart';

class Generate implements ICommand {
  String _typeFile = "";
  String _path = "";
  String _name = "";

  @override
  execute() async {
    if (!(_path.trim().toLowerCase().endsWith(".tlpp") ||
        _path.trim().toLowerCase().endsWith(".prw"))) {
      print("Error: Invalid extension, please inform .tlpp or .prw");
      return;
    }

    var content = _getTemplate();

    if (content.isEmpty) {
      print("Error: Content template is empty!");
      return;
    }

    content = content.replaceAll("\$_name", _name);
    content = content.replaceAll(
        "\$_since", Util.formatDate(DateTime.now().toString()));

    await _createDirectory();

    final newFile = File(_path);

    if (newFile.existsSync()) {
      print("Error: File exists! Can't create file.");
      return;
    }

    newFile.createSync();
    newFile.writeAsStringSync(content);
  }

  @override
  setParams(List<String> params) {
    if (params.isNotEmpty) {
      _typeFile = params[0];
      _path = params.length >= 2 ? params[1] : "flockz.tlpp";

      //verify name function, class...
      try {
        //try get name inform for user
        if (params.length >= 3) {
          _name = params[2];
          //if not inform, get name on path
        } else {
          final aux = _path.split("/");

          if (aux.isNotEmpty) {
            final nameAux = aux.last.split(".").first;
            _name = nameAux.trim();
          }
        }
      } catch (e) {
        print(
            "Warning: Failed get name file, but not worry, maybe will be default 'FLOCKZ'");
      }

      if (_name.isEmpty) {
        _name = "FLOCKZ";
      }
    }
  }

  String _getTemplate() {
    var template = "";

    switch (_typeFile) {
      case Templates.object:
        template = resources.objectTemplate;
        break;
      case Templates.rest:
        template = resources.restTemplate;
        break;
      case Templates.scheduler:
        template = resources.schedulerTemplate;
        break;
      case Templates.mapExp:
        template = resources.mapExpTemplate;
        break;
      case Templates.mvcModOne:
        break;
      case Templates.mvcModTwo:
        break;
      default:
        print("Error: Template is not defined!");
    }

    return template;
  }

  _createDirectory() async {
    final folders = _path.split("/");

    if (folders.length > 1) {
      folders.removeAt(folders.length - 1);
      await Directory(folders
              .toString()
              .replaceAll("]", "")
              .replaceAll(", ", "/")
              .replaceAll("[", ""))
          .create(recursive: true);
    }
  }
}
