import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final info = NetworkInfo();

  // @override
  // void initState() {
  //   // TODO: implement initState

  //   super.initState();
  //   rec();
  //   Socket.connect('192.168.1.1', 7070).then((socket) async {
  //     sockets = socket;
  //     print(
  //         'client connected : ${socket.remoteAddress.address}:${socket.remotePort}');
  //     int x = 3;
  //     x = await socket.length;
  //     print(x);
  //     //  socket.where((event) => false);
  //     socket.forEach(
  //       (element) {
  //         String s = new String.fromCharCodes(element);
  //         var outputAsUint8List = new Uint8List.fromList(s.codeUnits);
  //         print(outputAsUint8List);
  //       },
  //     );
  //     print("goog");
  //     // socket.listen((data) {
  //     //   print(data.first);
  //     //   print("client listen  : ${String.fromCharCodes(data).trim()}");
  //     // },
  //     // onDone: () {
  //     //   print("client done");
  //     //   socket.destroy();
  //     // });

  //     // socket.write(message);
  //   });
  //  // getInfo();

  //   // sock?.listen((val) {
  //   //   print("client listen  : ${String.fromCharCodes(val).trim()}");
  //   //   print("great");
  //   //   print(val);
  //   // });
  // }

  bool isloading = false;
  Socket? sockets;

  String? wifiName;
  String? wifiBSSID;
  String? wifiIP;
  String? wifiIPv6;
  String? wifiSubmask;
  String? wifiBroadcast;
  String? wifiGateway;
  Socket? sock;
  getInfo() async {
    wifiName = await info.getWifiName(); // "FooNetwork"
    wifiBSSID = await info.getWifiBSSID(); // 11:22:33:44:55:66
    wifiIP = await info.getWifiIP(); // 192.168.1.43
    wifiIPv6 =
        await info.getWifiIPv6(); // 2001:0db8:85a3:0000:0000:8a2e:0370:7334
    wifiSubmask = await info.getWifiSubmask(); // 255.255.255.0
    wifiBroadcast = await info.getWifiBroadcast(); // 192.168.1.255
    wifiGateway = await info.getWifiGatewayIP();
    isloading = true;
    setState(() {});

    // for (int i = 0; i < 44782; i++) {
    //   print("${i}  lol");
    //   sock = await Socket.connect(wifiIP, i).onError((error, stackTrace) {

    //     throw 8;
    //   });
    //   print("${i}  lol");
    //   if (sock != null) {
    //     print(" i ${i} passwordv");
    //   }
    // }
    // sock = await Socket.connect(wifiGateway, 7070);

    // print(sock!.);

    //var x = await sock!.last;

    // recusion(30000);
  }

  List<int> x = [];

  // Future<Socket> recusion(int i) async {
  //   if (i > 66000) {
  //     return Socket.connect(wifiGateway, i);
  //   }
  //   bool go = false;
  //   sock = await Socket.connect(wifiGateway, i).onError((error, stackTrace) {
  //     print("${i} password");
  //     go = true;
  //     return recusion(i + 1);
  //   });
  //   if (go) {
  //     return sock!;
  //   }
  //   x.add(i);
  //   print("${i} passwordOutVaibhav");
  //   return sock!;
  // }
  rec() {
    Socket.connect(wifiGateway, 5007);
    rec();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  function1();
  }

  Socket? socket1;
  function1() {
    print("great");
    Socket.connect(
      "192.168.1.1",
      7070,
    ).then((value) {
      // socket1 = Socket as Socket;
      //  print(socket1.runtimeType);
      //  socket1 = value;
      print(value.address);
      print(value.port);
      print(value.remoteAddress);
      print(value.remotePort);
      print("${value.isBroadcast} ");
      print(value);
      value.write('GET / HTTP/1.1\r\nHost: 192.168.1.1\r\n\r\n');

      value.listen((event) {
        print("greatwe");
        print(event.first);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 30,
          ),
          // Text("wifiname: ${wifiName.toString()}"),
          // Divider(),
          // Text("wifibssid  ${wifiBSSID.toString()}"),
          // Divider(),
          // Text("wifiIp: ${wifiIP.toString()}"),
          // Divider(),
          // Text("wifisUBMAKS : ${wifiSubmask.toString()}"),
          // Divider(),
          // Text("wIFIiPV6: ${wifiIPv6.toString()}"),
          // Divider(),
          // Text("WifiBroadcast  : ${wifiBroadcast.toString()}"),
          // Divider(),
          // Text("wifiGateway : ${wifiGateway.toString()}"),
          Divider(),
          ElevatedButton(
              onPressed: () {
                function1();
              },
              child: Text("Take action")),
          StreamBuilder(
              stream: Socket.connect('192.168.1.1', 7070).asStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  snapshot.data!.length.then(
                    (value) {
                      print("${value} length");
                    },
                  );
                  // print();
                } else {
                  print("data not available");
                }
                return Text("greAT");
              }),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFEBEBF4),
                  Color(0xFFF4F4F4),
                  Color(0xFFEBEBF4),
                ],
                stops: [
                  0.1,
                  0.3,
                  0.4,
                ],
                begin: Alignment(-1.0, -0.3),
                end: Alignment(1.0, 0.3),
                tileMode: TileMode.clamp,
              ),
            ),
            child: Text("Checking..."),
          )
        ]),
      ),
    );
  }
}
