import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/constants/hive_table_constant.dart';
import '../../domain/entity/course_entity.dart';

// dart run build_runner build --delete-conflicting-outputs
part 'course_hive_model.g.dart';

final courseHiveModelProvider = Provider(
  (ref) => CourseHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.courseTableId)
class CourseHiveModel {
  @HiveField(0)
  final String courseId;
  @HiveField(1)
  final String courseName;

  //empty contructor
  CourseHiveModel.empty() : this(courseId: "", courseName: "");

  CourseHiveModel({
    String? courseId,
    required this.courseName,
  }) : courseId = courseId ?? const Uuid().v4();

  @override
  String toString() =>
      'CourseEntity(courseId: $courseId, courseName: $courseName)';

  //convert hive object to entity

  CourseEntity toEntity() => CourseEntity(
        courseId: courseId,
        courseName: courseName,
      );

  //covert entity into hive object
  CourseHiveModel toHiveModel(CourseEntity entity) => CourseHiveModel(
        courseName: entity.courseName,
      );

  List<CourseHiveModel> toHiveModelList(List<CourseEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  // Convert hive list to entity list
  List<CourseEntity> toEntityList(List<CourseHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();
}
