// ignore_for_file: invalid_annotation_target

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'dependency_injection.config.dart';
  
@InjectableInit(
  initializerName: r'$register',
  preferRelativeImports: false,
  asExtension: false,
)  
abstract final class DependencyInjection {
  static final GetIt instance = GetIt.instance..allowReassignment = true;

  static Future<void> registerDependencies() async {
    $register(instance);
  }
}