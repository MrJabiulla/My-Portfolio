import 'package:hive/hive.dart';

class LocalStorageService {
  static Future<Box<T>> openBox<T>(String boxName) async {
    return await Hive.openBox<T>(boxName);
  }
// Add CRUD helpers here
}