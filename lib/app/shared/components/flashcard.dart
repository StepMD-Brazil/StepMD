import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stepmd/app/shared/constants.dart';
import 'package:flash_card/flash_card.dart';

class Flashcard extends StatelessWidget {
  final List<FlashCard> flashCard = List.generate(
    5,
    (index) => FlashCard(
      key: Key(index.toString()),
      frontWidget: Container(
          height: 428,
          width: 912,
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: ShapeDecoration(
                  color: Color(0xFFE1F3FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9999),
                  ),
                ),
                child: Text(
                  'Verso',
                  style: TextStyle(
                    color: Color(0xFF4091C6),
                    fontSize: 14,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(
                width: double.infinity,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Blastomycosis',
                        style: TextStyle(
                          color: Color(0xFF51628A),
                          fontSize: 16,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text:
                            ' is characterized by progressive pulmonary infection.  Skin involvement i " . s uncommon but can manifest as papular or pustular lesions in exposed areas.  Histoplasmosis also most commonly causes pulmonary disease, though it may become disseminated in immunodeficient patients.',
                        style: TextStyle(
                          color: Color(0xFF51628A),
                          fontSize: 16,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 2),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(2, 2),
                          spreadRadius: 1,
                          blurRadius: 15)
                    ]),
                child: Center(
                    child: Icon(Icons.volume_down_sharp, color: Colors.blue)),
              ),
            ],
          )),
      backWidget: Container(
        width: 912,
        height: 450,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFDAE9EE)),
            borderRadius: BorderRadius.circular(8),
          ),
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: ShapeDecoration(
                color: Color(0xFFE1F3FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9999),
                ),
              ),
              child: Text(
                'Verso',
                style: TextStyle(
                  color: Color(0xFF4091C6),
                  fontSize: 14,
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(
              width: double.infinity,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Blastomycosis',
                      style: TextStyle(
                        color: Color(0xFF51628A),
                        fontSize: 16,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text:
                          ' is characterized by progressive pulmonary infection.  Skin involvement i " . s uncommon but can manifest as papular or pustular lesions in exposed areas.  Histoplasmosis also most commonly causes pulmonary disease, though it may become disseminated in immunodeficient patients.',
                      style: TextStyle(
                        color: Color(0xFF51628A),
                        fontSize: 16,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 200,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 360,
                    height: 200,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://firebasestorage.googleapis.com/v0/b/stepmd-ebcd9.appspot.com/o/questions%2FGkIVuh85OLC4tbtApnHR%2Fimages.jpeg?alt=media&token=909f90af-4c8e-4c46-abd6-abc0ebf9eb9f"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 40,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          child: SvgPicture.asset(
                            'assets/svg/icon-rotation.svg',
                            color: Color(0xFF4091C6),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'Virar carta',
                          style: TextStyle(
                            color: Color(0xFF4091C6),
                            fontSize: 14,
                            fontFamily: 'Work Sans',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      height: 428,
      width: 912,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Color(0xFF4091C6), // Define a cor do botão de voltar
        ),
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              left: BorderSide(color: Color(0xFFDAE9EE)),
              top: BorderSide(color: Color(0xFFDAE9EE)),
              right: BorderSide(color: Color(0xFFDAE9EE)),
              bottom: BorderSide(width: 1, color: Color(0xFFDAE9EE)),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFFDAE9EE)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(
                              'assets/svg/calculate.svg',
                              color: Color(0xFF4091C6),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const SizedBox(width: 8),
                          Container(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(
                              'assets/svg/icon-science.svg',
                              color: Color(0xFF4091C6),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const SizedBox(width: 8),
                          Container(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(
                              'assets/svg/menubook.svg',
                              color: Color(0xFF4091C6),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const SizedBox(width: 8),
                          Container(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(
                              'assets/svg/icon-addnotes.svg',
                              color: Color(0xFF4091C6),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const SizedBox(width: 8),
                          Container(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(
                              'assets/svg/icon-flashcard.svg',
                              color: Color(0xFF4091C6),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const SizedBox(width: 8),
                          Container(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(
                              'assets/svg/icon-star.svg',
                              color: Color(0xFF4091C6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      child: const Icon(Icons.alarm, color: Colors.black),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      '0:32',
                      style: TextStyle(
                        color: Color(0xFF51628A),
                        fontSize: 14,
                        fontFamily: appFont,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFDAE9EE)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                                width: 34,
                                height: 34,
                                decoration: const ShapeDecoration(
                                  shape: CircleBorder(
                                    side: BorderSide(
                                        width: 1, color: Colors.black),
                                  ),
                                ),
                                child: const Center(
                                  child: Icon(
                                    size: 16,
                                    Icons.pause,
                                    color: Colors.black,
                                  ),
                                )),
                            const SizedBox(width: 8),
                            const Text(
                              'Pausar teste',
                              style: TextStyle(
                                color: Color(0xFF51628A),
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 34,
                                height: 34,
                                decoration: const ShapeDecoration(
                                  shape: CircleBorder(
                                    side: BorderSide(
                                        width: 1, color: Color(0xFFA22727)),
                                  ),
                                ),
                                child: const Center(
                                  child: Icon(
                                    size: 16,
                                    Icons.stop,
                                    color: Colors.black,
                                  ),
                                )),
                            const SizedBox(width: 8),
                            const Text(
                              'Finalizar',
                              style: TextStyle(
                                color: Color(0xFFA22727),
                                fontSize: 14,
                                fontFamily: appFont,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 24,
                    height: 24,
                    child: const Icon(
                      Icons.settings,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.20,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          'Seu nível de confiança',
                          style: TextStyle(
                            color: Color(0xFF51628A),
                            fontSize: 12,
                            fontFamily: 'Work Sans',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Container(
                        width: 165,
                        height: 4,
                        child: FlutterLogo(),
                      ),
                    ],
                  ),
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
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Container(
                                  padding: const EdgeInsets.only(
                                    top: 8,
                                    left: 16,
                                    right: 8,
                                    bottom: 8,
                                  ),
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  child: InkWell(
                                    onTap: () {
                                      // dbStore.setSelect(index);
                                    },
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
                                                  '1',
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
                                        Container(
                                          width: 24,
                                          height: 24,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFFCFE6D8),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(9999),
                                            ),
                                          ),
                                          child:
                                              Icon(Icons.check_circle_outlined),
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
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.80,
                child: PageView.builder(
                  itemCount: flashCard.length,
                  itemBuilder: (context, index) {
                    return Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        flashCard[index],
                        const SizedBox(height: 24),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.80,
                          height: 96,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Qual seu nível de dificuldade neste card?',
                                style: TextStyle(
                                  color: Color(0xFF51628A),
                                  fontSize: 16,
                                  fontFamily: appFont,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 32, vertical: 8),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFC64040),
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 1,
                                                    color: Color(0xFFC64040)),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '1',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontFamily: 'Work Sans',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Muito difícil',
                                            style: TextStyle(
                                              color: Color(0xFF51628A),
                                              fontSize: 14,
                                              fontFamily: appFont,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 32, vertical: 8),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFFEA900),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '2',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontFamily: 'Work Sans',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Difícil',
                                            style: TextStyle(
                                              color: Color(0xFF51628A),
                                              fontSize: 14,
                                              fontFamily: appFont,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 32, vertical: 8),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFFDD700),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '3',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontFamily: 'Work Sans',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Normal',
                                            style: TextStyle(
                                              color: Color(0xFF51628A),
                                              fontSize: 14,
                                              fontFamily: appFont,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 32, vertical: 8),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF20A653),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '4',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontFamily: 'Work Sans',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Fácil',
                                            style: TextStyle(
                                              color: Color(0xFF51628A),
                                              fontSize: 14,
                                              fontFamily: appFont,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 32, vertical: 8),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF0021C9),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '5',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontFamily: 'Work Sans',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Muito fácil',
                                            style: TextStyle(
                                              color: Color(0xFF51628A),
                                              fontSize: 14,
                                              fontFamily: appFont,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ));
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
