import 'package:path/path.dart' as path_library;

class Template {
  Template(this.className);

  final String className;

  String license =
      '''/// Generate by [resource_generator](https://github.com/CaiJingLong/flutter_resource_generator) library.
/// PLEASE DO NOT EDIT MANUALLY.\n''';

  String get classDeclare => '''class $className {\n
  const $className._();\n''';
  String get classDeclareFooter => '}\n';

  String formatFiled(String path, String projectPath, bool isPreview) {
    if (isPreview) {
      return '''

  /// ![preview](file://$projectPath${path_library.separator}${_formatPreviewName(path)})
  static const String ${_formatFiledNameCamelCase(path)} = '$path';\n''';
    } else {
      return '''

  static const String ${_formatFiledNameCamelCase(path)} = '$path';\n''';
    }
  }

  String _formatPreviewName(String path) {
    path = path.replaceAll(' ', '%20').replaceAll('/', path_library.separator);
    return path;
  }

  String _formatFiledName(String path) {
    path = path.replaceAll('/', '_').replaceAll('.', '_').replaceAll(' ', '_').replaceAll('-', '_').replaceAll('@', '_AT_');
    return path.toUpperCase();
  }

  String _formatFiledNameCamelCase(String path) {
    path = path.replaceAll('@', '_At_');
    List<String> results = path.split(RegExp(r'[/,., ,_,-]'))..removeWhere((String item) => item.isEmpty);
    results = results.map((String item) => toUppercaseFirstLetter(item.toLowerCase())).toList();
    path = results.join();
    path = '${path[0].toLowerCase()}${path.substring(1)}';
    return path;
  }

  String toUppercaseFirstLetter(String str) {
    return '${str[0].toUpperCase()}${str.substring(1)}';
  }
}
