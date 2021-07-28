import 'package:brn/config/constants.dart';
import 'package:brn/presentation/screens/agenda/agenda_detail_screen.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/simple_app_bar_title.dart';
import 'package:flutter/material.dart';

class AgendaScreen extends StatefulWidget {
  @override
  _AgendaScreenState createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: [
        SimpleAppBarTitle(title: 'Agenda'),
      ],
      body: ListView(
        children: [
          AgendaItem(),
          AgendaItem(),
        ],
      ),
    );
  }
}

class AgendaItem extends StatelessWidget {
  const AgendaItem({
    Key key,
  }) : super(key: key);

  void agendaDetail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => AgendaDetailScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => agendaDetail(context),
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        shadowColor: Colors.grey.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(kPaddingM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        end: Alignment.topCenter,
                        begin: Alignment.bottomRight,
                        colors: [
                          primaryColor,
                          primaryDarkColor,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset(
                          'assets/images/agenda.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    width: kPaddingS + 3,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rapat Anggota Member BRN',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '1 December 2021',
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: kPaddingS,
              ),
              Text(
                'Mengutip Antara, Ahad, 24 Januari 2021, mayoritas kejadian merupakan bencana hidrometeorologi atau bencana yang terjadi sebagai dampak dari fenomena meteorologi (alam). Bencana banjir mendominasi dengan 134 kejadian, disusul tanah longsor 31 kejadian, dan puting beliung sebanyak 24 kejadian.',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
