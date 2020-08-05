part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [];
}

class NotesRequested extends NoteEvent {}

class NoteAdded extends NoteEvent {
  final TaggedNote note;

  const NoteAdded(this.note);

  @override
  List<Object> get props => [note];
}

class NoteDeleted extends NoteEvent {
  final TaggedNote note;

  const NoteDeleted(this.note);

  @override
  List<Object> get props => [note];
}

class NoteUpdated extends NoteEvent {
  final TaggedNote note;

  const NoteUpdated(this.note);

  @override
  List<Object> get props => [note];
}
