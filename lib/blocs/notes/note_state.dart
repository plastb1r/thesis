part of 'note_bloc.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

class NotesLoadInProgress extends NoteState {}

class NotesLoadSuccess extends NoteState {
  final List<TaggedNote> notes;

  const NotesLoadSuccess([this.notes = const []]);

  @override
  List<Object> get props => [notes];

  @override
  String toString() => 'NoteLoadSuccess { notes: $notes }';
}

class NotesLoadFailure extends NoteState {}
