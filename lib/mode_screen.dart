import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:led_control_mobile/utils.dart';


class ModePage extends StatelessWidget {
  const ModePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: IntrinsicWidth(

            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Text(
                    "Choose the mode",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.all(6)),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          content: showColorPicker()
                        );
                      });
                      showColorPicker();
                    },
                    child: Text("Custom color"),
                  ),
                  Padding(padding: const EdgeInsets.only(bottom: 8)),
                  ElevatedButton(
                    onPressed: () {
                      Utils.openSite("rainbow");
                    },
                    child: Text("Rainbow"),
                  ),
                  Padding(padding: const EdgeInsets.only(bottom: 8)),
                  ElevatedButton(
                    onPressed: () {
                      Utils.openSite("twinkle");
                    },
                    child: Text("Twinkle"),
                  ),
                  Padding(padding: const EdgeInsets.only(bottom: 8)),
                  ElevatedButton(
                    onPressed: () {
                      Utils.openSite("cycle");
                    },
                    child: Text("Cycle"),
                  ),
                  Padding(padding: const EdgeInsets.only(bottom: 8)),
                  ElevatedButton(
                    onPressed: () {
                      Utils.openSite("off");
                    },
                    child: Text("OFF"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}



Widget showColorPicker(){
  return MaterialPicker(
    pickerColor: Colors.white, //default color
    onColorChanged: (Color color){ //on color picked
      Utils.openSite("rgb?r="+color.red.toString()+"&g="+color.green.toString()+"&b="+color.blue.toString());
    },
  );
}