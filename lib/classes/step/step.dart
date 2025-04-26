import 'package:freezed_annotation/freezed_annotation.dart';

part 'step.freezed.dart';
part 'step.g.dart';

@freezed
sealed class Step with _$Step {
  const Step._();
  factory Step({
    required String id,
    required String name,
    String? description,
    String? image,
    String? location,
    String? region,
    String? world,
    List<String>? rewards,
  }) = _Step;

  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);
}
