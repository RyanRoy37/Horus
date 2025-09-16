import 'package:flutter/material.dart';

class HelpFeedbackPage extends StatefulWidget {
  const HelpFeedbackPage({super.key});

  @override
  State<HelpFeedbackPage> createState() => _HelpFeedbackPageState();
}

class _HelpFeedbackPageState extends State<HelpFeedbackPage> {
  double _rating = 0;
  final TextEditingController _feedbackController = TextEditingController();

  final List<Map<String, String>> faqs = [
    {
      "question": "How do I identify a bird?",
      "answer":
          "Go to the 'Photo' tab, capture or choose an image, and let the app identify the bird using an AI model."
    },
    {
      "question": "How accurate is the identification?",
      "answer":
          "The AI model is trained on a dataset of bird species and provides top predictions with a confidence score."
    },
    {
      "question": "Can I use the app offline?",
      "answer":
          "Yes, once the model is downloaded with the app, image-based identification works offline."
    },
    {
      "question": "Where is the bird data from?",
      "answer":
          "The bird data is curated from public datasets and verified open-source resources."
    },
  ];

  Widget _buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => IconButton(
          icon: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
          onPressed: () {
            setState(() {
              _rating = index + 1.0;
            });
          },
        ),
      ),
    );
  }

  void _submitFeedback() {
    String feedback = _feedbackController.text.trim();

    if (feedback.isNotEmpty || _rating > 0) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Thank You!"),
          content: const Text("Your feedback has been submitted."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  _rating = 0;
                  _feedbackController.clear();
                });
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Help & Feedback"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "FAQs"),
              Tab(text: "Feedback"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // --- FAQ Tab ---
            ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text(
                  "Frequently Asked Questions",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ...faqs.map((faq) => ExpansionTile(
                      title: Text(faq["question"]!),
                      children: [Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(faq["answer"]!),
                      )],
                    )),
                const SizedBox(height: 30),
                const Text(
                  "App Info & Architecture",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text("• App Version: 1.0.0"),
                const Text("• Developed with: Flutter 3.x, Dart"),
                const Text("• Architecture: MVVM (Model-View-ViewModel)"),
                const Text("• ML Model: TFLite for image classification"),
                const Text("• Dependencies: image_picker, tflite, provider, cached_network_image, path_provider"),
              ],
            ),

            // --- Feedback Tab ---
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  const Text(
                    "We'd love your feedback!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text("How would you rate the app?"),
                  const SizedBox(height: 10),
                  _buildStarRating(),
                  const SizedBox(height: 20),
                  const Text("Write your suggestions or issues:"),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _feedbackController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Your feedback...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _submitFeedback,
                    icon: const Icon(Icons.send),
                    label: const Text("Submit"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
