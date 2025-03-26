import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:stepmd/app/shared/components/resultadoTesteRealizado.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stepmd/app/shared/components/test.dart';
import 'package:stepmd/app/shared/constants.dart';

class ListaTestes extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Map<String, String>> _fetchCategoryNames() async {
    final categoriesSnapshot = await _firestore.collection('categories').get();
    final Map<String, String> categoryNames = {};

    for (var doc in categoriesSnapshot.docs) {
      categoryNames[doc.id] = doc.data()['name'] ?? '';
    }

    return categoryNames;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.quiz_outlined,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(width: 15),
            Text(
              'Testes realizados',
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 20,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Acompanhe os resultados de seus últimos testes',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xFFE2E8F0)),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Pesquisar',
                        hintStyle: TextStyle(
                          color: Color(0xFF718096),
                          fontSize: 14,
                        ),
                        prefixIcon: Icon(Icons.search,
                            color: Color(0xFF718096), size: 20),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.83,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: FutureBuilder<Map<String, String>>(
                    future: _fetchCategoryNames(),
                    builder: (context, categorySnapshot) {
                      if (categorySnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (categorySnapshot.hasError) {
                        return Center(
                            child: Text('Erro ao carregar categorias'));
                      }

                      final categoryNames = categorySnapshot.data ?? {};

                      return StreamBuilder<QuerySnapshot>(
                        stream: _firestore
                            .collection('tests')
                            .where('userId', isEqualTo: _auth.currentUser?.uid)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }

                          if (snapshot.hasError) {
                            return Center(
                                child: Text('Erro ao carregar testes'));
                          }

                          if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return Center(
                                child: Text('Nenhum teste encontrado'));
                          }

                          final testes = snapshot.data!.docs
                              .map((doc) => doc.data() as Map<String, dynamic>)
                              .toList();

                          return DataTable(
                            dataRowHeight: 56,
                            headingRowHeight: 48,
                            horizontalMargin: 24,
                            columnSpacing: 32,
                            headingRowColor:
                                MaterialStateProperty.all(Color(0xFFF7FAFC)),
                            headingTextStyle: TextStyle(
                              color: Color(0xFF4A5568),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            dataTextStyle: TextStyle(
                              color: Color(0xFF2D3748),
                              fontSize: 14,
                            ),
                            columns: [
                              DataColumn(label: Text('Pontuação')),
                              DataColumn(label: Text('Nome do teste')),
                              DataColumn(label: Text('Tipo de teste')),
                              DataColumn(label: Text('Disciplinas')),
                              DataColumn(label: Text('Tópicos')),
                              DataColumn(label: Text('N° de questões')),
                              DataColumn(label: Text('Data')),
                              DataColumn(label: Text('Ações')),
                            ],
                            rows: testes.map((teste) {
                              // Calcula a pontuação baseada nas questões respondidas corretamente
                              final questions =
                                  (teste['questions'] as List?) ?? [];
                              final totalQuestions = questions.length;
                              final correctAnswers = questions
                                  .where((q) => q['status'] == 1)
                                  .length;
                              final wrongAnswers = questions
                                  .where((q) => q['status'] == -1)
                                  .length;
                              final unansweredQuestions = totalQuestions -
                                  (correctAnswers + wrongAnswers);
                              final pontuacao = totalQuestions > 0
                                  ? (correctAnswers / totalQuestions * 100)
                                      .round()
                                  : 0;

                              // Agrupa questões por categoria e busca os nomes
                              final categoryIds = questions
                                  .map((q) => q['categoryId'].toString())
                                  .toSet();
                              final categories = categoryIds
                                  .map((id) => categoryNames[id] ?? id)
                                  .join('\n');

                              // Agrupa tópicos
                              final topics = questions
                                  .map((q) => q['topics'].toString())
                                  .where((t) => t.isNotEmpty)
                                  .toSet()
                                  .join('\n');

                              // Converte o timestamp para DateTime
                              final dateCreated =
                                  (teste['dateCreated'] as Timestamp).toDate();

                              return DataRow(
                                onSelectChanged: (_) {
                                  // Prepara os dados para o detalhe
                                  final questions =
                                      (teste['questions'] as List?) ?? [];
                                  final totalQuestions = questions.length;
                                  final correctAnswers = questions
                                      .where((q) => q['status'] == 1)
                                      .length;
                                  final wrongAnswers = questions
                                      .where((q) => q['status'] == -1)
                                      .length;
                                  final unansweredQuestions = totalQuestions -
                                      (correctAnswers + wrongAnswers);

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ResultadosTestesRealizados(
                                        testData: {
                                          'totalQuestions': totalQuestions,
                                          'correctAnswers': correctAnswers,
                                          'wrongAnswers': wrongAnswers,
                                          'unansweredQuestions':
                                              unansweredQuestions,
                                          'questions': questions,
                                          'categoryNames': categoryNames,
                                          'testName':
                                              teste['name']?.toString() ?? '',
                                          'testDate': dateCreated,
                                          'testType':
                                              teste['type']?.toString() ?? '',
                                        },
                                      ),
                                    ),
                                  );
                                },
                                cells: [
                                  DataCell(
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (pontuacao >= 70)
                                          Icon(Icons.star,
                                              color: Color(0xFF4299E1),
                                              size: 16),
                                        if (pontuacao >= 70) SizedBox(width: 4),
                                        Text(
                                          '$pontuacao%',
                                          style: TextStyle(
                                            color: Color(0xFF2D3748),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      teste['name']?.toString() ?? '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      teste['type']?.toString() ?? '',
                                      style:
                                          TextStyle(color: Color(0xFF718096)),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      categories,
                                      style:
                                          TextStyle(color: Color(0xFF718096)),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      topics.isEmpty ? '-' : topics,
                                      style:
                                          TextStyle(color: Color(0xFF718096)),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      totalQuestions.toString(),
                                      style: TextStyle(
                                        color: Color(0xFF2D3748),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      '${dateCreated.day}/${dateCreated.month}/${dateCreated.year}',
                                      style:
                                          TextStyle(color: Color(0xFF718096)),
                                    ),
                                  ),
                                  DataCell(
                                    PopupMenuButton<String>(
                                      icon: Icon(Icons.more_vert,
                                          color: Color(0xFF51628A)),
                                      onSelected: (String value) async {
                                        switch (value) {
                                          case 'revisar':
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Test(
                                                  testId: teste['testId'],
                                                  mode: 'review',
                                                ),
                                              ),
                                            );
                                            break;
                                          case 'refazer':
                                            // Criar novo teste com as mesmas questões
                                            final newTest = {
                                              'name':
                                                  '${teste['name']} (Refeito)',
                                              'mode': teste['mode'],
                                              'userId': FirebaseAuth
                                                  .instance.currentUser!.uid,
                                              'dateCreated': DateTime.now(),
                                              'type': teste['type'],
                                              'questions': teste['questions']
                                                  .map((q) => {
                                                        'questionId':
                                                            q['questionId'],
                                                        'categoryId':
                                                            q['categoryId'],
                                                        'status': 0,
                                                        'indexOption': 0,
                                                      })
                                                  .toList(),
                                            };

                                            final docRef =
                                                await FirebaseFirestore.instance
                                                    .collection('tests')
                                                    .add(newTest);

                                            await docRef
                                                .update({'testId': docRef.id});

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Test(
                                                  testId: docRef.id,
                                                  mode: 'redo',
                                                ),
                                              ),
                                            );
                                            break;
                                          case 'tutor':
                                            // Criar novo teste em modo tutor
                                            final tutorTest = {
                                              'name':
                                                  '${teste['name']} (Tutor)',
                                              'mode': 'tutor',
                                              'userId': FirebaseAuth
                                                  .instance.currentUser!.uid,
                                              'dateCreated': DateTime.now(),
                                              'type': teste['type'],
                                              'questions': teste['questions']
                                                  .map((q) => {
                                                        'questionId':
                                                            q['questionId'],
                                                        'categoryId':
                                                            q['categoryId'],
                                                        'status': 0,
                                                        'indexOption': 0,
                                                      })
                                                  .toList(),
                                            };

                                            final tutorRef =
                                                await FirebaseFirestore.instance
                                                    .collection('tests')
                                                    .add(tutorTest);

                                            await tutorRef.update(
                                                {'testId': tutorRef.id});

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Test(
                                                  testId: tutorRef.id,
                                                  mode: 'tutor',
                                                ),
                                              ),
                                            );
                                            break;
                                          case 'cronometrado':
                                            // Criar novo teste em modo cronometrado
                                            final timedTest = {
                                              'name':
                                                  '${teste['name']} (Cronometrado)',
                                              'mode': 'cronometrado',
                                              'userId': FirebaseAuth
                                                  .instance.currentUser!.uid,
                                              'dateCreated': DateTime.now(),
                                              'type': teste['type'],
                                              'questions': teste['questions']
                                                  .map((q) => {
                                                        'questionId':
                                                            q['questionId'],
                                                        'categoryId':
                                                            q['categoryId'],
                                                        'status': 0,
                                                        'indexOption': 0,
                                                      })
                                                  .toList(),
                                            };

                                            final timedRef =
                                                await FirebaseFirestore.instance
                                                    .collection('tests')
                                                    .add(timedTest);

                                            await timedRef.update(
                                                {'testId': timedRef.id});

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Test(
                                                  testId: timedRef.id,
                                                  mode: 'cronometrado',
                                                ),
                                              ),
                                            );
                                            break;
                                          case 'renomear':
                                            // Modal para renomear
                                            final newName =
                                                await showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) {
                                                String name =
                                                    teste['name'] ?? '';
                                                return AlertDialog(
                                                  title: Text('Renomear teste'),
                                                  content: TextField(
                                                    controller:
                                                        TextEditingController(
                                                            text: name),
                                                    onChanged: (value) =>
                                                        name = value,
                                                    decoration: InputDecoration(
                                                      labelText: 'Novo nome',
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context),
                                                      child: Text('Cancelar'),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context, name),
                                                      child: Text('Salvar'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            if (newName != null &&
                                                newName.isNotEmpty) {
                                              // Atualizar nome no Firestore
                                              await FirebaseFirestore.instance
                                                  .collection('tests')
                                                  .doc(teste['testId'])
                                                  .update({'name': newName});
                                            }
                                            break;
                                          case 'excluir':
                                            // Modal de confirmação para excluir
                                            final confirm =
                                                await showDialog<bool>(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text('Excluir teste'),
                                                  content: Text(
                                                      'Tem certeza que deseja excluir este teste?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context, false),
                                                      child: Text('Cancelar'),
                                                    ),
                                                    ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Colors.red,
                                                      ),
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context, true),
                                                      child: Text('Excluir'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            if (confirm == true) {
                                              // Excluir teste do Firestore
                                              await FirebaseFirestore.instance
                                                  .collection('tests')
                                                  .doc(teste['testId'])
                                                  .delete();
                                            }
                                            break;
                                          case 'resultados':
                                            // Navegar para a tela de resultados
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ResultadosTestesRealizados(
                                                  testData: {
                                                    'totalQuestions':
                                                        totalQuestions,
                                                    'correctAnswers':
                                                        correctAnswers,
                                                    'wrongAnswers':
                                                        wrongAnswers,
                                                    'unansweredQuestions':
                                                        unansweredQuestions,
                                                    'questions': questions,
                                                    'categoryNames':
                                                        categoryNames,
                                                    'testName': teste['name']
                                                            ?.toString() ??
                                                        '',
                                                    'testDate': dateCreated,
                                                    'testType': teste['type']
                                                            ?.toString() ??
                                                        '',
                                                  },
                                                ),
                                              ),
                                            );
                                            break;
                                        }
                                      },
                                      itemBuilder: (BuildContext context) => [
                                        PopupMenuItem(
                                          value: 'revisar',
                                          child: Row(
                                            children: [
                                              Icon(Icons.play_arrow,
                                                  color: Color(0xFF51628A)),
                                              SizedBox(width: 8),
                                              Text('Revisar teste'),
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem(
                                          value: 'refazer',
                                          child: Row(
                                            children: [
                                              Icon(Icons.refresh,
                                                  color: Color(0xFF51628A)),
                                              SizedBox(width: 8),
                                              Text('Refazer teste'),
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem(
                                          value: 'tutor',
                                          child: Row(
                                            children: [
                                              Icon(Icons.person,
                                                  color: Color(0xFF51628A)),
                                              SizedBox(width: 8),
                                              Text('Modo Tutor'),
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem(
                                          value: 'cronometrado',
                                          child: Row(
                                            children: [
                                              Icon(Icons.timer,
                                                  color: Color(0xFF51628A)),
                                              SizedBox(width: 8),
                                              Text('Modo Cronometrado'),
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem(
                                          value: 'renomear',
                                          child: Row(
                                            children: [
                                              Icon(Icons.edit,
                                                  color: Color(0xFF51628A)),
                                              SizedBox(width: 8),
                                              Text('Renomear teste'),
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem(
                                          value: 'excluir',
                                          child: Row(
                                            children: [
                                              Icon(Icons.delete_outline,
                                                  color: Colors.red),
                                              SizedBox(width: 8),
                                              Text('Excluir teste',
                                                  style: TextStyle(
                                                      color: Colors.red)),
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem(
                                          value: 'resultados',
                                          child: Row(
                                            children: [
                                              Icon(Icons.bar_chart,
                                                  color: Color(0xFF51628A)),
                                              SizedBox(width: 8),
                                              Text('Resultados'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircularAcertosProgress(
    String label,
    double percent,
    String centerText,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 24),
          CircularPercentIndicator(
            radius: 80.0,
            lineWidth: 12.0,
            percent: percent,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  centerText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'De acertos',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            progressColor: color,
            backgroundColor: Colors.red.withOpacity(0.1),
            circularStrokeCap: CircularStrokeCap.round,
          ),
          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLegendItem(
                  'Questões não respondidas', Colors.grey.withOpacity(0.2)),
              SizedBox(height: 8),
              _buildLegendItem('Questões erradas', Colors.red.withOpacity(0.1)),
              SizedBox(height: 8),
              _buildLegendItem('Questões corretas', Colors.green),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircularMediaProgress(
    String label,
    double percent,
    String centerText,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 24),
          Stack(
            alignment: Alignment.center,
            children: [
              CircularPercentIndicator(
                radius: 80.0,
                lineWidth: 12.0,
                percent: 0.72,
                progressColor: Colors.grey[300],
                backgroundColor: Colors.grey.withOpacity(0.1),
                circularStrokeCap: CircularStrokeCap.round,
              ),
              CircularPercentIndicator(
                radius: 80.0,
                lineWidth: 12.0,
                percent: percent,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      centerText,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'Sua pontuação',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                progressColor: color,
                backgroundColor: Colors.transparent,
                circularStrokeCap: CircularStrokeCap.round,
              ),
              Positioned(
                top: -15,
                right: 0,
                child: Text(
                  '72% (média)',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(width: 8),
              Text(
                'Sua pontuação neste teste',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 16),
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(width: 8),
              Text(
                'Sua média geral',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    '38/40',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Questões respondidas',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.menu, color: Colors.grey[400], size: 16),
                ],
              ),
              Row(
                children: [
                  Text(
                    '32',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Questões corretas',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.check_circle_outline,
                      color: Colors.grey[400], size: 16),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
