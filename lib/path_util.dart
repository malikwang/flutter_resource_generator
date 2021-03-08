String formatFileNameCamelCase(String path) {
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
