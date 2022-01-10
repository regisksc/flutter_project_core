import 'package:flutter_project_core/core.dart';

class ModelMock implements Model {
  ModelMock(this.name, this.age);
  factory ModelMock.fromJson(Map<String, dynamic> json) {
    return ModelMock(
      json['name'].toString(),
      int.tryParse(json['age'].toString()) ?? 0,
    );
  }

  final String name;
  final int age;

  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();

  @override
  Entity get toEntity => throw UnimplementedError();

  @override
  Map<String, dynamic> get toJson => throw UnimplementedError();
}
