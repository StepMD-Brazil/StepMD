import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stepmd/app/modules/dicas/dicas_store.dart';
import 'package:stepmd/app/shared/constants.dart';

class DicasPage extends StatefulWidget {
  final String title;
  const DicasPage({Key? key, this.title = 'DicasPage'}) : super(key: key);

  @override
  DicasPageState createState() => DicasPageState();
}

class DicasPageState extends State<DicasPage> {
  final DicasStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    store.fetchTips(); // Fetch tips when page initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'High Yield Tips',
          style: TextStyle(
            color: Color(0xFF957B0B),
            fontSize: 20,
            fontFamily: appFont,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Veja High Yield Tips sobre cada questão para impulsionar seu aprendizado',
              style: TextStyle(
                color: Color(0xFF020E2B),
                fontSize: 20,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                // Dropdown for Discipline
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Disciplina",
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(
                          value: "Matemática", child: Text("Matemática")),
                      DropdownMenuItem(
                          value: "História", child: Text("História")),
                      DropdownMenuItem(
                          value: "Geografia", child: Text("Geografia")),
                    ],
                    onChanged: (value) {
                      // Optional logic to filter by discipline
                    },
                  ),
                ),
                const SizedBox(width: 16),
                // TextField for Question ID
                Expanded(
                  child: TextField(
                    onChanged: (value) => store.setQuestionId(value),
                    decoration: InputDecoration(
                      labelText: "ID da questão",
                      hintText: "Ex.: #00155",
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Encontramos as seguintes dicas para este ID:',
              style: TextStyle(
                color: Color(0xFF020E2B),
                fontSize: 17,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 16),
            Observer(
              builder: (context) {
                final tips = store.tipsStream?.value;

                if (tips == null || tips.isEmpty) {
                  // Render message only for the tips list area
                  return const Center(
                    child: Text(
                      "Nenhuma dica encontrada.",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  );
                }

                // Render List of Tips
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: tips.length,
                  itemBuilder: (context, index) {
                    final tip = tips[index];
                    final id = tip['questionId'];
                    final discipline = tip['discipline'];
                    final description = tip['text'];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(
                          'ID da questão: $id | $discipline',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(description ?? ''),
                        contentPadding: const EdgeInsets.all(16),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
