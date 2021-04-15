import 'package:flutter/material.dart';
import 'package:login/src/pages/home_page.dart';
import 'package:login/src/pages/settings_page.dart';
import 'package:login/src/share_prefs/preferencias_usuario.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routeName : (BuildContext context) => HomePage(),
        SettingPage.routeName : (BuildContext context) => SettingPage(),
      },
    );
  }
}