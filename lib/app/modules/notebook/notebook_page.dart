import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:stepmd/app/modules/notebook/notebook_store.dart';
import 'package:stepmd/app/modules/notebook/notebook_page_model.dart';

class NotebookPage extends StatefulWidget {
  const NotebookPage({Key? key}) : super(key: key);

  @override
  NotebookPageState createState() => NotebookPageState();
}

class NotebookPageState extends State<NotebookPage> {
  final NotebookStore store = Modular.get();
  final QuillController _controller = QuillController.basic();

  @override
  void initState() {
    super.initState();
    store.loadPages();
  }

  void _onPageSelected(NotebookPageModel page) {
    store.setSelectedPage(page);
    _controller.document = Document()..insert(0, page.content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Caderno')),
      body: Row(
        children: [
          // Lista de páginas
          Observer(builder: (_) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.2,
              color: Colors.grey[200],
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () => store.addPage("Nova Página", ""),
                    child: const Text("Adicionar Página"),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: store.pages.length,
                      itemBuilder: (context, index) {
                        final page = store.pages[index];
                        return ListTile(
                          title: Text(page.title),
                          selected: store.selectedPage?.id == page.id,
                          onTap: () => _onPageSelected(page),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }),

          // Editor de texto
          Expanded(
            child: Column(
              children: [
                QuillToolbar.simple(controller: _controller),
                Expanded(
                  child: QuillEditor.basic(
                    controller: _controller,
                    configurations: const QuillEditorConfigurations(
                        placeholder: 'Digite suas anotações'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (store.selectedPage != null) {
                      store.updatePage(
                          store.selectedPage!.id, _controller.document.toPlainText());
                    }
                  },
                  child: const Text("Salvar Página"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
