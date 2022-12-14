import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mercado_aberto/data/dataController.dart';
import 'package:mercado_aberto/model/cepModel.dart';

class textoCEP extends StatefulWidget {
  textoCEP({Key? key}) : super(key: key);

  @override
  _textoCEPState createState() => _textoCEPState();
}

class _textoCEPState extends State<textoCEP> {
  String textoCep = "";

  late cepModel? model;

  TextEditingController caixa_texto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => {
            setState(() => {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Digite seu CEP'),
                          content: TextField(
                            controller: caixa_texto,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xfff5d415))),
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Cancelar',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                model = await DataController().getCep();
                                print('Ok');
                                Navigator.pop(context);
                                caixa_texto.text;
                              },
                              child: const Text(
                                'Ok',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        );
                      })
                })
          }),
      child: Row(children: [
        const Icon(
          Icons.location_on,
          color: Colors.black,
        ),
        Text("Enviar para o CEP: ${caixa_texto.text}"),
      ]),
    );
  }

  getCeppp(String cep) async {
    model = await DataController().getCep(cep);
    print(model);
    setState(() {});
  }
}
