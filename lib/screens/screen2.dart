import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  MqttServerClient? client;

  @override
  void initState() {
    super.initState();
    connectToMqttBroker();
  }

  Future<void> connectToMqttBroker() async {
    client = MqttServerClient(
        'http://192.168.1.1:7070/?action=stream', 'flutter_client');

    client!.port = 7070;
    print("breakdownv1");

    try {
      print("breakdownv2");

      await client!.connect("admin", "admin");
      print("breakdownv3");

      //  client!.subscribe('topic', MqttQos.atMostOnce);
      client!.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
        print("breakdownv4");

        final MqttPublishMessage message = c[0].payload as MqttPublishMessage;
        final String payload =
            MqttPublishPayload.bytesToStringAsString(message.payload.message);
        print('Received message: $payload');
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter IoT Communication'),
        ),
        body: Center(
          child: Column(
            children: [
              TextField(),
              Text('Communication with IoT device'),
            ],
          ),
        ),
      ),
    );
  }
}
