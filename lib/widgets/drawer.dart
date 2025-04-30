import 'package:dragonwilds_companion/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              //420D8D
              color: Color.fromARGB(255, 66, 13, 141),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/dragonwilds_companion.png',
                    width: 100,
                    height: 100,
                  ),
                  Text(
                    'Runedex',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
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
            onTap: () async {
              final Uri url =
                  Uri.parse('https://buymeacoffee.com/braddoescode');
              await launchWeb(url);
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Policy'),
            onTap: () async {
              final Uri url = Uri.parse(
                  'https://github.com/BradDoesCode/Rundex/wiki/Privacy-Policy');
              await launchWeb(url);
            },
          ),
          FutureBuilder(
            future: getVersion(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return const Text('Error loading version');
              } else {
                return ListTile(
                  title: Text('Version: ${snapshot.data}'),
                  onTap: () {},
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
