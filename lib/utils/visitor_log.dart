import 'package:vsnap/data/local/moor_database.dart';
import 'package:vsnap/models/mrz_document.dart' as model;

var dao = AppDatabase().visitorDao;

Future<bool> updateVisitor(model.Document doc) async {
  try {
    var visitor = await dao.getLastSignedVisitor(doc.primaryId);
    var updatedVisitor = visitor.copyWith(timeOut: DateTime.now());
    await dao.updateVisitor(updatedVisitor);
    return true;
  } catch (_) {
    return false;
  }
}

Future<List<Visitor>> getVisitors() async {
  var visitors = await dao.getAllVisitors();
}

Future<String> createExcel(String filename) {

}
