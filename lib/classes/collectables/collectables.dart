import 'package:freezed_annotation/freezed_annotation.dart';

part 'collectables.freezed.dart';
part 'collectables.g.dart';

enum CollectableType {
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
sealed class Collectable with _$Collectable {
  factory Collectable({
    required String name,
    String? description,
    String? image,
    CollectableType? type,
    @Default(Collection.none) Collection collection,
    String? location,
    String? region,
    String? world,
  }) = _Collectable;

  factory Collectable.fromJson(Map<String, dynamic> json) =>
      _$CollectableFromJson(json);
}
