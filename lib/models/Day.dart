/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Day type in your schema. */
@immutable
class Day extends Model {
  static const classType = const _DayModelType();
  final String id;
  final TemporalDate? _date;
  final String? _dayImageUrl;
  final String? _dayImageKey;
  final double? _rating;
  final double? _sleep;
  final double? _consumedCalories;
  final double? _workoutCalories;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  TemporalDate get date {
    try {
      return _date!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get dayImageUrl {
    return _dayImageUrl;
  }
  
  String? get dayImageKey {
    return _dayImageKey;
  }
  
  double get rating {
    try {
      return _rating!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get sleep {
    try {
      return _sleep!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get consumedCalories {
    try {
      return _consumedCalories!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get workoutCalories {
    try {
      return _workoutCalories!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Day._internal({required this.id, required date, dayImageUrl, dayImageKey, required rating, required sleep, required consumedCalories, required workoutCalories, createdAt, updatedAt}): _date = date, _dayImageUrl = dayImageUrl, _dayImageKey = dayImageKey, _rating = rating, _sleep = sleep, _consumedCalories = consumedCalories, _workoutCalories = workoutCalories, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Day({String? id, required TemporalDate date, String? dayImageUrl, String? dayImageKey, required double rating, required double sleep, required double consumedCalories, required double workoutCalories}) {
    return Day._internal(
      id: id == null ? UUID.getUUID() : id,
      date: date,
      dayImageUrl: dayImageUrl,
      dayImageKey: dayImageKey,
      rating: rating,
      sleep: sleep,
      consumedCalories: consumedCalories,
      workoutCalories: workoutCalories);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Day &&
      id == other.id &&
      _date == other._date &&
      _dayImageUrl == other._dayImageUrl &&
      _dayImageKey == other._dayImageKey &&
      _rating == other._rating &&
      _sleep == other._sleep &&
      _consumedCalories == other._consumedCalories &&
      _workoutCalories == other._workoutCalories;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Day {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("date=" + (_date != null ? _date!.format() : "null") + ", ");
    buffer.write("dayImageUrl=" + "$_dayImageUrl" + ", ");
    buffer.write("dayImageKey=" + "$_dayImageKey" + ", ");
    buffer.write("rating=" + (_rating != null ? _rating!.toString() : "null") + ", ");
    buffer.write("sleep=" + (_sleep != null ? _sleep!.toString() : "null") + ", ");
    buffer.write("consumedCalories=" + (_consumedCalories != null ? _consumedCalories!.toString() : "null") + ", ");
    buffer.write("workoutCalories=" + (_workoutCalories != null ? _workoutCalories!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Day copyWith({String? id, TemporalDate? date, String? dayImageUrl, String? dayImageKey, double? rating, double? sleep, double? consumedCalories, double? workoutCalories}) {
    return Day._internal(
      id: id ?? this.id,
      date: date ?? this.date,
      dayImageUrl: dayImageUrl ?? this.dayImageUrl,
      dayImageKey: dayImageKey ?? this.dayImageKey,
      rating: rating ?? this.rating,
      sleep: sleep ?? this.sleep,
      consumedCalories: consumedCalories ?? this.consumedCalories,
      workoutCalories: workoutCalories ?? this.workoutCalories);
  }
  
  Day.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _date = json['date'] != null ? TemporalDate.fromString(json['date']) : null,
      _dayImageUrl = json['dayImageUrl'],
      _dayImageKey = json['dayImageKey'],
      _rating = (json['rating'] as num?)?.toDouble(),
      _sleep = (json['sleep'] as num?)?.toDouble(),
      _consumedCalories = (json['consumedCalories'] as num?)?.toDouble(),
      _workoutCalories = (json['workoutCalories'] as num?)?.toDouble(),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'date': _date?.format(), 'dayImageUrl': _dayImageUrl, 'dayImageKey': _dayImageKey, 'rating': _rating, 'sleep': _sleep, 'consumedCalories': _consumedCalories, 'workoutCalories': _workoutCalories, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'date': _date, 'dayImageUrl': _dayImageUrl, 'dayImageKey': _dayImageKey, 'rating': _rating, 'sleep': _sleep, 'consumedCalories': _consumedCalories, 'workoutCalories': _workoutCalories, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField DATE = QueryField(fieldName: "date");
  static final QueryField DAYIMAGEURL = QueryField(fieldName: "dayImageUrl");
  static final QueryField DAYIMAGEKEY = QueryField(fieldName: "dayImageKey");
  static final QueryField RATING = QueryField(fieldName: "rating");
  static final QueryField SLEEP = QueryField(fieldName: "sleep");
  static final QueryField CONSUMEDCALORIES = QueryField(fieldName: "consumedCalories");
  static final QueryField WORKOUTCALORIES = QueryField(fieldName: "workoutCalories");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Day";
    modelSchemaDefinition.pluralName = "Days";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: AuthRuleProvider.USERPOOLS,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Day.DATE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Day.DAYIMAGEURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Day.DAYIMAGEKEY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Day.RATING,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Day.SLEEP,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Day.CONSUMEDCALORIES,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Day.WORKOUTCALORIES,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _DayModelType extends ModelType<Day> {
  const _DayModelType();
  
  @override
  Day fromJson(Map<String, dynamic> jsonData) {
    return Day.fromJson(jsonData);
  }
}