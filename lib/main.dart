import 'dart:io';

import 'package:crossborderapp/screens/lista_denuncias.dart';
import 'package:crossborderapp/screens/lista_noticias.dart';
import 'package:crossborderapp/screens/lista_commodoties.dart';
import 'package:crossborderapp/screens/lista_reclamacoes.dart';
import 'package:crossborderapp/screens/lista_regulamentos.dart';
import 'package:crossborderapp/screens/lista_sugestoes.dart';
import 'package:crossborderapp/screens/Settings.dart';
import 'package:crossborderapp/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'constants/colors.dart';

const blue = Color(0xFF4781ff);
const kTitleStyle = TextStyle(
    fontSize: 30, color: Color(0xFF01002f), fontWeight: FontWeight.bold);
const kSubtitleStyle = TextStyle(fontSize: 25, color: Color(0xFF88869f));
void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crossborder APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kYellow,
        // primarySwatch: Colors.lightGreen,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/commodities': (context) => ListaCommodoties(),
        '/noticias': (context) => ListaNoticias(),
        '/regulamentos': (context) => ListaRegulamentos(),
        '/reclamacoes': (context) => ListaReclamacoes(),
        '/sugestoes': (context) => ListaSugestoes(),
        '/denuncias': (context) => ListaDenuncias(),
      },
      //home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pageController = new PageController(initialPage: 0);

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(microseconds: 200), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: PageView(
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Slide(
                  hero: Image.asset('./assets/hero-1.png'),
                  title: 'Acelere o comércio',
                  subtitle:
                      'Plataforma móvel projetada para fornecer preços transfronteiriços de commodities',
                  onNext: nextPage),
              Slide(
                  hero: Image.asset('./assets/hero-2.png'),
                  title: 'Best Solution',
                  subtitle:
                      'Plataforma móvel projetada para fornecer preços transfronteiriços de commodities',
                  onNext: nextPage),
              Slide(
                  hero: Image.asset('./assets/hero-3.png'),
                  title: 'Juntos vamos la',
                  subtitle:
                      'Plataforma móvel projetada para fornecer preços transfronteiriços de commodities',
                  onNext: nextPage),
              Container(
                child: Center(child: Text('Welcome', style: kSubtitleStyle)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Slide extends StatelessWidget {
  final Widget hero;
  final String title, subtitle;
  final VoidCallback onNext;

  const Slide(
      {Key? key,
      required this.hero,
      required this.title,
      required this.subtitle,
      required this.onNext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(child: Image.asset('./assets/images/hero-1.png')),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Text(
                title,
                style: kTitleStyle,
              ),
              SizedBox(height: 20),
              Text(
                subtitle,
                style: kSubtitleStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 35),
              ProgressButton(onNext: onNext),
            ]),
          ),
          GestureDetector(
            child: ElevatedButton(
              child: const Text('Skip'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Dashboard()),
                );
              },
            ),
          ),
          SizedBox(
            height: 4,
          )
        ],
      ),
    );
  }
}

class ProgressButton extends StatelessWidget {
  final VoidCallback onNext;
  const ProgressButton({Key? key, required this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 75,
      child: Stack(
        children: [
          Center(
            child: GestureDetector(
              child: Container(
                height: 60,
                width: 60,
                child: Center(
                  child: SvgPicture.asset(
                    './assets/images/arrow.svg',
                    width: 10,
                  ),
                ),
                decoration: BoxDecoration(
                    color: kRedDark, borderRadius: BorderRadius.circular(99)),
              ),
              onTap: onNext,
            ),
          )
        ],
      ),
    );
  }
}

// passar para compoment
class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard '),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings()),
                );
              },
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(30.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              MyCard(
                  title: "Commodities",
                  icon: Icons.train_outlined,
                  color: Colors.blueGrey,
                  link: "/commodities"),
              MyCard(
                  title: "Noticias",
                  icon: Icons.newspaper,
                  color: Colors.green,
                  link: "/noticias"),
              MyCard(
                  title: "Regulamentos",
                  icon: Icons.info_outline,
                  color: Colors.orange,
                  link: "/regulamentos"),
              MyCard(
                  title: "Reclamacoes",
                  icon: Icons.person_pin,
                  color: Colors.blueGrey,
                  link: "/reclamacoes"),
              MyCard(
                  title: "Sugestoes",
                  icon: Icons.local_library,
                  color: Colors.red,
                  link: "/sugestoes"),
              MyCard(
                title: "Denuncias",
                icon: Icons.library_books,
                color: Colors.blue,
                link: "/denuncias",
              ),
            ],
          ),
        ));
  }
}

// passar para compoment

// passar para compoment
class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
