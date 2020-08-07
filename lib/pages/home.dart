import 'package:flutter/material.dart';
import 'package:flutterapp/components/questionario.dart';
import 'package:flutterapp/components/resultado.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _perguntaSelecionada = 0;
  var _total = 0;
  final _perguntas = const [
    {
      'text': 'qual é seu nome?',
      'resposta': [
        {'text':'maria','nota': 10},
        {'text':'jose','nota': 3},
        {'text':'pedro','nota': 5},
        {'text':'fulano','nota': 1},
      ]
    },
    {
      'text': 'Qual é sua idade?',
      'resposta': [
        {'text':'um ano', 'nota': 5},
        {'text':'10 anos','nota': 10},
        {'text':'50 anos','nota': 1},
        {'text':'2 anos','nota': 3},
      ]
    },
    {
      'text': 'what are you doing?',
      'resposta': [
        {'text':'nothing', 'nota': 10},
        {'text':'drink whater','nota': 5},
        {'text':'drink coffe','nota': 3},
        {'text':'sleep','nota': 1},
      ]
    },
  ];

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perguntas'),
      ),
      body: temPerguntaSelecionada
          ? Questionario(
              perguntaSelecionada: _perguntaSelecionada,
              perguntas: _perguntas,
              responder: _responder,
            )
          : Resultado(),
    );
  }
}
