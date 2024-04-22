

  import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {

    static initEnvironment()async{

    await dotenv.load(fileName: '.env');
  }

  static String apiUrl = dotenv.env['API_URL'] ?? 'no esta configurado el api url';
  static String apiKey = dotenv.env['API_KEY'] ?? 'no esta configurado el api url';


  }