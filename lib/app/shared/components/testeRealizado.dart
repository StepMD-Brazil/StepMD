import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:stepmd/app/shared/components/resultadoTesteRealizado.dart';

class ListaTestes extends StatelessWidget {
  final List<Map<String, dynamic>> mockTestes = [
    {
      'pontuacao': 75,
      'nomeTeste': 'teste 1',
      'tipoTeste': 'StepMD\nSimulado',
      'disciplinas': 'Behavioral\nScience',
      'topicos': 'Public\nHealth',
      'numQuestoes': 12,
      'data': '01/12/2024',
      'showStar': true,
    },
    {
      'pontuacao': 26,
      'nomeTeste': 'teste 2',
      'tipoTeste': 'Estilo NBME',
      'disciplinas': 'Behavioral\nScience',
      'topicos': 'Public\nHealth',
      'numQuestoes': 30,
      'data': '01/12/2024',
      'showStar': true,
    },
    {
      'pontuacao': 33,
      'nomeTeste': 'teste 3',
      'tipoTeste': 'StepMD\nSimulado',
      'disciplinas': 'Behavioral\nScience',
      'topicos': 'Public\nHealth',
      'numQuestoes': 24,
      'data': '01/12/2024',
      'showStar': false,
    },
    {
      'pontuacao': 75,
      'nomeTeste': 'teste 4',
      'tipoTeste': 'StepMD\nSimulado',
      'disciplinas': 'Behavioral\nScience',
      'topicos': 'Public\nHealth',
      'numQuestoes': 56,
      'data': '01/12/2024',
      'showStar': false,
    },
    {
      'pontuacao': 26,
      'nomeTeste': 'teste 5',
      'tipoTeste': 'Personalizado',
      'disciplinas': 'Behavioral\nScience',
      'topicos': 'Public\nHealth',
      'numQuestoes': 12,
      'data': '01/12/2024',
      'showStar': false,
    },
    {
      'pontuacao': 75,
      'nomeTeste': 'teste 6',
      'tipoTeste': 'Estilo NBME',
      'disciplinas': 'Behavioral\nScience',
      'topicos': 'Public\nHealth',
      'numQuestoes': 15,
      'data': '01/12/2024',
      'showStar': false,
    },
  ];

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
                  child: DataTable(
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
                    rows: mockTestes.map((teste) {
                      return DataRow(
                        onSelectChanged: (_) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultadosTestesRealizados()),
                          );
                        },
                        cells: [
                          DataCell(
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (teste['showStar'])
                                  Icon(Icons.star,
                                      color: Color(0xFF4299E1), size: 16),
                                if (teste['showStar']) SizedBox(width: 4),
                                Text(
                                  '${teste['pontuacao']}%',
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
                              teste['nomeTeste'],
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          DataCell(
                            Text(
                              teste['tipoTeste'],
                              style: TextStyle(color: Color(0xFF718096)),
                            ),
                          ),
                          DataCell(
                            Text(
                              teste['disciplinas'],
                              style: TextStyle(color: Color(0xFF718096)),
                            ),
                          ),
                          DataCell(
                            Text(
                              teste['topicos'],
                              style: TextStyle(color: Color(0xFF718096)),
                            ),
                          ),
                          DataCell(
                            Text(
                              '${teste['numQuestoes']}',
                              style: TextStyle(
                                color: Color(0xFF2D3748),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              teste['data'],
                              style: TextStyle(color: Color(0xFF718096)),
                            ),
                          ),
                          DataCell(
                            IconButton(
                              icon: Icon(Icons.more_horiz,
                                  color: Color(0xFF718096)),
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              splashRadius: 24,
                            ),
                          ),
                        ],
                      );
                    }).toList(),
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
