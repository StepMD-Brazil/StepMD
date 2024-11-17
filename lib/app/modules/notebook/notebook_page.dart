import 'package:flutter_modular/flutter_modular.dart';
import 'package:stepmd/app/modules/notebook/notebook_store.dart';
import 'package:flutter/material.dart';
import 'package:stepmd/app/shared/constants.dart';
import 'package:flutter_quill/flutter_quill.dart';

class NotebookPage extends StatefulWidget {
  final String title;
  const NotebookPage({Key? key, this.title = 'NotebookPage'}) : super(key: key);
  @override
  NotebookPageState createState() => NotebookPageState();
}

class NotebookPageState extends State<NotebookPage> {
  final NotebookStore store = Modular.get();
  final QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Caderno',
          style: TextStyle(
            color: Color(0xFF2E3F69),
            fontSize: 20,
            fontFamily: appFont,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.15,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Color(0xFFDAE9EE),
                ),
                top: BorderSide(
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Color(0xFFDAE9EE),
                ),
                right: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Color(0xFFDAE9EE),
                ),
                bottom: BorderSide(
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Color(0xFFDAE9EE),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 56,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Container(
                    child: Text(
                      'Caderno',
                      style: TextStyle(
                        color: Color(0xFF51628A),
                        fontSize: 16,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.13,
                  height: 35,
                  padding: const EdgeInsets.only(left: 8),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: Color(0xFFCBD5E1),
                      ),
                      borderRadius: BorderRadius.circular(9999),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.search,
                          color: appColorDeafut,
                        ),
                        const SizedBox(width: 3),
                        SizedBox(
                          width: 100,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Pesquisar',
                              hintStyle: TextStyle(
                                color: appColorPrimary,
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w300,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 656,
                          padding:
                              const EdgeInsets.only(top: 8, left: 8, right: 8),
                          child: ListView.builder(
                            itemCount: 7,
                            itemBuilder: (context, index) {
                              return Container(
                                  padding: const EdgeInsets.only(
                                    top: 8,
                                    left: 16,
                                    right: 8,
                                    bottom: 8,
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 20,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                child: Text(
                                                  'Página $index',
                                                  style: TextStyle(
                                                    color: Color(0xFF51628A),
                                                    fontSize: 14,
                                                    fontFamily: appFont,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.65,
            child: Column(
              children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: QuillToolbar.simple(controller: _controller)),
                const SizedBox(height: 16),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                    ),
                    child: QuillEditor.basic(
                      controller: _controller,
                      configurations: QuillEditorConfigurations(
                        placeholder:
                            'Dê um título a esta página, digite aqui suas anotações',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
