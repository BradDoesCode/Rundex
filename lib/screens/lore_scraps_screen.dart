import 'package:dragonwilds_companion/classes/collectibles/collectibles.dart';
import 'package:dragonwilds_companion/utils/utils.dart';
import 'package:flutter/material.dart';

class LoreScrapsScreen extends StatelessWidget {
  const LoreScrapsScreen({super.key});

  Future<List<Collectible>> loadLoreScraps() async {
    final data =
        await loadJsonList('assets/data/collectibles/lore_scraps.json');
    return data.map((e) => Collectible.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lore Scraps'),
      ),
      body: FutureBuilder(
          future: loadLoreScraps(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text('Error loading lore scraps'));
            }
            final List<Collectible> items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ScrapItemCard(item: items[index]);
              },
            );
          }),
    );
  }
}

class ScrapItemCard extends StatelessWidget {
  const ScrapItemCard({super.key, required this.item});
  final Collectible item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text("${item.location}\n${item.region}"),
      leading: item.image != null
          ? Image.asset(
              item.image!,
              width: 50,
              height: 50,
            )
          : null,
      onTap: () async {
        if (item.webLink == null) {
          return;
        }
        final url = Uri.parse(item.webLink!);
        await launchWeb(url);
      },
      trailing: (true) ? Text('View on\nmap genie') : null,
    );
  }
}
