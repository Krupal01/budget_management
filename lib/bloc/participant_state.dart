part of 'participant_cubit.dart';

@immutable
abstract class ParticipantState {}

class ParticipantInitial extends ParticipantState {}
class ParticipantLoading extends ParticipantState {}
class ParticipantError extends ParticipantState {
  final String errorMessage;

  ParticipantError(this.errorMessage);

}
class ParticipantAddSuccess extends ParticipantState {}
class ParticipantUpdateSuccess extends ParticipantState {}
class ParticipantDeleteSuccess extends ParticipantState {}
class ParticipantGetSuccess extends ParticipantState {
  final Participant participant;
  ParticipantGetSuccess(this.participant);
}
