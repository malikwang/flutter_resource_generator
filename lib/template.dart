import 'package:path/path.dart' as path_library;

import 'path_util.dart';

class Template {
  Template(this.className);

  final String className;

  String license = '''/// Generate by [resource_generator](https://github.com/CaiJingLong/flutter_resource_generator) library.
/// PLEASE DO NOT EDIT MANUALLY.\n''';

  String get classDeclare => '''class $className {\n
  const $className._();\n''';
  String get classDeclareFooter => '}\n';

  String formatFiled(String path, String projectPath, bool isPreview) {
    if (isPreview) {
      return '''

  /// ![preview](file://$projectPath${path_library.separator}${_formatPreviewName(path)})
  static const String ${formatFileNameCamelCase(path)} = '$path';\n''';
    } else {
      return '''

  static const String ${formatFileNameCamelCase(path)} = '$path';\n''';
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
}
