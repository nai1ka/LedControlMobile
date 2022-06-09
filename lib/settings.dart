import 'package:flutter/material.dart';
import 'package:led_control_mobile/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double brightness = 0;
  double animationSpeed = 0;
  @override
  void initState() {
    super.initState();
    getBrightness();
    getAnimationSpeed();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Brightness",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Expanded(
                    child: Slider(
                      min: 0,
                      max: 255,
                      value: brightness,
                      onChanged: (double value) {
                        setState(() {
                          brightness = value;
                        });
                      },
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        saveBrightness(brightness);
                        Utils.openSite(
                            "brightness?value=" + brightness.toInt().toString());
                      },
                      child: Text("Send"))
                ],
              ),
              const Text("Animation speed",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Expanded(
                    child: Slider(
                      min: 0,
                      max: 20,
                      value: animationSpeed,
                      onChanged: (double value) {
                        setState(() {
                          animationSpeed = value;
                        });
                      },
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        saveAnimationSpeed(animationSpeed);
                        Utils.openSite("animationSpeed?value=" +
                            animationSpeed.toInt().toString());
                      },
                      child: Text("Send"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getBrightness() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      brightness = prefs.getDouble("brightness") ?? 0;
    });
  }

  void getAnimationSpeed() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      animationSpeed = prefs.getDouble("animationSpeed") ?? 0;
    });
  }
}

void saveBrightness(double brightness) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setDouble("brightness", brightness);
}

void saveAnimationSpeed(double animationSpeed) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setDouble("animationSpeed", animationSpeed);
}

