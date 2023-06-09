import 'package:better_hm/home/meals/models/canteen.dart';
import 'package:better_hm/home/meals/service/api_canteen.dart';
import 'package:better_hm/shared/logger/logger.dart';
import 'package:better_hm/shared/service/isar_service.dart';
import 'package:isar/isar.dart';

class CanteenService extends IsarService {
  static const showCanteens = [
    "MENSA_ARCISSTR",
    "MENSA_GARCHING",
    "MENSA_LEOPOLDSTR",
    "MENSA_LOTHSTR",
    "MENSA_MARTINSRIED",
    "MENSA_PASING",
    "MENSA_WEIHENSTEPHAN",
    "STUBISTRO_ARCISSTR",
    "STUBISTRO_GOETHESTR",
    "STUBISTRO_GROSSHADERN",
    "STUBISTRO_ROSENHEIM",
    "STUBISTRO_SCHELLINGSTR",
    "STUBISTRO_MARTINSRIED",
    "STUCAFE_ADALBERTSTR",
    "STUCAFE_AKADEMIE_WEIHENSTEPHAN",
    "STUCAFE_CONNOLLYSTR",
    "STUCAFE_GARCHING",
    "STUCAFE_KARLSTR",
    "MENSA_STRAUBING",
  ];

  static const loggerTag = "canteen service";

  Future<List<Canteen>> getCanteens() async {
    final isar = await db;
    final Logger logger = Logger(loggerTag);
    final List<Canteen> canteens = await isar.canteens.where().findAll();
    if (canteens.isEmpty) {
      logger.info("Cache is Empty. Fetching Canteens from Server...");
      var canteens = await ApiCanteen().getCanteens();

      // filter and sort
      canteens = canteens
          .where((element) => showCanteens.contains(element.enumName))
          .toList();
      canteens
          .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

      Canteen lothstr =
          canteens.firstWhere((element) => element.enumName == "MENSA_LOTHSTR");
      canteens.removeWhere((element) => element.enumName == "MENSA_LOTHSTR");
      canteens.insert(0, lothstr);

      storeCanteens(canteens);
      return canteens;
    }
    return canteens;
  }

  storeCanteens(List<Canteen> canteens, {bool clear = true}) async {
    final isar = await db;
    await isar.writeTxn(() async {
      if (clear) {
        await isar.canteens.clear();
      }
      await isar.canteens.putAll(canteens);
    });
  }

  clearCanteens() async {
    final isar = await db;
    await isar.writeTxn(() => isar.canteens.clear());
  }
}
