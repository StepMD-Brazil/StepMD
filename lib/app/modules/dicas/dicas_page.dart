import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stepmd/app/modules/dicas/dicas_store.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: store.tipsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Observer(builder: (context) {
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
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 24,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'Veja High Yield Tips sobre cada questão para impulsionar seu aprendizado',
                      style: TextStyle(
                        color: Color(0xFF020E2B),
                        fontSize: 20,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Primeira Coluna - Disciplina
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Disciplina",
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 12, vertical: 8),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            borderSide: const BorderSide(
                                                color: Color(0xFFCBD5E1)),
                                          ),
                                        ),
                                        hint: const Text("Selecione"),
                                        items: const [
                                          DropdownMenuItem(
                                              value: "Matemática",
                                              child: Text("Matemática")),
                                          DropdownMenuItem(
                                              value: "História",
                                              child: Text("História")),
                                          DropdownMenuItem(
                                              value: "Geografia",
                                              child: Text("Geografia")),
                                        ],
                                        onChanged: (value) {
                                          print(
                                              "Disciplina selecionada: $value");
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                // Segunda Coluna - ID da questão
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "ID da questão",
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          hintText: "Digite o ID desejado",
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 12, vertical: 8),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            borderSide: const BorderSide(
                                                color: Color(0xFFCBD5E1)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                      width: MediaQuery.sizeOf(context).width * 0.75,
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Encontramos as seguintes dicas para este ID:',
                          style: TextStyle(
                            color: Color(0xFF020E2B),
                            fontSize: 17,
                            fontFamily: 'Work Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.75,
                    height: 110,
                    padding: const EdgeInsets.only(left: 16),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3FAEAEAE),
                          blurRadius: 5,
                          offset: Offset(10, 5),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          decoration: const BoxDecoration(
                            color: Color(0xFFF7F7F7),
                            border: Border(
                              left: BorderSide(
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFFDAE9EE),
                              ),
                              top: BorderSide(
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFFDAE9EE),
                              ),
                              right: BorderSide(
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFFDAE9EE),
                              ),
                              bottom: BorderSide(
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFFDAE9EE),
                              ),
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'ID da questão: 00159 | Decision-Making Capacity and personal skills ',
                                style: TextStyle(
                                  color: Color(0xFF041233),
                                  fontSize: 14,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w500,
                                  height: 0.10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 56,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(color: Colors.white),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: Text(
                                    'Lembrar desta anotação depois',
                                    style: TextStyle(
                                      color: Color(0xFF041233),
                                      fontSize: 14,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          });
        });
  }
}
