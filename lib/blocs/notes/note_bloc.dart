import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_product_1/services/repositories/core/basic_repository.dart';
import 'package:mobile_product_1/models/tagged_note.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final BasicRepository noteRepository;

  NoteBloc(this.noteRepository) : super(NotesLoadInProgress());

  @override
  Stream<NoteState> mapEventToState(
    NoteEvent event,
  ) async* {
    if (event is NotesRequested) {
      yield* _mapNotesRequestedToState();
    } else if (event is NoteAdded) {
      yield* _mapNoteAddedToState(event);
    } else if (event is NoteDeleted) {
      yield* _mapNoteDeletedToState(event);
    } else if (event is NoteUpdated) {
      yield* _mapNoteUpdatedToState(event);
    }
  }

  Stream<NoteState> _mapNotesRequestedToState() async* {
    try {
      final notes = await this.noteRepository.load();
      yield NotesLoadSuccess(notes);
    } catch (_) {
      yield NotesLoadFailure();
    }
  }

  _mapNoteAddedToState(NoteAdded event) async* {
    if (state is NotesLoadSuccess) {
      final updatedNotes = (state as NotesLoadSuccess).notes..add(event.note);

      yield NotesLoadSuccess(updatedNotes);
      _saveNotes(updatedNotes);
    }
  }

  _mapNoteDeletedToState(NoteDeleted event) async* {
    if (state is NotesLoadSuccess) {
      final updatedNotes = (state as NotesLoadSuccess)
          .notes
          .where((note) => note.id != event.note.id)
          .toList();

      yield NotesLoadSuccess(updatedNotes);
      _saveNotes(updatedNotes);
    }
  }

  _mapNoteUpdatedToState(NoteUpdated event) async* {
    if (state is NotesLoadSuccess) {
      final updatedNotes = (state as NotesLoadSuccess)
          .notes
          .map((note) => note.id == event.note.id ? event.note : note)
          .toList();

      yield NotesLoadSuccess(updatedNotes);
      _saveNotes(updatedNotes);
    }
  }

  Future<void> _saveNotes(List<TaggedNote> notes) {
    return noteRepository.save(
      notes.map((note) => note.toEntity()).toList(),
    );
  }
}
