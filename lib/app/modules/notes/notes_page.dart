import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:stepmd/app/modules/notes/notes_store.dart';
import 'package:flutter/material.dart';
import 'package:stepmd/app/shared/constants.dart';

class NotesPage extends StatefulWidget {
  final String title;
  const NotesPage({Key? key, this.title = 'NotesPage'}) : super(key: key);
  @override
  NotesPageState createState() => NotesPageState();
}

class NotesPageState extends State<NotesPage> {
  final NotesStore store = Modular.get();
  final TextEditingController _searchController = TextEditingController();
  String? searchQuery;
  Map<int, bool> isEditing = {};
  Map<int, TextEditingController> textControllers = {};

  @override
  void initState() {
    super.initState();
    store.fetchNotes('').then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Notes',
          style: TextStyle(
            color: Color(0xFF957B0B),
            fontSize: 20,
            fontFamily: appFont,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            child: Text(
              'Veja suas principais anotações',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Buscar por ID da questão',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _performSearch,
                ),
              ),
              onSubmitted: (value) => _performSearch(),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: FutureBuilder(
              future: store.fetchNotes(searchQuery ?? ''),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Erro ao carregar notas'));
                } else {
                  return buildNotesList();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _performSearch() {
    setState(() {
      searchQuery = _searchController.text;
      store.fetchNotes(searchQuery ?? '');
    });
  }

  Widget buildNotesList() {
    return ListView(
      padding: const EdgeInsets.only(left: 50, top: 8, bottom: 8), // Margem à esquerda e espaçamento vertical
      children: store.notesList.map((note) {
        final formattedDate =
            DateFormat('dd/MM/yyyy HH:mm').format(note['dateCreated'].toDate());
        final index = store.notesList.indexOf(note);
        textControllers[index] = TextEditingController(text: note['text']);
        return Container(
          width: MediaQuery.of(context).size.width * 0.75, // Largura limitada a 75% da tela
          margin: const EdgeInsets.only(bottom: 8), // Espaçamento entre os itens
          height: 130,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), // Cantos arredondados
            color: Colors.white, // Cor de fundo do container
            boxShadow: [
              BoxShadow(
                color: Color(0x3FAEAEAE), // Cor da sombra
                blurRadius: 4, // Intensidade do desfoque
                offset: Offset(0, 4), // Sombra apenas para baixo
                spreadRadius: 0, // Evita que a sombra se espalhe para os lados
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Color(0xFFF7F7F7),
                  border: Border.all(color: Color(0xFFDAE9EE)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${note['questionId']} | $formattedDate',
                      style: TextStyle(
                        color: Color(0xFF041233),
                        fontSize: 14,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                            isEditing[index] == true
                                ? 'assets/svg/icon-save.svg'
                                : 'assets/svg/icon-edit_square.svg',
                            color: Color(0xFF957B0B),
                            width: 24,
                            height: 24,
                          ),
                          onPressed: () => _toggleEdit(index, note['noteId']),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: SvgPicture.asset(
                            'assets/svg/icon-delete.svg',
                            color: Color(0xFFB22121),
                            width: 24,
                            height: 24,
                          ),
                          onPressed: () =>
                              _showDeleteConfirmation(note['noteId']),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 56,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(color: Colors.white),
                child: isEditing[index] == true
                    ? TextField(
                        controller: textControllers[index],
                        decoration: InputDecoration(border: InputBorder.none),
                      )
                    : Text(
                        note['text'],
                        style: TextStyle(
                          color: Color(0xFF041233),
                          fontSize: 14,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  void _toggleEdit(int index, String noteId) {
    setState(() {
      if (isEditing[index] == true) {
        store.updateNote(noteId, textControllers[index]!.text);
      }
      isEditing[index] = !(isEditing[index] ?? false);
    });
  }

  void _showDeleteConfirmation(String noteId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Excluir nota', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        content: Text('Você tem certeza de que deseja excluir esta nota?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              store.deleteNote(noteId);
              Navigator.of(context).pop();
              setState(() {});
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.red[600], // Cor de fundo correta
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 16), // Espaçamento interno
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Bordas arredondadas
              ),
            ),
            child: const Text(
              'Excluir',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}