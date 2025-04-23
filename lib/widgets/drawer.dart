import 'package:dragonwilds_companion/utils/utils.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              'Dragonwilds Companion',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.web),
            title: const Text('Official Wiki'),
            onTap: () async {
              final Uri url = Uri.parse('https://dragonwilds.runescape.wiki/');
              await launchWeb(url);
            },
          ),
          ListTile(
            leading: const Icon(Icons.pin_drop),
            title: const Text('Resource Map'),
            onTap: () async {
              final Uri url =
                  Uri.parse('https://mapgenie.io/runescape-dragonwilds');
              await launchWeb(url);
            },
          ),
          Spacer(),
          ListTile(
            leading: const Icon(Icons.coffee),
            title: const Text('Buy us a health potion'),
            onTap: () {},
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text('Version: 0.0.0'),
            ),
          ),
        ],
      ),
    );
  }
}
