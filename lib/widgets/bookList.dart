import 'dart:js';
import 'package:flutter/material.dart';
import '../services.dart';

Widget booklist () {
  return FutureBuilder<Object>(
    future: getBooks(),
    builder: (context, snapshot) {
      if(snapshot.hasError) return Text('Error');
      switch (snapshot.connectionState) {
        case ConnectionState.none:
          return Text('Não conectado');
        case ConnectionState.waiting:
          return Text('Aguardando');
        case ConnectionState.active:
          return Text('Iniciou mas não terminou');
        case ConnectionState.done:
          return Text('Finalizado');
        default: 
          return Text('Books List');
      }
    }
  );
}