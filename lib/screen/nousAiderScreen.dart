import 'package:flutter/material.dart';
import 'package:foi_et_verite_2/utils/colorsApp.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class NousAider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColors,
        title: Text("Nous aider"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: ColorsApp.bodyBackgroundColor,
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    ListTile(title: Text("Conctacter nous sur les telephone")),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.blue,
                      ),
                      title: Text("237 699530505"),
                      onTap: () => callNumber("237 699530505"),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.blue,
                      ),
                      title: Text("237 699933586"),
                      onTap: () => callNumber("237 699933586"),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.blue,
                      ),
                      title: Text("237 677453618"),
                      onTap: () => callNumber("237 677453618"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  callNumber(String number) async {
    bool res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}
