import 'package:hive_flutter/hive_flutter.dart';
import 'package:proarea_catsapp/cat_facts_history/data/model/history_record.dart';
import 'package:proarea_catsapp/config/app_config.dart';

class HistoryRepo {
  Future<void> addRecord(HistoryRecord factRecord) async {
    final box = await Hive.openBox(hiveCollectionName);
    await box.add(factRecord);
    await box.close();
  }

  Future<List<HistoryRecord>> readRecords() async {
    final box = await Hive.openBox(hiveCollectionName);

    final items = Hive.box(hiveCollectionName).values;

    final List<HistoryRecord> records = [];
    for (final item in items) {
      records.add(HistoryRecord(text: item.text, createdAt: item.createdAt));
    }
    await box.close();

    return records;
  }
}
