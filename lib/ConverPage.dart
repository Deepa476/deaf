import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as https;

class ConvertPage extends StatefulWidget {
  const ConvertPage({super.key});

  @override
  _ConvertPageState createState() => _ConvertPageState();
}

class _ConvertPageState extends State<ConvertPage> {
  CameraController? _cameraController;
  Future<void>? _initializeCameraFuture;
  List<CameraDescription>? cameras;
  int selectedCameraIndex = 0;
  Timer? timer;
  bool _isCapturing = false;
  String detectedText = "Waiting for prediction...";
  String currentLanguage = "English";
  final String apiUrlEnglish = 'http://192.168.1.6:5000/predict/english';
  final String apiUrlGujarati = 'http://192.168.1.6:5000/predict/gujarati';

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      cameras = await availableCameras();
      if (cameras == null || cameras!.isEmpty) {
        print("No cameras available.");
        return;
      }

      _cameraController?.dispose();
      _cameraController = CameraController(
        cameras![selectedCameraIndex],
        ResolutionPreset.medium,
        enableAudio: false,
      );

      _initializeCameraFuture = _cameraController!.initialize();
      await _initializeCameraFuture;

      if (!mounted) return;
      setState(() {});

      // Start capturing frames every 500 milliseconds for smoother predictions
      timer?.cancel();
      timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
        _captureAndPredict();
      });
    } catch (e) {
      print("Error initializing camera: $e");
      setState(() {
        detectedText = "Camera initialization error: $e";
      });
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    timer?.cancel();
    super.dispose();
  }

  Future<void> _captureAndPredict() async {
    if (_isCapturing || _cameraController == null || !_cameraController!.value.isInitialized) return;

    try {
      _isCapturing = true;
      XFile imageFile = await _cameraController!.takePicture();
      Uint8List imageBytes = await imageFile.readAsBytes();
      await _sendToServer(imageBytes);
    } catch (e) {
      print("Error in captureAndPredict: $e");
      setState(() {
        detectedText = "Capture error: $e";
      });
    } finally {
      _isCapturing = false;
    }
  }

  Future<void> _sendToServer(Uint8List imageBytes) async {
    try {
      String apiUrl = currentLanguage == "English" ? apiUrlEnglish : apiUrlGujarati;

      var request = https.MultipartRequest('POST', Uri.parse(apiUrl));
      request.files.add(
        https.MultipartFile.fromBytes('image', imageBytes, filename: 'frame.jpg'),
      );

      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var decoded = jsonDecode(responseData);

        if (decoded.containsKey('prediction')) {
          setState(() {
            detectedText = "Prediction: ${decoded['prediction']}";
            if (decoded.containsKey('sequence')) {
              detectedText += "\nSequence: ${decoded['sequence']}";
            }
          });
        } else {
          setState(() {
            detectedText = "Invalid response from server";
          });
        }
      } else {
        print("Server Error: ${response.statusCode}");
        setState(() {
          detectedText = "Server Error: ${response.statusCode}";
        });
      }
    } catch (e) {
      print("Error in sending request: $e");
      setState(() {
        detectedText = "Error in sending request: $e";
      });
    }
  }

  void _switchCamera() async {
    if (cameras == null || cameras!.isEmpty) return;
    selectedCameraIndex = (selectedCameraIndex + 1) % cameras!.length;
    await _initializeCamera();
  }

  void _toggleLanguage() {
    setState(() {
      currentLanguage = currentLanguage == "English" ? "Gujarati" : "English";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signyy', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FutureBuilder(
                  future: _initializeCameraFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return CameraPreview(_cameraController!);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: _switchCamera,
              icon: const Icon(Icons.switch_camera, color: Colors.blue),
              label: const Text("Switch Camera"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _toggleLanguage,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Text(
                "Switch to ${currentLanguage == 'English' ? 'Gujarati' : 'English'}",
                style: const TextStyle(color: Colors.blue),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                detectedText,
                style: const TextStyle(fontSize: 24, color: Colors.greenAccent),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}