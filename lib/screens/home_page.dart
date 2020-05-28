import 'package:flutter/material.dart';
import 'package:flutter_sandbox/common/styles.dart';
import 'package:flutter_sandbox/models/demo.dart';
import 'package:flutter_sandbox/models/demo_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 1,
        title: Text(
          'Hey Sahit.',
          style: Styles.navBarText,
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.settings,
              color: Colors.grey[400],
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: ListView(
          children: <Widget>[
            DemoSection(
              category: 'Touch Interactions',
              demoList: DemoList.touchInteractionDemos,
            ),
            DemoSection(
              category: 'Input',
              demoList: DemoList.inputDemos,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile'))
        ],
        selectedItemColor: Colors.lightBlue,
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
          padding: const EdgeInsets.all(16.0),
          child: Text(
            this.category,
            style: Styles.headerText,
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
                  padding: const EdgeInsets.only(left: 16.0),
                  width: 200,
                  child: DemoCard(demo: demo),
                );
              }),
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
            style: Styles.cardText,
          ),
        ),
        elevation: 3.0,
      ),
    );
  }
}
