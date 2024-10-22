import 'package:hive/hive.dart';

class AutoIncrementService {
  // Static method to generate the next auto-incremented ID
  static Future<int> getNextId(String model) async {
    // Open or retrieve the counter box
    var idCounterBox = await Hive.openBox<int>('id_counter');

    // Retrieve the current ID value and increment it
    int currentId = idCounterBox.get('${model}_id', defaultValue: 0)!;
    int nextId = currentId + 1;

    // Update the stored counter value with the incremented ID
    await idCounterBox.put('${model}_id', nextId);

    return nextId;
  }
}
