import 'package:flutter/material.dart';
import 'package:projeto1/questao.dart';
import 'package:projeto1/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quantoResponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quantoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
            as List<Map<String, Object>>
        : [];

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        //peguei a lista de stringa usei map pra converter o map para
        //widget e converti para uma lista e demonstrou no column
        //linguagem declarativa
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'].toString(),
            () => quantoResponder(
              int.parse(
                resp['pontuacao'].toString(),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}
