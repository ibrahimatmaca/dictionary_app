// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dictionary _$DictionaryFromJson(Map<String, dynamic> json) => Dictionary(
      word: json['word'] as String?,
      phonetics: (json['phonetics'] as List<dynamic>?)
          ?.map((e) => Phonetics.fromJson(e as Map<String, dynamic>))
          .toList(),
      meanings: (json['meanings'] as List<dynamic>?)
          ?.map((e) => Meanings.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DictionaryToJson(Dictionary instance) =>
    <String, dynamic>{
      'word': instance.word,
      'phonetics': instance.phonetics,
      'meanings': instance.meanings,
    };

Phonetics _$PhoneticsFromJson(Map<String, dynamic> json) => Phonetics(
      text: json['text'] as String?,
      audio: json['audio'] as String?,
    );

Map<String, dynamic> _$PhoneticsToJson(Phonetics instance) => <String, dynamic>{
      'text': instance.text,
      'audio': instance.audio,
    };

Meanings _$MeaningsFromJson(Map<String, dynamic> json) => Meanings(
      partOfSpeech: json['partOfSpeech'] as String?,
      definitions: (json['definitions'] as List<dynamic>?)
          ?.map((e) => Definitions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MeaningsToJson(Meanings instance) => <String, dynamic>{
      'partOfSpeech': instance.partOfSpeech,
      'definitions': instance.definitions,
    };

Definitions _$DefinitionsFromJson(Map<String, dynamic> json) => Definitions(
      definition: json['definition'] as String?,
      example: json['example'] as String?,
      synonyms: (json['synonyms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DefinitionsToJson(Definitions instance) =>
    <String, dynamic>{
      'definition': instance.definition,
      'example': instance.example,
      'synonyms': instance.synonyms,
    };
