part of 'tag_bloc.dart';

abstract class TagEvent extends Equatable {
  const TagEvent();

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [];
}

class TagsRequested extends TagEvent {}

class TagAdded extends TagEvent {
  final TagEntity tag;

  const TagAdded(this.tag);

  @override
  List<Object> get props => [tag];
}

class TagDeleted extends TagEvent {
  final TagEntity tag;

  const TagDeleted(this.tag);

  @override
  List<Object> get props => [tag];
}

class TagUpdated extends TagEvent {
  final TagEntity tag;

  const TagUpdated(this.tag);

  @override
  List<Object> get props => [tag];
}
