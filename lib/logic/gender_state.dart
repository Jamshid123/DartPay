part of 'gender_cubit.dart';

enum GenderType {
  male,
  female
}

@immutable
abstract class GenderState {}

class GenderInitial extends GenderState {}

class GenderMale extends GenderState {
  final GenderType genderType;

  GenderMale({required this.genderType});

}

class GenderFemale extends GenderState {
  final GenderType genderType;
  GenderFemale({required this.genderType});

}