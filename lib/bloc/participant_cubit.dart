import 'package:bloc/bloc.dart';
import 'package:budget_management/model/json_formatted.dart';
import 'package:meta/meta.dart';

import '../data/local_service.dart';

part 'participant_state.dart';

class ParticipantCubit extends Cubit<ParticipantState> {
  final LocalService localService;

  ParticipantCubit(this.localService) : super(ParticipantInitial());

  Future<void> addParticipant(int userId, Participant participant) async {
    emit(ParticipantLoading());

    try {
      localService.addParticipant(userId, participant).then((value) => emit(ParticipantAddSuccess()));
    } catch (e) {
      emit(ParticipantError(e.toString()));
    }
  }

  Future<void> updateParticipant(int userId, Participant participant) async {
    emit(ParticipantLoading());

    try {
      localService.updateParticipant(userId, participant).then((value) => emit(ParticipantUpdateSuccess()));
    } catch (e) {
      emit(ParticipantError(e.toString()));
    }
  }

  Future<void> deleteParticipant(int userId, int participantId) async {
    emit(ParticipantLoading());

    try {
      localService.deleteParticipant(userId, participantId).then((value) => emit(ParticipantDeleteSuccess()));
    } catch (e) {
      emit(ParticipantError(e.toString()));
    }
  }

  Future<void> getParticipant(int userId, int participantId) async {
    emit(ParticipantLoading());

    try {
      localService
          .getParticipantById(userId, participantId)
          .then((value) => emit(ParticipantGetSuccess(value)));
    } catch (e) {
      emit(ParticipantError(e.toString()));
    }
  }

  Future<void> getParticipants(int userId) async {
    emit(ParticipantLoading());

    try {
      localService
          .getParticipants(userId)
          .then((value) => emit(ParticipantListGetSuccess(value)));
    } catch (e) {
      emit(ParticipantError(e.toString()));
    }
  }
}
