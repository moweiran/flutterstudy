// import 'package:flutter/material.dart';
// import 'package:qrcode/qrcode.dart';

// class ScanPage extends StatefulWidget {
//   final String title;
//   ScanPage({this.title});
//   @override
//   ScanPageState createState() => ScanPageState();
// }

// class ScanPageState extends State<ScanPage> {
//   QRCaptureController _captureController = QRCaptureController();

//   bool _isTorchOn = false;

//   @override
//   void initState() {
//     super.initState();

//     _captureController.onCapture((data) {
//       print('onCapture----$data');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Stack(
//           alignment: Alignment.center,
//           children: <Widget>[
//             QRCaptureView(controller: _captureController),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: _buildToolBar(),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildToolBar() {
//     return Row(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         FlatButton(
//           onPressed: () {
//             _captureController.pause();
//           },
//           child: Text('pause'),
//         ),
//         FlatButton(
//           onPressed: () {
//             if (_isTorchOn) {
//               _captureController.torchMode = CaptureTorchMode.off;
//             } else {
//               _captureController.torchMode = CaptureTorchMode.on;
//             }
//             _isTorchOn = !_isTorchOn;
//           },
//           child: Text('torch'),
//         ),
//         FlatButton(
//           onPressed: () {
//             _captureController.resume();
//           },
//           child: Text('resume'),
//         ),
//       ],
//     );
//   }
// }
