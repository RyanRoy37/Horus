import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:horus/models/birds.dart'; // Update with correct path

const kHeaderTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.white,
);

const kBodyTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.teal,
);

class BirdDetailScreen extends StatefulWidget {
  final Bird bird;

  const BirdDetailScreen({super.key, required this.bird});

  @override
  // ignore: library_private_types_in_public_api
  _BirdDetailScreenState createState() => _BirdDetailScreenState();
}

class _BirdDetailScreenState extends State<BirdDetailScreen> {
  late Bird bird;
  Color _dominantColor = Colors.teal;
  bool colorReady = false;

  @override
  void initState() {
    super.initState();
    bird = widget.bird;
    _generatePalette();
  }

  Future<void> _generatePalette() async {
    final generator = await PaletteGenerator.fromImageProvider(
      AssetImage('assets/images/${bird.imageUrl}'),
    );

    setState(() {
      _dominantColor = generator.darkVibrantColor?.color ?? Colors.teal;
      colorReady = true;
    });
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.width * 0.5,
          width: double.infinity,
          decoration: BoxDecoration(
            color: _dominantColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(MediaQuery.of(context).size.width),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Hero(
            tag: bird.commonName,
            child: Image.asset(
              'assets/images/${bird.imageUrl}',
              height: MediaQuery.of(context).size.width * 0.5,
              fit: BoxFit.contain,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Text("$title: ",
              style: kBodyTextStyle.copyWith(
                  fontWeight: FontWeight.bold, color: _dominantColor)),
          Expanded(child: Text(value, style: kBodyTextStyle)),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        title,
        style: kBodyTextStyle.copyWith(
            fontWeight: FontWeight.bold, fontSize: 18, color: _dominantColor),
      ),
    );
  }

  Widget _buildChipList(List<String> items) {
    return Wrap(
      spacing: 8,
      runSpacing: 6,
      children: items
          .map((item) => Chip(
                label: Text(item, style: kHeaderTextStyle),
                backgroundColor: _dominantColor,
              ))
          .toList(),
    );
  }

  Widget _buildBody() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildHeader(),
        const SizedBox(height: 16),
        _buildInfoRow("Scientific Name", bird.scientificName),
        _buildInfoRow("Family", bird.family),
        _buildInfoRow("Order", bird.order),
        _buildInfoRow("Length", bird.size.length),
        _buildInfoRow("Wingspan", bird.size.wingspan),
        _buildInfoRow("Habitat", bird.habitat),
        _buildInfoRow("Range", bird.geographicRange),
        _buildInfoRow("Migration", bird.migratoryPattern),
        _buildInfoRow("Altitude", bird.altitudeRange),
        _buildInfoRow("Beak", "${bird.beak.shape}, ${bird.beak.color}"),
        _buildSectionTitle("Color (Male/Female)"),
        _buildInfoRow("Male", bird.colorMarkings.male),
        _buildInfoRow("Female", bird.colorMarkings.female),
        _buildSectionTitle("Call Types"),
        _buildChipList(bird.callTypes),
        _buildInfoRow("Call Timing", bird.callTiming),
        _buildSectionTitle("Primary Diet"),
        _buildChipList(bird.primaryDiet),
        _buildSectionTitle("Local Sightings"),
        _buildChipList(bird.localSightings),
        const SizedBox(height: 12),
        if (bird.audioClip.isNotEmpty)
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: _dominantColor,
            ),
            icon: Icon(Icons.audiotrack),
            label: Text("Listen to Call"),
            onPressed: () {
              // Use url_launcher to open the audioClip URL
              // launchUrl(Uri.parse(bird.audioClip));
            },
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return colorReady
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: _dominantColor,
              title: Text(bird.commonName),
            ),
            body: SafeArea(child: _buildBody()),
          )
        : const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
  }
}
