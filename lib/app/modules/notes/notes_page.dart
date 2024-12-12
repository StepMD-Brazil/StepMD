import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Veja suas principais anotações',
              style: TextStyle(
                color: Color(0xFF020E2B),
                fontSize: 20,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: 35,
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
          ),
          SizedBox(
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
              shadows: [
                BoxShadow(
                  color: Color(0x3FAEAEAE),
                  blurRadius: 4,
                  offset: Offset(0, 4),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
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
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFDAE9EE),
                      ),
                    ),
                  ),
                  child: Row(
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
                      const SizedBox(width: 8),
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              child: SvgPicture.asset(
                                color: Color(0xFF957B0B),
                                'assets/svg/icon-edit_square.svg',
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 24,
                              height: 24,
                              child: SvgPicture.asset(
                                color: Color(0xFFB22121),
                                'assets/svg/icon-delete.svg',
                              ),
                            ),
                          ],
                        ),
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
                  child: Row(
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
  }
}
