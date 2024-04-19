


  import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {

    late Future<Isar> db;
    IsarService(){
      db = openDb();
    }


  Future<Isar> openDb() async{
    if( Isar.instanceNames.isEmpty ){
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([  ],
      inspector: true,
       directory: dir.path);
    }
  return Future.value(Isar.getInstance());
  }

  }