import 'package:flutter/material.dart';

class ProgressDropdown extends StatefulWidget {
  final double progress; // Valor do progresso (entre 0.0 e 1.0)
  final List<Map<String, dynamic>> questions; // Lista de questões
  final int selectedQuestionIndex; // Índice da questão selecionada
  final Function(int) onQuestionSelected; // Callback ao selecionar uma questão

  const ProgressDropdown({
    required this.progress,
    required this.questions,
    required this.selectedQuestionIndex,
    required this.onQuestionSelected,
    Key? key,
  }) : super(key: key);

  @override
  _ProgressDropdownState createState() => _ProgressDropdownState();
}

class _ProgressDropdownState extends State<ProgressDropdown> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.15,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFDAE9EE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Barra de progresso com botão de dropdown
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Seu progresso',
                        style: TextStyle(
                          color: Color(0xFF51628A),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '(${(widget.progress * 100).truncate()}%)',
                        style: const TextStyle(
                          color: Color(0xFF51628A),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  LinearProgressIndicator(
                    value: widget.progress,
                    backgroundColor: Colors.grey[300],
                    color: Colors.blue,
                    minHeight: 10,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        _isExpanded
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: const Color(0xFF51628A),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Dropdown de questões
          if (_isExpanded)
            Container(
              color: Colors.white,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.questions.length,
                itemBuilder: (context, index) {
                  final question = widget.questions[index];
                  final isSelected = index == widget.selectedQuestionIndex;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.onQuestionSelected(index);
                        _isExpanded = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color.fromRGBO(34, 109, 159, 0.1)
                            : Colors.white,
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey[300]!,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            '${index + 1} - ${question['label']}',
                            style: TextStyle(
                              color: isSelected
                                  ? const Color.fromRGBO(34, 109, 159, 1)
                                  : const Color.fromRGBO(5, 19, 51, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            widget.questions[index]['answered'] == 1
                                ? Icons.check_circle_outlined
                                : widget.questions[index]['answered'] == -1
                                    ? Icons.close_rounded
                                    : Icons.info_outline,
                            color: widget.questions[index]['answered'] == 1
                                ? Colors.green
                                : widget.questions[index]['answered'] == -1
                                    ? Colors.red
                                    : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
