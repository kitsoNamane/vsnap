import 'package:vsnap/data/local/moor_database.dart';
import 'package:vsnap/models/mrz_document.dart' as model;

Future<bool> updateVisitor(model.Document doc, VisitorDao dao) async {
  try {
    var visitor = await dao.getLastSignedVisitor(doc.primaryId);
    if (visitor == null) return false;
    var updatedVisitor = visitor.copyWith(timeOut: DateTime.now());
    await dao.updateVisitor(updatedVisitor);
    return true;
  } catch (_) {
    return false;
  }
}
