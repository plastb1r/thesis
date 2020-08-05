part of 'tag_bloc.dart';

abstract class TagState extends Equatable {
  const TagState();

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [];
}

class TagsLoadInProgress extends TagState {}

class TagsLoadSuccess extends TagState {
  final List<TagEntity> tags;

  const TagsLoadSuccess(this.tags);

  @override
  List<Object> get props => [tags];
}

class TagsLoadFailure extends TagState {}
