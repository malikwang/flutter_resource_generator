import 'dart:io';

List<String> dartFilesPath(String currentPath) {
  List<String> filesPath = [];
  final allContents = _readDir(currentPath, 'lib');

  for (final fileOrDir in allContents) {
    if (fileOrDir is File && fileOrDir.path.endsWith('.dart')) {
      filesPath.add(fileOrDir.path);
    }
  }
  return filesPath;
}

List<FileSystemEntity> _readDir(String currentPath, String name) {
  if (Directory('$currentPath/$name').existsSync()) {
    return Directory('$currentPath/$name').listSync(recursive: true);
  }
  return [];
}
