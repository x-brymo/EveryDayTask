import 'dart:io';

import 'package:console_bars/console_bars.dart';

import 'lib/check_flutter_version.dart';

void main() async {
  final packageFile = File('/packages.txt'); // Updated to look in the current directory

  if (!packageFile.existsSync()) {
    print('packages.txt not found.');
    return;
  }

  final pubspecFile = File('pubspec.yaml');
  if (!pubspecFile.existsSync()) {
    print('pubspec.yaml not found.');
    return;
  }

  final pubspecContent = await pubspecFile.readAsString();
  final flutterVersion = await getFlutterVersion();

  final packageContent = await packageFile.readAsString();
  final packageLines = packageContent.split('\n').where((line) => line.trim().isNotEmpty);

  for (var line in packageLines) {
    final packageName = line.trim();

    if (pubspecContent.contains('$packageName:')) {
      print('$packageName is already added.');
      continue;
    }

    final packageVersion = await choosePackageVersion(packageName, flutterVersion);
    print('Installing $packageName@$packageVersion...');
    
    final bar = FillingBar(
      desc: 'Installing $packageName',
      total: 100,
      percentage: true,
    );

    for (var i = 0; i <= 100; i++) {
      await Future.delayed(Duration(milliseconds: 20));
      bar.increment();
    }

    // Simulate package installation
    final result = await Process.run('flutter', ['pub', 'add', '$packageName:$packageVersion']);

    if (result.exitCode == 0) {
      print('$packageName installed successfully.');
    } else {
      print('Error installing $packageName: ${result.stderr}');
    }
  }

  print('All packages installed.');
}
