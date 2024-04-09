import 'package:flutter/material.dart';
import 'package:i2c_bme280_final/src/i2c_bme280_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final I2cBme280GetData i2cBme280GetData = I2cBme280GetData();
  String temperatureValue = '';
  @override
  void initState() {
    i2cBme280GetData.initI2cBme280();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('I2C BME280'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('I2C BME280'),
            SizedBox(
              height: 20.0,
            ),
            getI2cBme280Temperature(),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget getI2cBme280Temperature() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          temperatureValue = i2cBme280GetData.getI2CBme280Temperature();
        });
      },
      child: Text('The Temperature is: $temperatureValue'),
    );
  }
}
