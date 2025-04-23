import 'package:freezed_annotation/freezed_annotation.dart';

part 'collectibles.freezed.dart';
part 'collectibles.g.dart';

enum CollectibleType {
  book,
  recipe,
}

enum Collection {
  none,
  dragonAttack,
  goblin,
  guthix,
  garou,
  dragonkin,
  abyssal,
  castle,
  cathan,
  quest
}

extension CollectionExtension on Collection {
  String get name {
    switch (this) {
      case Collection.dragonAttack:
        return 'Dragon Attack';
      case Collection.goblin:
        return 'Goblin';
      case Collection.guthix:
        return 'Guthix';
      case Collection.garou:
        return 'Garou';
      case Collection.dragonkin:
        return 'Dragonkin';
      case Collection.abyssal:
        return 'Abyssal';
      case Collection.castle:
        return 'Castle';
      case Collection.cathan:
        return 'Cathan';
      case Collection.quest:
        return 'Quest';
      default:
        return '';
    }
  }
}

@freezed
sealed class Collectible with _$Collectible {
  factory Collectible({
    required String name,
    String? description,
    String? image,
    CollectibleType? type,
    @Default(Collection.none) Collection collection,
    String? location,
    String? region,
    String? world,
    String? webLink,
  }) = _Collectible;

  factory Collectible.fromJson(Map<String, dynamic> json) =>
      _$CollectibleFromJson(json);
}
