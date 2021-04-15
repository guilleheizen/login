import 'package:flutter/material.dart';
import 'package:login/src/share_prefs/preferencias_usuario.dart';
import 'package:login/src/widgets/menu_widget.dart';

class SettingPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  bool _colorSecundario;
  int _genero;

  TextEditingController _textController;
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    prefs.ultimaPagina = SettingPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textController = new TextEditingController(text: prefs.nombreUsuario);
  }

  _setSelectedRadio(int valor)  {
    prefs.genero = valor;
    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (prefs.colorSecundario) ? Colors.black : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(20.0),
        children: [
          Text('Settings', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),), 
          Divider(),
          SwitchListTile(
            value: _colorSecundario, 
            title: Text('Color Secundario'),
            onChanged: ( value ){
              setState((){
                _colorSecundario = value;
                prefs.colorSecundario = value;
              });
            }
          ),
          RadioListTile(
            value: 1, 
            title: Text('Masculino'),
            groupValue: _genero, 
            onChanged: _setSelectedRadio
          ),
          RadioListTile(
            value: 2, 
            title: Text('Femenino'),
            groupValue: _genero, 
            onChanged: _setSelectedRadio
          ),
          Divider(),
          Container(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Dueño del teléfono'
              ),
              onChanged: ( value ) {
                setState((){
                prefs.nombreUsuario = value;
              });
              },
            ),
          )
        ],
      )
      
    );
  }
}