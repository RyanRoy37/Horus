import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:horus/models/birds.dart';
import 'package:horus/ui/widgets/bird_list_widget.dart';
import 'package:horus/ui/widgets/bird_grid_widget.dart';
import 'package:horus/ui/widgets/bird_detail_screen.dart';
import '../bird_cache.dart';

class BirdsScreen extends StatefulWidget {
  const BirdsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BirdsScreenState createState() => _BirdsScreenState();
}

class _BirdsScreenState extends State<BirdsScreen> {
  bool gridView = false;
  bool birdsFetched = false;
  late Birds birds;

  @override
  void initState() {
    super.initState();
    _loadBirdsFromAssets();
  }

  Future<void> _loadBirdsFromAssets() async {
    String jsonString = await rootBundle.loadString('assets/birds.json');
    birds = birdsFromJson(jsonString);
    BirdCache.birdsList = birds;
    setState(() {
      birdsFetched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scroll to Explore Birds"),
        actions: [
          IconButton(
            icon: Icon(gridView ? Icons.list : Icons.grid_on),
            onPressed: () {
              setState(() {
                gridView = !gridView;
              });
            },
          )
        ],
      ),
      body: birdsFetched
          ? _buildUI()
          : Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: birds.birdList.length,
      itemBuilder: (_, index) {
        final bird = birds.birdList[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BirdDetailScreen(bird: bird),
              ),
            );
          },
          child: BirdListWidget(bird: bird),
        );
      },
    );
  }

  Widget _buildGridView() {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.75,
      padding: EdgeInsets.all(8),
      physics: BouncingScrollPhysics(),
      children: birds.birdList.map((bird) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BirdDetailScreen(bird: bird),
              ),
            );
          },
          child: BirdGridWidget(bird: bird),
        );
      }).toList(),
    );
  }

  Widget _buildUI() {
    return gridView ? _buildGridView() : _buildListView();
  }
}
