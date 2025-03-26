import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:stepmd/app/modules/home/home_page.dart';

class ResultadosTestesRealizados extends StatelessWidget {
  final Map<String, dynamic> testData;

  const ResultadosTestesRealizados({
    Key? key,
    required this.testData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalQuestions = testData['totalQuestions'] as int;
    final correctAnswers = testData['correctAnswers'] as int;
    final wrongAnswers = testData['wrongAnswers'] as int;
    final unansweredQuestions = testData['unansweredQuestions'] as int;
    final questions = testData['questions'] as List;
    final categoryNames = testData['categoryNames'] as Map<String, String>;
    final testName = testData['testName'] as String;
    final testDate = testData['testDate'] as DateTime;
    final testType = testData['testType'] as String;

    // Calcula as porcentagens para os gráficos
    final acertosPercent =
        totalQuestions > 0 ? correctAnswers / totalQuestions : 0.0;
    final mediaPercent =
        0.72; // Valor fixo para exemplo, pode ser calculado baseado em histórico

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          ),
        ),
        title: Row(
          children: [
            Icon(Icons.assessment_outlined,
                color: Theme.of(context).primaryColor),
            SizedBox(width: 8),
            Text(
              'Acompanhe seus resultados',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildCircularAcertosProgress(
                    'Sua taxa de acertos',
                    acertosPercent,
                    '${(acertosPercent * 100).round()}%',
                    Colors.green,
                    correctAnswers,
                    wrongAnswers,
                    unansweredQuestions,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _buildCircularMediaProgress(
                    'Sua média de acertos',
                    acertosPercent,
                    '${(acertosPercent * 100).round()}%',
                    Colors.green,
                    correctAnswers,
                    totalQuestions,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            _buildQuestionsTable(questions, categoryNames),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularAcertosProgress(
    String label,
    double percent,
    String centerText,
    Color color,
    int correctAnswers,
    int wrongAnswers,
    int unansweredQuestions,
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
                'Questões não respondidas ($unansweredQuestions)',
                Colors.grey.withOpacity(0.2),
              ),
              SizedBox(height: 8),
              _buildLegendItem(
                'Questões erradas ($wrongAnswers)',
                Colors.red.withOpacity(0.1),
              ),
              SizedBox(height: 8),
              _buildLegendItem(
                'Questões corretas ($correctAnswers)',
                Colors.green,
              ),
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
    int answeredQuestions,
    int totalQuestions,
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
                    '$answeredQuestions/$totalQuestions',
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
                    '$answeredQuestions',
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

  Widget _buildQuestionsTable(
      List questions, Map<String, String> categoryNames) {
    return Container(
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
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('N°')),
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Disciplina')),
            DataColumn(label: Text('Tópicos')),
            DataColumn(label: Text('Status')),
            DataColumn(label: Text('Tempo gasto')),
            DataColumn(label: Text('Cont. relacionado')),
          ],
          rows: List.generate(
            questions.length,
            (index) {
              final question = questions[index];
              final categoryId = question['categoryId'] as String;
              final categoryName = categoryNames[categoryId] ?? categoryId;
              final status = question['status'] as int;

              return DataRow(
                cells: [
                  DataCell(Text('${index + 1}')),
                  DataCell(Text(question['questionId'] as String)),
                  DataCell(Text(categoryName)),
                  DataCell(Text(question['topics']?.toString() ?? '-')),
                  DataCell(
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          status == 1
                              ? Icons.check_circle
                              : status == -1
                                  ? Icons.cancel
                                  : Icons.help_outline,
                          color: status == 1
                              ? Colors.green
                              : status == -1
                                  ? Colors.red
                                  : Colors.grey,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          status == 1
                              ? 'Correta'
                              : status == -1
                                  ? 'Incorreta'
                                  : 'Não respondida',
                        ),
                      ],
                    ),
                  ),
                  DataCell(Text('0:04 segs')), // Tempo fixo para exemplo
                  DataCell(
                    TextButton(
                      onPressed: () {
                        // Implementar ação para ver conteúdo
                      },
                      child: Text(
                        'Ver conteúdo',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
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
