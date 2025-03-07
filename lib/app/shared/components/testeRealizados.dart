import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestesRealizados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados dos Testes'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('testes')
            .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar dados'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('Nenhum teste encontrado'));
          } else {
            final documentos = snapshot.data!.docs;

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Pontuação')),
                  DataColumn(label: Text('Nome do Teste')),
                  DataColumn(label: Text('Tipo de Teste')),
                  DataColumn(label: Text('Disciplinas')),
                  DataColumn(label: Text('Tópicos')),
                  DataColumn(label: Text('Nº de Questões')),
                  DataColumn(label: Text('Data')),
                  DataColumn(label: Text('Ações')),
                ],
                rows: documentos.map((doc) {
                  final data = doc.data() as Map<String, dynamic>;
                  return DataRow(cells: [
                    DataCell(Text('${data['pontuacao']}%')),
                    DataCell(Text(data['nomeTeste'])),
                    DataCell(Text(data['tipoTeste'])),
                    DataCell(Text(data['disciplinas'])),
                    DataCell(Text(data['topicos'])),
                    DataCell(Text(data['numQuestoes'].toString())),
                    DataCell(Text(data['data'])),
                    DataCell(Icon(Icons.more_vert)),
                  ]);
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
