import 'dart:io';

Future<String> getFlutterVersion() async {
  final result = await Process.run('flutter', ['--version']);
  if (result.exitCode != 0) {
    throw Exception('Failed to get Flutter version: ${result.stderr}');
  }

  final versionLine = result.stdout.split('\n').firstWhere((line) => line.contains('Flutter'));
  final version = versionLine.split(' ')[1];
  return version;
}

Future<String> choosePackageVersion(String packageName, String flutterVersion) async {
  if (packageName == 'console_color') {
    // Example logic for choosing a version based on Flutter version
    if (flutterVersion.startsWith('2.')) {
      return '1.0.0';
    } else if (flutterVersion.startsWith('3.')) {
      return '2.0.0';
    }
  }
  // Default to latest version
  return 'latest';
}

void main() async {
  try {
    final flutterVersion = await getFlutterVersion();
    print('Current Flutter version: $flutterVersion');

    final packageFile = File('./packages.txt'); // Updated to look in the current directory
    if (!packageFile.existsSync()) {
      print('packages.txt not found.');
      return;
    }

    final packageContent = await packageFile.readAsString();
    final packageLines = packageContent.split('\n').where((line) => line.trim().isNotEmpty);

    for (var line in packageLines) {
      final packageName = line.trim();
      final packageVersion = await choosePackageVersion(packageName, flutterVersion);
      print('Chosen version for $packageName: $packageVersion');
    }
  } catch (e) {
    print('Error: $e');
  }
}
