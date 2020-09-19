import 'package:flutter/material.dart';
import './auth.dart';

final List<Map<String, dynamic>> quotes = [
  {
    'id': Key('1'),
    'quote': 'You’re ripped at every edge but you’re a masterpiece.',
    'image': 'images/1.jpg'
  },
  {
    'id': Key('2'),
    'quote':
        'The thing about being an artist is that you evolve so quickly, you grow, you learn, you change, you find yourself hating work that you made months prior. That’s the hard part about making an album, but every couple days I fall asleep listening to my album front to back and I lay there feeling so proud of what I did.',
    'image': 'images/3.jpg'
  },
  {
    'id': Key('3'),
    'quote':
        'People are so afraid to talk about real things, but they’re experiences that everyone goes through.',
    'image': 'images/2.jpg'
  },
  {
    'id': Key('4'),
    'quote':
        'At the end of the day, every decision I make about my music is about creating a collective.',
    'image': 'images/4.jpg'
  },
  {
    'id': Key('5'),
    'quote': 'I got no anger, got no malice / Just a little bit of regret.',
    'image': 'images/5.jpg'
  },
  {
    'id': Key('6'),
    'quote': 'There’s power in the words you’re thinking.',
    'image': 'images/6.jpg'
  },
  {
    'id': Key('7'),
    'quote': 'I really need a mirror that’ll come along and tell me I’m fine.',
    'image': 'images/7.jpg'
  },
  {
    'id': Key('8'),
    'quote':
        'Told me pick my battles/And be picking them wise/But I wanna pick them all.',
    'image': 'images/8.jpg'
  },
  {
    'id': Key('9'),
    'quote': 'I’m constantly / Constantly / having a breakthrough.',
    'image': 'images/9.jpg'
  },
  {
    'id': Key('10'),
    'quote':
        'Being an artist and having a following can be a very scary thing because idolization makes you question your inner role in the universe. A lot of people get caught up in this idea of, \“Wow! This world does revolve around me,\” and it most certainly does not. It\’s the exact opposite; these people don\’t exist for you, you exist for them.',
    'image': 'images/10.jpg'
  },
];

void removeItem(int i) {
  quotes.removeAt(i);
}

class ListScreen extends StatelessWidget {
  static const routeName = '/list-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Halsey Says'),
          backgroundColor: Colors.purple,
        ),
        drawer: MyDrawer(),
        // backgroundColor: Colors.grey,
        body: ListBuilderBox());
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(width: 20),
            Container(
              width: 150,
              child: Image.asset('images/admin.png'),
            ),
            SizedBox(width: 20),
            Text(
              'admin',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            )
          ],
        ),
        Divider(),
        ListTile(
          title: Text('Logout'),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Are you sure?'),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('No')),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(AuthScreen.routeName);
                        },
                        child: Text('Yes'))
                  ],
                );
              },
            );
          },
        ),
        Divider(),
        ListTile(title: Text('Language'),
        onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Coming Soon!'),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Okay')),
                  
                  ],
                );
              },
            );
          },),
        Divider(),
      ],
    ));
  }
}

class ListBuilderBox extends StatefulWidget {
  const ListBuilderBox({
    Key key,
  }) : super(key: key);

  @override
  _ListBuilderBoxState createState() => _ListBuilderBoxState();
}

class _ListBuilderBoxState extends State<ListBuilderBox> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => Dismissible(
        key: quotes[i]['id'],
        direction: DismissDirection.endToStart,
        onDismissed: (_) {
          setState(() {
            removeItem(i);
          });
        },
        background: Container(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.delete,
            size: 48,
            color: Colors.white,
          ),
          color: Colors.red,
        ),
        child: QuoteHolder(
          quoteText: quotes[i]['quote'],
          image: quotes[i]['image'],
        ),
      ),
      itemCount: quotes.length,
    );
  }
}

class QuoteHolder extends StatelessWidget {
  final String quoteText;
  final String image;
  QuoteHolder({
    Key key,
    @required this.quoteText,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(80, 80, 80, 0.7),
            ),
            
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
               margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                constraints: BoxConstraints.expand(
                  height: mediaQuery.size.height * 0.24,
                  width: mediaQuery.size.width * 0.7,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: SingleChildScrollView(
              child: Text(
                quoteText,
                softWrap: true,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
