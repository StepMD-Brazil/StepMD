import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stepmd/app/modules/home/home_store.dart';
import 'package:stepmd/app/modules/initialPage/initialPage_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stepmd/app/shared/constants.dart';

class InitialPagePage extends StatefulWidget {
  final String title;
  const InitialPagePage({Key? key, this.title = 'InitialPagePage'})
      : super(key: key);
  @override
  InitialPagePageState createState() => InitialPagePageState();
}

class InitialPagePageState extends State<InitialPagePage> {
  final InitialPageStore store = Modular.get();
  final HomeStore homeStore = Modular.get();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Boas vindas',
                style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 20,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 16),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Container(
              //       padding:
              //           const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              //       clipBehavior: Clip.antiAlias,
              //       decoration: ShapeDecoration(
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(6)),
              //       ),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //           SvgPicture.asset(
              //             color: Color(0xFF957B0B),
              //             'assets/svg/dashboard.svg',
              //           ),
              //           const SizedBox(width: 4),
              //           const Text(
              //             'Dashboard',
              //             style: TextStyle(
              //               color: Color(0xFF957B0B),
              //               fontSize: 14,
              //               fontFamily: 'Work Sans',
              //               fontWeight: FontWeight.w500,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //     const SizedBox(width: 8),
              //     Container(
              //       padding:
              //           const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              //       clipBehavior: Clip.antiAlias,
              //       decoration: ShapeDecoration(
              //         color: const Color(0xFFE1F3FF),
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(6)),
              //       ),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //           SvgPicture.asset(
              //             color: Color(0xFF957B0B),
              //             'assets/svg/autobook.svg',
              //           ),
              //           const SizedBox(width: 4),
              //           const Text(
              //             'Disciplinas',
              //             style: TextStyle(
              //               color: Color(0xFF957B0B),
              //               fontSize: 14,
              //               fontFamily: 'Work Sans',
              //               fontWeight: FontWeight.w500,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/img/home.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'O que é a StepMD Brazil?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontSize: 40,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'A StepMD Brazil é uma plataforma online criada para ajudar estudantes de medicina e médicos formados a se prepararem para o ',
                            style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: 18,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: 'USMLE Step 1,',
                            style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: 18,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text:
                                ' uma das etapas mais importantes para quem deseja exercer a medicina nos Estados Unidos.\n\nCom um banco de questões atualizado e alinhado ao formato do exame, flashcards interativos e recursos personalizados, a StepMD Brazil oferece uma experiência de estudo completa e eficaz. Nossa missão é',
                            style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: 18,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: ' simplificar o aprendizado,',
                            style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: 18,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text:
                                ' ajudando você a dominar os conceitos básicos de ciências médicas e a alcançar seus objetivos profissionais com confiança.',
                            style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: 18,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(color: Color(0xFFEEF6FF)),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: Text(
                              'Como funciona a NBME e os steps',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 40,
                                fontFamily: 'Work Sans',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'A NBME ',
                                    style: TextStyle(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 18,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '(National Board of Medical Examiners)',
                                    style: TextStyle(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 18,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        ' é a organização responsável pelo USMLE ',
                                    style: TextStyle(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 18,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '(United States Medical Licensing Examination), ',
                                    style: TextStyle(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 18,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'O exame que avalia o conhecimento e as habilidades de médicos que desejam exercer a medicina nos Estados Unidos. O USMLE é dividido em',
                                    style: TextStyle(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 18,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' três etapas,',
                                    style: TextStyle(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 18,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' conhecidas como "Steps":',
                                    style: TextStyle(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 18,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.38,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.4,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 32),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1, color: Color(0xFFDAE9EE)),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                shadows: const [
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
                                    width: double.infinity,
                                    height: 204,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            'Step 1:',
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context).hintColor,
                                              fontSize: 28,
                                              fontFamily: 'Work Sans',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            'Avalia conhecimentos básicos de ciências médicas, como anatomia, fisiologia, bioquímica e farmacologia. É uma etapa crucial para testar a compreensão dos fundamentos que sustentam a prática médica.',
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context).hintColor,
                                              fontSize: 16,
                                              fontFamily: 'Mulish',
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.38,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 32),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1, color: Color(0xFFDAE9EE)),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                shadows: const [
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
                                  SizedBox(
                                    width: double.infinity,
                                    height: 204,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            'Step 2:',
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context).hintColor,
                                              fontSize: 28,
                                              fontFamily: 'Work Sans',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            'CK (Clinical Knowledge): Foca no conhecimento clínico e na aplicação prática, avaliando a capacidade de diagnosticar e tratar pacientes.',
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context).hintColor,
                                              fontSize: 16,
                                              fontFamily: 'Mulish',
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.7,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.3,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 32),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1, color: Color(0xFFDAE9EE)),
                                  borderRadius: BorderRadius.circular(16),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 32,
                                              height: 32,
                                              child: Icon(
                                                Icons.quiz_outlined,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              'StepMD Qbank',
                                              style: TextStyle(
                                                color:
                                                    Theme.of(context).hintColor,
                                                fontSize: 28,
                                                fontFamily: 'Work Sans',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          'Acesse o e pratique simulados da NBME com diversas questões criadas e revisadas por profissionais.',
                                          style: TextStyle(
                                            color: Theme.of(context).hintColor,
                                            fontSize: 16,
                                            fontFamily: 'Mulish',
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        homeStore.selectedIndex = 1;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1,
                                              color: Color(0xFF1584EB)),
                                          borderRadius:
                                              BorderRadius.circular(6),
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
                                            'Acessar',
                                            style: TextStyle(
                                              color: Color(0xFF1584EB),
                                              fontSize: 14,
                                              fontFamily: 'Work Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Container(
                                            width: 24,
                                            height: 24,
                                            child: Icon(Icons.arrow_forward,
                                                color: Color(0xFF1584EB)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.3,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 32),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1, color: Color(0xFFDAE9EE)),
                                  borderRadius: BorderRadius.circular(16),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 32,
                                              height: 32,
                                              child: FlutterLogo(),
                                            ),
                                            const SizedBox(width: 8),
                                            const Text(
                                              'Flashcards',
                                              style: TextStyle(
                                                color: Color(0xFF020E2B),
                                                fontSize: 28,
                                                fontFamily: 'Work Sans',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          'Revise e memorize conteúdos de forma direta e objetiva',
                                          style: TextStyle(
                                            color: Theme.of(context).hintColor,
                                            fontSize: 16,
                                            fontFamily: 'Mulish',
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  InkWell(
                                    onTap: () => {
                                      setState(() {
                                        homeStore.selectedIndex = 2;
                                      }),
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              width: 1,
                                              color: Color(0xFF1584EB)),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Acessar',
                                            style: TextStyle(
                                              color: Color(0xFF1584EB),
                                              fontSize: 14,
                                              fontFamily: 'Work Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Container(
                                            width: 24,
                                            height: 24,
                                            child: const Icon(
                                                Icons.arrow_forward,
                                                color: Color(0xFF1584EB)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.3,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 32),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1, color: Color(0xFFDAE9EE)),
                                  borderRadius: BorderRadius.circular(16),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 88,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 32,
                                                height: 32,
                                                child: SvgPicture.asset(
                                                  'assets/svg/book.svg',
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: SizedBox(
                                                  child: Text(
                                                    'Caderno',
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .hintColor,
                                                      fontSize: 28,
                                                      fontFamily: 'Work Sans',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            'Faça anotações de forma prática e documente seu aprendizado.',
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context).hintColor,
                                              fontSize: 16,
                                              fontFamily: 'Mulish',
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        homeStore.selectedIndex = 3;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1,
                                              color: Color(0xFF1584EB)),
                                          borderRadius:
                                              BorderRadius.circular(6),
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
                                            'Acessar',
                                            style: TextStyle(
                                              color: Color(0xFF1584EB),
                                              fontSize: 14,
                                              fontFamily: 'Work Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Container(
                                            width: 24,
                                            height: 24,
                                            child: Icon(Icons.arrow_forward,
                                                color: Color(0xFF1584EB)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.3,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 32),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1, color: Color(0xFFDAE9EE)),
                                  borderRadius: BorderRadius.circular(16),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 88,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 32,
                                                height: 32,
                                                child: FlutterLogo(),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                'Reviews',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                  fontSize: 28,
                                                  fontFamily: 'Work Sans',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            'Navegue pela base completa de Reviews da StepMD Brazil para reforçar seu aprendizado.',
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context).hintColor,
                                              fontSize: 16,
                                              fontFamily: 'Mulish',
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        homeStore.selectedIndex = 5;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1,
                                              color: Color(0xFF1584EB)),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Acessar',
                                            style: TextStyle(
                                              color: Color(0xFF1584EB),
                                              fontSize: 14,
                                              fontFamily: 'Work Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Container(
                                            width: 24,
                                            height: 24,
                                            child: Icon(Icons.arrow_forward,
                                                color: Color(0xFF1584EB)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
              // Row(
              //   children: [
              //     SizedBox(
              //       width: MediaQuery.of(context).size.width * 0.5,
              //       child: Center(
              //         child: SizedBox(
              //           width: MediaQuery.of(context).size.width * 0.3,
              //           child: const Text(
              //             'Conteúdo da Home ainda será feito quando tiver todas as funcionalidades prontas\n\nícones ainda vão ser mudados',
              //             style: TextStyle(
              //               color: Color(0xFF51628A),
              //               fontSize: 22,
              //               fontFamily: appFont,
              //               fontWeight: FontWeight.w500,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //     Container(
              //       width: MediaQuery.of(context).size.width * 0.35,
              //       height: MediaQuery.of(context).size.height * 0.5,
              //       padding:
              //           const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              //       decoration: ShapeDecoration(
              //         color: Colors.white,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(16),
              //         ),
              //         shadows: const [
              //           BoxShadow(
              //             color: Color(0x3FAEAEAE),
              //             blurRadius: 4,
              //             offset: Offset(0, 4),
              //             spreadRadius: 0,
              //           )
              //         ],
              //       ),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Container(
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Container(
              //                   padding: const EdgeInsets.symmetric(
              //                       horizontal: 8, vertical: 4),
              //                   clipBehavior: Clip.antiAlias,
              //                   decoration: ShapeDecoration(
              //                     shape: RoundedRectangleBorder(
              //                         borderRadius: BorderRadius.circular(6)),
              //                   ),
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: [
              //                       SvgPicture.asset(
              //                         color: Color(0xFF957B0B),
              //                         'assets/svg/behavioralScience.svg',
              //                       ),
              //                       const SizedBox(width: 4),
              //                       const Text(
              //                         'Behavioral Science',
              //                         style: TextStyle(
              //                           color: Color(0xFF020F2B),
              //                           fontSize: 14,
              //                           fontFamily: 'Work Sans',
              //                           fontWeight: FontWeight.w500,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //                 const SizedBox(height: 8),
              //                 Container(
              //                   padding: const EdgeInsets.symmetric(
              //                       horizontal: 8, vertical: 4),
              //                   clipBehavior: Clip.antiAlias,
              //                   decoration: ShapeDecoration(
              //                     shape: RoundedRectangleBorder(
              //                         borderRadius: BorderRadius.circular(6)),
              //                   ),
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: [
              //                       SvgPicture.asset(
              //                         color: Color(0xFF957B0B),
              //                         'assets/svg/biochemistry.svg',
              //                       ),
              //                       const SizedBox(width: 4),
              //                       const Text(
              //                         'Biochemistry',
              //                         style: TextStyle(
              //                           color: Color(0xFF020F2B),
              //                           fontSize: 14,
              //                           fontFamily: 'Work Sans',
              //                           fontWeight: FontWeight.w500,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //                 const SizedBox(height: 8),
              //                 Container(
              //                   padding: const EdgeInsets.symmetric(
              //                       horizontal: 8, vertical: 4),
              //                   clipBehavior: Clip.antiAlias,
              //                   decoration: ShapeDecoration(
              //                     shape: RoundedRectangleBorder(
              //                         borderRadius: BorderRadius.circular(6)),
              //                   ),
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: [
              //                       SvgPicture.asset(
              //                         color: Color(0xFF957B0B),
              //                         'assets/svg/biochemistry.svg',
              //                       ),
              //                       const SizedBox(width: 4),
              //                       const Text(
              //                         'Biostatistics/Epidemiology',
              //                         style: TextStyle(
              //                           color: Color(0xFF020F2B),
              //                           fontSize: 14,
              //                           fontFamily: 'Work Sans',
              //                           fontWeight: FontWeight.w500,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //                 const SizedBox(height: 8),
              //                 Container(
              //                   padding: const EdgeInsets.symmetric(
              //                       horizontal: 8, vertical: 4),
              //                   clipBehavior: Clip.antiAlias,
              //                   decoration: ShapeDecoration(
              //                     shape: RoundedRectangleBorder(
              //                         borderRadius: BorderRadius.circular(6)),
              //                   ),
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: [
              //                       SvgPicture.asset(
              //                         color: Color(0xFF957B0B),
              //                         'assets/svg/cardiology.svg',
              //                       ),
              //                       const SizedBox(width: 4),
              //                       const Text(
              //                         'Cardiology',
              //                         style: TextStyle(
              //                           color: Color(0xFF020F2B),
              //                           fontSize: 14,
              //                           fontFamily: 'Work Sans',
              //                           fontWeight: FontWeight.w500,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //                 const SizedBox(height: 8),
              //                 Container(
              //                   padding: const EdgeInsets.symmetric(
              //                       horizontal: 8, vertical: 4),
              //                   clipBehavior: Clip.antiAlias,
              //                   decoration: ShapeDecoration(
              //                     shape: RoundedRectangleBorder(
              //                         borderRadius: BorderRadius.circular(6)),
              //                   ),
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: [
              //                       SvgPicture.asset(
              //                         color: Color(0xFF957B0B),
              //                         'assets/svg/dermatology.svg',
              //                       ),
              //                       const SizedBox(width: 4),
              //                       const Text(
              //                         'Dermatology',
              //                         style: TextStyle(
              //                           color: Color(0xFF020F2B),
              //                           fontSize: 14,
              //                           fontFamily: 'Work Sans',
              //                           fontWeight: FontWeight.w500,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //                 const SizedBox(height: 8),
              //                 Container(
              //                   padding: const EdgeInsets.symmetric(
              //                       horizontal: 8, vertical: 4),
              //                   clipBehavior: Clip.antiAlias,
              //                   decoration: ShapeDecoration(
              //                     shape: RoundedRectangleBorder(
              //                         borderRadius: BorderRadius.circular(6)),
              //                   ),
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: [
              //                       SvgPicture.asset(
              //                         color: Color(0xFF957B0B),
              //                         'assets/svg/endocrinology.svg',
              //                       ),
              //                       const SizedBox(width: 4),
              //                       const Text(
              //                         'Endocrinology',
              //                         style: TextStyle(
              //                           color: Color(0xFF020F2B),
              //                           fontSize: 14,
              //                           fontFamily: 'Work Sans',
              //                           fontWeight: FontWeight.w500,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //                 const SizedBox(height: 8),
              //                 Container(
              //                   padding: const EdgeInsets.symmetric(
              //                       horizontal: 8, vertical: 4),
              //                   clipBehavior: Clip.antiAlias,
              //                   decoration: ShapeDecoration(
              //                     shape: RoundedRectangleBorder(
              //                         borderRadius: BorderRadius.circular(6)),
              //                   ),
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: [
              //                       SvgPicture.asset(
              //                         color: Color(0xFF957B0B),
              //                         'assets/svg/gastroenterology.svg',
              //                       ),
              //                       const SizedBox(width: 4),
              //                       const Text(
              //                         'Gastroenterology',
              //                         style: TextStyle(
              //                           color: Color(0xFF020F2B),
              //                           fontSize: 14,
              //                           fontFamily: 'Work Sans',
              //                           fontWeight: FontWeight.w500,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //                 const SizedBox(height: 8),
              //                 Container(
              //                   padding: const EdgeInsets.symmetric(
              //                       horizontal: 8, vertical: 4),
              //                   clipBehavior: Clip.antiAlias,
              //                   decoration: ShapeDecoration(
              //                     shape: RoundedRectangleBorder(
              //                         borderRadius: BorderRadius.circular(6)),
              //                   ),
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: [
              //                       SvgPicture.asset(
              //                         color: Color(0xFF957B0B),
              //                         'assets/svg/genetics.svg',
              //                       ),
              //                       const SizedBox(width: 4),
              //                       const Text(
              //                         'Genetics',
              //                         style: TextStyle(
              //                           color: Color(0xFF020F2B),
              //                           fontSize: 14,
              //                           fontFamily: 'Work Sans',
              //                           fontWeight: FontWeight.w500,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //                 const SizedBox(height: 8),
              //                 Container(
              //                   padding: const EdgeInsets.symmetric(
              //                       horizontal: 8, vertical: 4),
              //                   clipBehavior: Clip.antiAlias,
              //                   decoration: ShapeDecoration(
              //                     shape: RoundedRectangleBorder(
              //                         borderRadius: BorderRadius.circular(6)),
              //                   ),
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: [
              //                       SvgPicture.asset(
              //                         color: Color(0xFF957B0B),
              //                         'assets/svg/hematology.svg',
              //                       ),
              //                       const SizedBox(width: 4),
              //                       const Text(
              //                         'Hematology',
              //                         style: TextStyle(
              //                           color: Color(0xFF020F2B),
              //                           fontSize: 14,
              //                           fontFamily: 'Work Sans',
              //                           fontWeight: FontWeight.w500,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //                 const SizedBox(height: 8),
              //                 Container(
              //                   padding: const EdgeInsets.symmetric(
              //                       horizontal: 8, vertical: 4),
              //                   clipBehavior: Clip.antiAlias,
              //                   decoration: ShapeDecoration(
              //                     shape: RoundedRectangleBorder(
              //                         borderRadius: BorderRadius.circular(6)),
              //                   ),
              //                   child: Row(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: [
              //                       SvgPicture.asset(
              //                         color: Color(0xFF957B0B),
              //                         'assets/svg/immunology.svg',
              //                       ),
              //                       const SizedBox(width: 4),
              //                       const Text(
              //                         'Immunology',
              //                         style: TextStyle(
              //                           color: Color(0xFF020F2B),
              //                           fontSize: 14,
              //                           fontFamily: 'Work Sans',
              //                           fontWeight: FontWeight.w500,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //           const SizedBox(width: 5),
              //           Column(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Container(
              //                 padding: const EdgeInsets.symmetric(
              //                     horizontal: 8, vertical: 4),
              //                 clipBehavior: Clip.antiAlias,
              //                 decoration: ShapeDecoration(
              //                   shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(6)),
              //                 ),
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     SvgPicture.asset(
              //                       color: Color(0xFF957B0B),
              //                       'assets/svg/immunology.svg',
              //                     ),
              //                     const SizedBox(width: 4),
              //                     const Text(
              //                       'Infectious Disease',
              //                       style: TextStyle(
              //                         color: Color(0xFF020F2B),
              //                         fontSize: 14,
              //                         fontFamily: 'Work Sans',
              //                         fontWeight: FontWeight.w500,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               const SizedBox(height: 8),
              //               Container(
              //                 padding: const EdgeInsets.symmetric(
              //                     horizontal: 8, vertical: 4),
              //                 clipBehavior: Clip.antiAlias,
              //                 decoration: ShapeDecoration(
              //                   shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(6)),
              //                 ),
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     SvgPicture.asset(
              //                       color: Color(0xFF957B0B),
              //                       'assets/svg/musculoskeletal.svg',
              //                     ),
              //                     const SizedBox(width: 4),
              //                     const Text(
              //                       'Musculoskeletal',
              //                       style: TextStyle(
              //                         color: Color(0xFF020F2B),
              //                         fontSize: 14,
              //                         fontFamily: 'Work Sans',
              //                         fontWeight: FontWeight.w500,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               const SizedBox(height: 8),
              //               Container(
              //                 padding: const EdgeInsets.symmetric(
              //                     horizontal: 8, vertical: 4),
              //                 clipBehavior: Clip.antiAlias,
              //                 decoration: ShapeDecoration(
              //                   shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(6)),
              //                 ),
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     SvgPicture.asset(
              //                       color: Color(0xFF957B0B),
              //                       'assets/svg/neurology.svg',
              //                     ),
              //                     const SizedBox(width: 4),
              //                     const Text(
              //                       'Neurology',
              //                       style: TextStyle(
              //                         color: Color(0xFF020F2B),
              //                         fontSize: 14,
              //                         fontFamily: 'Work Sans',
              //                         fontWeight: FontWeight.w500,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               const SizedBox(height: 8),
              //               Container(
              //                 padding: const EdgeInsets.symmetric(
              //                     horizontal: 8, vertical: 4),
              //                 clipBehavior: Clip.antiAlias,
              //                 decoration: ShapeDecoration(
              //                   shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(6)),
              //                 ),
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     SvgPicture.asset(
              //                       color: Color(0xFF957B0B),
              //                       'assets/svg/pathology.svg',
              //                     ),
              //                     const SizedBox(width: 4),
              //                     const Text(
              //                       'Pathology',
              //                       style: TextStyle(
              //                         color: Color(0xFF020F2B),
              //                         fontSize: 14,
              //                         fontFamily: 'Work Sans',
              //                         fontWeight: FontWeight.w500,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               const SizedBox(height: 8),
              //               Container(
              //                 padding: const EdgeInsets.symmetric(
              //                     horizontal: 8, vertical: 4),
              //                 clipBehavior: Clip.antiAlias,
              //                 decoration: ShapeDecoration(
              //                   shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(6)),
              //                 ),
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     SvgPicture.asset(
              //                       color: Color(0xFF957B0B),
              //                       'assets/svg/pharmacology.svg',
              //                     ),
              //                     const SizedBox(width: 4),
              //                     const Text(
              //                       'Pharmacology',
              //                       style: TextStyle(
              //                         color: Color(0xFF020F2B),
              //                         fontSize: 14,
              //                         fontFamily: 'Work Sans',
              //                         fontWeight: FontWeight.w500,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               const SizedBox(height: 8),
              //               Container(
              //                 padding: const EdgeInsets.symmetric(
              //                     horizontal: 8, vertical: 4),
              //                 clipBehavior: Clip.antiAlias,
              //                 decoration: ShapeDecoration(
              //                   shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(6)),
              //                 ),
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     SvgPicture.asset(
              //                       color: Color(0xFF957B0B),
              //                       'assets/svg/psychiatry.svg',
              //                     ),
              //                     const SizedBox(width: 4),
              //                     const Text(
              //                       'Psychiatry',
              //                       style: TextStyle(
              //                         color: Color(0xFF020F2B),
              //                         fontSize: 14,
              //                         fontFamily: 'Work Sans',
              //                         fontWeight: FontWeight.w500,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               const SizedBox(height: 8),
              //               Container(
              //                 padding: const EdgeInsets.symmetric(
              //                     horizontal: 8, vertical: 4),
              //                 clipBehavior: Clip.antiAlias,
              //                 decoration: ShapeDecoration(
              //                   shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(6)),
              //                 ),
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     SvgPicture.asset(
              //                       color: Color(0xFF957B0B),
              //                       'assets/svg/pulmonary.svg',
              //                     ),
              //                     const SizedBox(width: 4),
              //                     const Text(
              //                       'Pulmonary',
              //                       style: TextStyle(
              //                         color: Color(0xFF020F2B),
              //                         fontSize: 14,
              //                         fontFamily: 'Work Sans',
              //                         fontWeight: FontWeight.w500,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               const SizedBox(height: 8),
              //               Container(
              //                 padding: const EdgeInsets.symmetric(
              //                     horizontal: 8, vertical: 4),
              //                 clipBehavior: Clip.antiAlias,
              //                 decoration: ShapeDecoration(
              //                   shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(6)),
              //                 ),
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     SvgPicture.asset(
              //                       color: Color(0xFF957B0B),
              //                       'assets/svg/renal.svg',
              //                     ),
              //                     const SizedBox(width: 4),
              //                     const Text(
              //                       'Renal',
              //                       style: TextStyle(
              //                         color: Color(0xFF020F2B),
              //                         fontSize: 14,
              //                         fontFamily: 'Work Sans',
              //                         fontWeight: FontWeight.w500,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               const SizedBox(height: 8),
              //               Container(
              //                 padding: const EdgeInsets.symmetric(
              //                     horizontal: 8, vertical: 4),
              //                 clipBehavior: Clip.antiAlias,
              //                 decoration: ShapeDecoration(
              //                   shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(6)),
              //                 ),
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     SvgPicture.asset(
              //                       color: Color(0xFF957B0B),
              //                       'assets/svg/gynecology.svg',
              //                     ),
              //                     const SizedBox(width: 4),
              //                     const Text(
              //                       'Female Genital ,Reproductive & Breast',
              //                       style: TextStyle(
              //                         color: Color(0xFF020F2B),
              //                         fontSize: 14,
              //                         fontFamily: 'Work Sans',
              //                         fontWeight: FontWeight.w500,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               const SizedBox(height: 8),
              //               Container(
              //                 padding: const EdgeInsets.symmetric(
              //                     horizontal: 8, vertical: 4),
              //                 clipBehavior: Clip.antiAlias,
              //                 decoration: ShapeDecoration(
              //                   shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(6)),
              //                 ),
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     SvgPicture.asset(
              //                       color: Color(0xFF957B0B),
              //                       'assets/svg/male.svg',
              //                     ),
              //                     const SizedBox(width: 4),
              //                     const Text(
              //                       'Male Pathology',
              //                       style: TextStyle(
              //                         color: Color(0xFF020F2B),
              //                         fontSize: 14,
              //                         fontFamily: 'Work Sans',
              //                         fontWeight: FontWeight.w500,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     )
              //   ],
              // ),
            ],
          ),
        ),
      );
    });
  }
}
