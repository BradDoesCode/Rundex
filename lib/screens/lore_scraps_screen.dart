import 'package:dragonwilds_companion/classes/collectibles/collectibles.dart';
import 'package:dragonwilds_companion/main.dart';
import 'package:dragonwilds_companion/utils/utils.dart';
import 'package:flutter/material.dart';

class LoreScrapsScreen extends StatelessWidget {
  const LoreScrapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lore Scraps'),
      ),
      body: ListView.builder(
        itemCount: kLoreScraps.length,
        itemBuilder: (context, index) {
          return ScrapItemCard(item: kLoreScraps[index]);
        },
      ),
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
      trailing: (item.webLink != null && item.webLink!.isNotEmpty)
          ? Text('View on\nmap genie')
          : null,
    );
  }
}
