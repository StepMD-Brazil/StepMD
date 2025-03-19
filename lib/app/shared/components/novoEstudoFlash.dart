import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stepmd/app/modules/flashcards/flashcards_store.dart';
import 'package:stepmd/app/shared/components/flashcard.dart';
import 'package:stepmd/app/shared/components/test.dart';
import 'package:stepmd/app/shared/constants.dart';

class NovoEstudoFlash extends StatelessWidget {
  final FlashcardsStore flashStore = Modular.get();

  Map<String, bool> _checkedCategories = {};

  fetchFlashcardsByCategory(String categoryId) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('flashcards')
        .where('categoryId', isEqualTo: categoryId)
        .get();
    print(querySnapshot.docs.length);
    return querySnapshot.docs.length;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('questions').snapshots(),
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
                    'Flashcards',
                    style: TextStyle(
                      color: appColorPrimary,
                      fontSize: 20,
                      fontFamily: appFont,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: appColorPrimary),
                    onPressed: () => Modular.to.pop(),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: const Text(
                          'Quais disciplinas você deseja revisar?',
                          style: TextStyle(
                            color: appColorPrimary,
                            fontSize: 28,
                            fontFamily: appFont,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: const SizedBox(
                          height: 20,
                          child: Text(
                            'Estude com flashcards relacionados a disciplinas selecionadas ou selecione todas e pratique todo o conteúdo.',
                            style: TextStyle(
                              color: Color(0xFF51628A),
                              fontSize: 16,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('categories')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                  child: Text('Erro ao carregar categorias'));
                            }

                            if (!snapshot.hasData ||
                                snapshot.data!.docs.isEmpty) {
                              return Center(
                                  child: Text('Nenhuma categoria encontrada'));
                            }

                            final categories = snapshot.data!.docs;

                            return ListView.builder(
                              padding: const EdgeInsets.all(16.0),
                              itemCount: categories.length,
                              itemBuilder: (context, index) {
                                final category = categories[index];
                                final categoryId = category.id;
                                final categoryName = category['name'];
                                // final categoryIcon =
                                //     category['icon'] ?? Icons.category;
                                return Observer(
                                  builder: (_) => Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    margin: const EdgeInsets.only(bottom: 12.0),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 16.0),
                                    decoration: BoxDecoration(
                                      color: flashStore.isChecked(categoryId)
                                          ? Colors.blue.shade50
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(12.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 6.0,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        child: FutureBuilder(
                                          future: DefaultAssetBundle.of(context)
                                              .loadString(
                                                  'assets/svg/${categoryName ?? 'pathology'}.svg'),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                    ConnectionState.done &&
                                                snapshot.hasData) {
                                              return SvgPicture.string(
                                                snapshot.data!,
                                                colorFilter: ColorFilter.mode(
                                                    Colors.blue.shade800,
                                                    BlendMode.srcIn),
                                                width: 20,
                                                height: 20,
                                              );
                                            } else {
                                              return Icon(
                                                Icons.error,
                                                color: Colors.red,
                                                size: 20,
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            categoryName,
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey.shade800,
                                            ),
                                          ),
                                          FutureBuilder(
                                              future: fetchFlashcardsByCategory(
                                                  categoryName),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return Container();
                                                }
                                                return Text(
                                                  '${snapshot.data} cards',
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey.shade800,
                                                  ),
                                                );
                                              }),
                                        ],
                                      ),
                                      trailing: Checkbox(
                                        value:
                                            flashStore.isChecked(categoryName),
                                        onChanged: (_) {
                                          flashStore
                                              .toggleCategory(categoryName);
                                        },
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        activeColor: Colors.blue,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 85),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                  color: Color(0xFFDAE9EE),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Cancelar',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF957B0B),
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: () {
                              if (flashStore.checkedCategories.length != 0) {
                                flashStore.fetchcardsByIdsAsStream(
                                    flashStore.checkedCategories);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Flashcard()),
                                );
                              }
                            },
                            child: Container(
                              width: 114,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: Color(0xFF051333),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: const Text(
                                'Iniciar',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: appFont,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                        ],
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ));
          });
        });
  }
}
