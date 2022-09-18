import 'package:flutter/material.dart';
import 'package:gastos/src/components/background.dart';
import 'package:gastos/src/pages/add/componentes.dart';
import '../Auth/services/firebase_crud.dart';

class IngresosPage extends StatefulWidget {
  const IngresosPage({super.key});

  @override
  State<IngresosPage> createState() => _IngresosPageState();
}

class _IngresosPageState extends State<IngresosPage> {
  final _concepto = TextEditingController();
  final _cantidad = TextEditingController();
  final _fecha = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //FORMULARIOS
    final nameField = Container(
      width: 300,
      decoration: BoxDecoration(
          color: Color.fromRGBO(16, 36, 84, 1),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
          style: TextStyle(color: Colors.white),
          controller: _concepto,
          autofocus: true,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'This field is required';
            }
          },
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Concepto",
              hintStyle: TextStyle(color: Colors.white),
              prefixIcon: Icon(
                Icons.text_decrease,
                color: Colors.white,
              ))),
    );
    final cantidadField = Container(
      width: 300,
      decoration: BoxDecoration(
          color: Color.fromRGBO(16, 36, 84, 1),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
          style: TextStyle(color: Colors.white),
          controller: _cantidad,
          keyboardType: TextInputType.number,
          autofocus: true,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'This field is required';
            }
          },
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Cantidad",
              hintStyle: TextStyle(color: Colors.white),
              prefixIcon: Icon(
                Icons.monetization_on,
                color: Colors.white,
              ))),
    );
    final fechaField = Container(
      width: 300,
      
      decoration: BoxDecoration(
          color: Color.fromRGBO(16, 36, 84, 1),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        keyboardType: TextInputType.datetime,
          style: TextStyle(color: Colors.white),
          controller: _fecha,
          autofocus: true,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'This field is required';
            }
          },
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "fecha",
              hintStyle: TextStyle(color: Colors.white),
              prefixIcon: Icon(
                Icons.date_range,
                color: Colors.white,
              ))),
    );

    final SaveButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color.fromRGBO(16, 36, 84, 1),
      child: MaterialButton(
        textColor: Colors.white,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            var usuario = await FirebaseCrud.crearConcepto(
                concepto: _concepto.text,
                fecha: _fecha.text,
                cantidad: _cantidad.text,
                masmenos: '',
                name: '',
                total: '');

            /*if (usuario?.code != 200) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(usuario!.message.toString()),
                    );
                  });
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(usuario!.message.toString()),
                    );
                  });
            }*/
          }

          _concepto.text = '';
          _fecha.text = '';
          _cantidad.text = '';
        },
        child: Text(
          "Save",
          style: TextStyle(color: Theme.of(context).primaryColorLight),
          textAlign: TextAlign.center,
        ),
      ),
    );
    // vista
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        const Background(),
        const EncabezadoIn(),
        ListView(
          children:[
            Column(
            children: [
              const SizedBox(height: 200),
              Center(
                  child: Text(
                'Movimientos',
                style:
                    TextStyle(fontSize: 25, color: Color.fromRGBO(16, 36, 84, 1)),
              )),
              const SizedBox(
                height: 20,
              ),
              
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      nameField,
                      const SizedBox(
                        height: 20,
                      ),
                      cantidadField,
                      const SizedBox(
                        height: 20,
                      ),
                      fechaField,
                      const SizedBox(
                        height: 20,
                      ),
                      SaveButon
                    ],
                  ))
            ],
          ),
          ] 
        )
      ]),
    ));
  }
}
