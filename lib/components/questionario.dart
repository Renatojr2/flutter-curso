import 'package:flutter/material.dart';
import 'package:flutterapp/components/resposta.dart';
import './questao.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function() responder;

  Questionario({
    @required this.perguntaSelecionada,
    @required this.perguntas,
    @required this.responder,
  });
  
    bool get temPerguntaSelecionada {
        return perguntaSelecionada < perguntas.length;
      }



  @override
  Widget build(BuildContext context) {
     List<Map<String, Object>> respostas = temPerguntaSelecionada ?
      perguntas[perguntaSelecionada]['resposta']
      : null;

    return Container(
      child: temPerguntaSelecionada ? Column(
        children: <Widget>[
          Questao(perguntas[perguntaSelecionada]['text']),
          ...respostas.map((res) => Resposta(res['text'], responder)).toList(),
        ],
      ): null,
    );
  }
}
