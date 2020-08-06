import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_product_1/models/tag_entity.dart';
import 'package:mobile_product_1/services/repositories/core/basic_repository.dart';

part 'tag_event.dart';
part 'tag_state.dart';

class TagBloc extends Bloc<TagEvent, TagState> {
  final BasicRepository tagRepository;

  TagBloc(this.tagRepository) : super(TagsLoadInProgress());

  @override
  Stream<TagState> mapEventToState(
    TagEvent event,
  ) async* {
    if (event is TagsRequested) {
      yield* _mapTagsRequestedToState();
    } else if (event is TagAdded) {
      yield* _mapTagAddedToState(event);
    } else if (event is TagDeleted) {
      yield* _mapTagDeletedToState(event);
    } else if (event is TagUpdated) {
      yield* _mapTagUpdatedToState(event);
    }
  }

  Stream<TagState> _mapTagsRequestedToState() async* {
    try {
      final tags = await this.tagRepository.load();
      yield TagsLoadSuccess(tags);
    } catch (_) {
      yield TagsLoadFailure();
    }
  }

  _mapTagAddedToState(TagAdded event) async* {
    if (state is TagsLoadSuccess) {
      final updatedtags = (state as TagsLoadSuccess).tags..add(event.tag);

      yield TagsLoadSuccess(updatedtags);
      _saveTags(updatedtags);
    }
  }

  _mapTagDeletedToState(TagDeleted event) async* {
    if (state is TagsLoadSuccess) {
      final updatedTags = (state as TagsLoadSuccess)
          .tags
          .where((tag) => tag.id != event.tag.id)
          .toList();

      yield TagsLoadSuccess(updatedTags);
      _saveTags(updatedTags);
    }
  }

  _mapTagUpdatedToState(TagUpdated event) async* {
    if (state is TagsLoadSuccess) {
      final updatedTags = (state as TagsLoadSuccess)
          .tags
          .map((tag) => tag.id == event.tag.id ? event.tag : tag)
          .toList();

      yield TagsLoadSuccess(updatedTags);
      _saveTags(updatedTags);
    }
  }

  Future<void> _saveTags(List<TagEntity> tags) {
    return tagRepository.save(tags);
  }
}
