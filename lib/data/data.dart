import 'package:hive/hive.dart';

class NotesClass {
  static List<dynamic> data = [];
  static Future<Box<dynamic>> get getData async {
    var box = await Hive.openBox('Data');
    return box;
  }

  static void addData(String note, String hint) async {
    var box = await getData;
    data.add([note, hint]);
    await box.put('NoteLists', data);
  }

  static void retriveData() async {
    var box = await getData;
    data = box.get('NoteLists');
  }

  static void removeData(int index) async {
    var box = await getData;
    data.removeAt(index);
    box.delete('NoteLists');
    box.put('NoteLists', data);
  }
}
