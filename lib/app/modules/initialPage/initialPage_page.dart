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
                      height: MediaQuery.of(context).size.height * 0.24,
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
                                    height: 172,
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
                              height: MediaQuery.of(context).size.height * 0.24,
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
                                    height: 172,
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
                          const SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.24,
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
                                    height: 172,
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
                                            'Step 3:',
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
                                            'Testa a habilidade de aplicar conhecimentos de forma independente no contexto clínico, sendo a última etapa antes de se qualificar para a licença médica.',
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
                        'Certificação ECFMG?',
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
                            text: 'A certificação da',
                            style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: 18,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text:
                                'Educational Commission for Foreign Medical Graduates (ECFMG)',
                            style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: 18,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text:
                                ' é um requisito essencial para médicos formados no exterior que desejam exercer a medicina nos Estados Unidos. Ela comprova que o profissional possui os conhecimentos e habilidades necessários para ingressar em programas de residência médica no país.\n',
                            style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: 18,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text:
                                '\nOs principais requisitos para obter a certificação ECFMG são:\n',
                            style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: 18,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: '\n• Aprovação no USMLE Step 1.',
                            style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: 18,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text:
                                '\n• Aprovação no USMLE Step 2 CK (Clinical Knowledge).',
                            style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: 18,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text:
                                '\n• Demonstração de proficiência no inglês médico através do Occupational English Test (OET).',
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
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: const BoxDecoration(color: Color(0xFFEEF6FF)),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: Text(
                              'OET - Occupational English Test',
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
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        'Além dos exames USMLE, os candidatos devem comprovar proficiência em inglês médico por meio do OET. A certificação ECFMG exige pontuações mínimas em uma única tentativa do teste:',
                                    style: TextStyle(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 18,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\n• Listening: 350',
                                    style: TextStyle(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 18,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\n• Reading: 350',
                                    style: TextStyle(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 18,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\n• Speaking: 350',
                                    style: TextStyle(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 18,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\n• Writing: 300\n',
                                    style: TextStyle(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 18,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '\nO OET avalia as habilidades de comunicação médica em inglês, garantindo que os profissionais sejam capazes de se comunicar de forma clara e eficaz em contextos clínicos.',
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
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
                              height: MediaQuery.of(context).size.height * 0.24,
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
                                        homeStore.selectedIndexDB = 0;
                                      });
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
                              height: MediaQuery.of(context).size.height * 0.24,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 32),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
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
                                              child: SvgPicture.asset(
                                                'assets/svg/flashcards.svg',
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
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
                              height: MediaQuery.of(context).size.height * 0.24,
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
                                                      .primaryColor,
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
                            const SizedBox(height: 24),
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.24,
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
                                                child: Icon(
                                                  Icons.description_outlined,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
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
                                          side: const BorderSide(
                                              width: 1,
                                              color: Color(0xFF1584EB)),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                      ),
                                      child: const Row(
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
                                          SizedBox(width: 8),
                                          SizedBox(
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
            ],
          ),
        ),
      );
    });
  }
}
