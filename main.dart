import 'package:atv1/incio.dart';
import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() {
  runApp(AulaComponentes());
}

class AulaComponentes extends StatefulWidget{
  @override
  State<AulaComponentes> createState() => _AulaComponentesState();
}

class _AulaComponentesState extends State<AulaComponentes> {

  var perguntaAtual = 0;
  var cor = Colors.white;

  final List<Map<String, Object>> perguntas = [
    {
      "texto" : "Qual a sua cor favorita?",
      "respostas" : ["Amarelo","Preto", "Branco", "Azul", "Vermelho"]
    },
    {
      "texto" : "Qual é seu animal favorito?",
      "respostas" : ["Cachorro", "Gato", "Tartaruga", "Periquito"]
    },
    {
      "texto" : "Qual sua linguagem favorita?",
      "respostas" : ["Python", "Java", "JavaScript"]
    },

  ];
  
  void acao(){
    setState(() {
      perguntaAtual++;
    });
    print(perguntaAtual);
  }

  Widget build(BuildContext context){

    List<Widget> respostas = [];
    for (var resposta in perguntas[perguntaAtual].cast()["respostas"]) {
      print(resposta);
      respostas.add(
          Resposta(resposta, acao)
        );
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Questao(perguntas[perguntaAtual]["texto"].toString()),
        ),
        body: Column(
          children: [
            ...respostas, TextButton(
                  onPressed: () {
                    
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Home()));
                  }, child: Text('redirecionar')),
          ],
        ),
      )
    );
  }
}
