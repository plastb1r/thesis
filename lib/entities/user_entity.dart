// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String photoUrl;

  const UserEntity({this.id, this.name, this.photoUrl});

  @override
  get props => [id, name, photoUrl];

  @override
  bool get stringify => true;
}
