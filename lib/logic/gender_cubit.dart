import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'gender_state.dart';

class GenderCubit extends Cubit<GenderState> {
  GenderCubit() : super(GenderInitial()){

  }

  void emitMale () => emit(GenderMale(genderType: GenderType.male));

  void emitFemale () => emit(GenderFemale(genderType: GenderType.female));



}
