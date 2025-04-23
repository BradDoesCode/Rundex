import 'package:dragonwilds_companion/classes/progression_sections/progression_sections.dart';
import 'package:dragonwilds_companion/screens/main_quests_screen.dart';
import 'package:dragonwilds_companion/widgets/progress_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 16),
        itemCount: ProgressionSections.values.length,
        itemBuilder: (context, index) => SizedBox(
          width: MediaQuery.of(context).size.width - 16,
          height: 250,
          child: ProgressCard(
            title: ProgressionSections.values[index].title,
            subtitle: ProgressionSections.values[index].subtitle,
            image: ProgressionSections.values[index].image,
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MainQuestsScreen()));
            },
          ),
        ),
      ),
    );
  }
}
