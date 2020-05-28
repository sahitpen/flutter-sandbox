import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/constants/app_text.dart';
import 'package:flutter_sandbox/models/demo.dart';
import 'package:flutter_sandbox/models/demo_list.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: PlaygroundAppBar(),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ListView(
          children: <Widget>[
            DemoSection(
              category: 'Touch Interactions',
              demoList: DemoList.touchInteractionDemos,
            ),
            DemoSection(
              category: 'Inputs',
              demoList: DemoList.inputDemos,
            ),
            DemoSection(
              category: 'Information Displays',
              demoList: DemoList.informationDisplayDemos,
            ),
            DemoSection(
              category: 'Buttons',
              demoList: DemoList.buttonDemos,
            ),
            DemoSection(
              category: 'Panels',
              demoList: DemoList.panelDemos,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).cardColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          )
        ],
        selectedItemColor: Theme.of(context).accentColor,
      ),
    );
  }
}

class PlaygroundAppBar extends PreferredSize {
  @override
  Size get preferredSize => Size.fromHeight(125);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      child: AppBar(
        title: Column(
          children: <Widget>[
            Text(
              'Hey Sahit.',
              style: AppText.appBarLight,
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: Padding(
            padding: EdgeInsets.only(bottom: 25.0),
            child: TyperAnimatedTextKit(
              isRepeatingAnimation: true,
              pause: Duration(seconds: 4),
              speed: Duration(milliseconds: 60),
              text: ['Welcome to the playground.', 'Experiment with any widget.'],
              textStyle: AppText.headerAccent,
              textAlign: TextAlign.start,
              alignment: AlignmentDirectional.topStart
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.settings,
              color: Theme.of(context).cardColor,
            ),
          ),
        ],
      ),
    );
  }
}

class DemoSection extends StatelessWidget {
  final String category;
  final List<Demo> demoList;
  DemoSection({this.category, this.demoList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            this.category,
            style: AppText.header,
          ),
        ),
        Container(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: demoList.length,
            itemBuilder: (context, index) {
              final demo = this.demoList[index];
              return Container(
                padding: EdgeInsets.only(left: 16.0),
                width: 200,
                child: DemoCard(demo: demo),
              );
            },
          ),
        ),
      ],
    );
  }
}

class DemoCard extends StatelessWidget {
  final Demo demo;
  DemoCard({this.demo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (demo.pageRoute != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => demo.pageRoute));
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            demo.name,
            style: AppText.subtitle,
          ),
        ),
        elevation: 3.0,
      ),
    );
  }
}
