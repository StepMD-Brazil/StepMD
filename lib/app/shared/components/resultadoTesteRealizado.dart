import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:stepmd/app/modules/home/home_page.dart';

class ResultadosTestesRealizados extends StatelessWidget {
  final List<Map<String, dynamic>> mockTestes = [
    {
      'n': '01',
      'id': '001159',
      'disciplina': 'Biostatistics &\nEpidemiology',
      'topicos': 'Gastrointestinal &\nNutrition',
      'status': 'incorreta',
      'tempoGasto': '0:04 segs',
      'contRelacionado': 'Ver conteúdo',
    },
    {
      'n': '02',
      'id': '001159',
      'disciplina': 'Biostatistics &\nEpidemiology',
      'topicos': 'Gastrointestinal &\nNutrition',
      'status': 'correta',
      'tempoGasto': '0:04 segs',
      'contRelacionado': 'Ver conteúdo',
    },
    {
      'n': '03',
      'id': '001159',
      'disciplina': 'Biostatistics &\nEpidemiology',
      'topicos': 'Gastrointestinal &\nNutrition',
      'status': 'incorreta',
      'tempoGasto': '0:04 segs',
      'contRelacionado': 'Ver conteúdo',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xFF51628A),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage())),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.medical_services_outlined,
              color: Color(0xFF51628A),
              size: 24,
            ),
            SizedBox(width: 12),
            Text(
              'Acompanhe seus resultados',
              style: TextStyle(
                color: Color(0xFF51628A),
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
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCircularAcertosProgress(
                    'Sua taxa de acertos',
                    0.95,
                    '95%',
                    Colors.green,
                  ),
                  _buildCircularMediaProgress(
                    'Sua média de acertos',
                    0.72,
                    '72%',
                    Colors.green,
                  ),
                ],
              ),
              SizedBox(height: 32),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
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
                    dataRowHeight: 64,
                    headingRowHeight: 48,
                    horizontalMargin: 24,
                    columnSpacing: 24,
                    headingRowColor:
                        MaterialStateProperty.all(Color(0xFFF7FAFC)),
                    headingTextStyle: TextStyle(
                      color: Color(0xFF4A5568),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    columns: [
                      DataColumn(label: Text('N°')),
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('Disciplina')),
                      DataColumn(label: Text('Tópicos')),
                      DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Tempo gasto')),
                      DataColumn(label: Text('Cont. relacionado')),
                    ],
                    rows: mockTestes.map((teste) {
                      final isIncorreta = teste['status'] == 'incorreta';

                      return DataRow(
                        cells: [
                          DataCell(Text(
                            teste['n'],
                            style: TextStyle(
                              color: Color(0xFF2D3748),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                          DataCell(Text(
                            teste['id'],
                            style: TextStyle(
                              color: Color(0xFF2D3748),
                              fontSize: 14,
                            ),
                          )),
                          DataCell(Text(
                            teste['disciplina'],
                            style: TextStyle(
                              color: Color(0xFF2D3748),
                              fontSize: 14,
                            ),
                          )),
                          DataCell(Text(
                            teste['topicos'],
                            style: TextStyle(
                              color: Color(0xFF2D3748),
                              fontSize: 14,
                            ),
                          )),
                          DataCell(
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: isIncorreta
                                    ? Color(0xFFFFE4E4)
                                    : Color(0xFFE6FFE6),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    isIncorreta ? Icons.close : Icons.check,
                                    size: 16,
                                    color:
                                        isIncorreta ? Colors.red : Colors.green,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    isIncorreta ? 'Incorreta' : 'Correta',
                                    style: TextStyle(
                                      color: isIncorreta
                                          ? Colors.red
                                          : Colors.green,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          DataCell(Text(
                            teste['tempoGasto'],
                            style: TextStyle(
                              color: Color(0xFF2D3748),
                              fontSize: 14,
                            ),
                          )),
                          DataCell(
                            Text(
                              teste['contRelacionado'],
                              style: TextStyle(
                                color: Color(0xFF4299E1),
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                              ),
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
