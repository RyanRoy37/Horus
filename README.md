# HORUS 🦅

HORUS is a Flutter-based mobile app built for bird watchers that helps you **identify bird species** using your camera or photo uploads and provides detailed information on birds commonly found in Bengaluru. Designed for nature enthusiasts, HORUS combines **AI-powered image recognition** with a curated local bird database.

---

## Integration with OSEA Model

HORUS leverages the **OSEA Mobile** offline bird identification system, which uses pretrained AI models for detection and classification:

- **Detection:** Uses pretrained `ssd mobilenet` for bird detection.
- **Classification:** Employs a `ResNet34` based model trained via MetaFGNet on the DongNiao DIB-10K dataset.

The model files and assets come from the OSEA project, including:

- `bird_model.onnx` (quantized version of the classification model)
- `ssd_mobilenet.onnx` (quantized detection model)
- Bird info JSON and database files with curated bird data

You can download all necessary OSEA assets by running the provided script:

./assets_download.sh


---

## Features

- 📷 **Bird Recognition:** AI-powered recognition using TensorFlow Lite models on-device, no internet needed.  
- 📚 **Bengaluru Bird Guide:** Detailed info about local birds.  
- 📂 **Image Import & Carousel:** Select and browse images easily.  
- 🎯 **Offline Functionality:** Runs fully offline using OSEA’s robust AI models.

---

## Requirements

- Flutter SDK ≥ 3.0.0  
- Dart SDK ≥ 3.0.0  
- Android Studio / VS Code  
- Java 11+  
- Android SDK (API level 21+)

---

## Installation & Running

1. Clone the HORUS repository:
git clone https://github.com/RyanRoy37/Horus.git
cd horus


2. Download OSEA model assets:
./assets_download.sh

3. Run the app using the Flutter command:
flutter run lib/main.dart


---

## About OSEA Mobile
OSEA is an AI framework for offline bird identification with pretrained models for detection (`ssd mobilenet`) and classification (`ResNet34` via MetaFGNet). It supports local bird recognition without needing a network connection, ideal for mobile usage in fieldwork.
For more details, visit the [OSEA Mobile GitHub](https://github.com/sun-jiao/osea_mobile) and related model resources.






