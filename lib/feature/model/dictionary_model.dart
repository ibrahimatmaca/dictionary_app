import 'package:json_annotation/json_annotation.dart';

part 'dictionary_model.g.dart';

@JsonSerializable()
class Dictionary {
  String? word;
  List<Phonetics>? phonetics;
  List<Meanings>? meanings;

  Dictionary({this.word, this.phonetics, this.meanings});

  factory Dictionary.fromJson(Map<String, dynamic> json) {
    return _$DictionaryFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DictionaryToJson(this);
  }
}

@JsonSerializable()
class Phonetics {
  String? text;
  String? audio;

  Phonetics({this.text, this.audio});

  factory Phonetics.fromJson(Map<String, dynamic> json) {
    return _$PhoneticsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PhoneticsToJson(this);
  }
}

@JsonSerializable()
class Meanings {
  String? partOfSpeech;
  List<Definitions>? definitions;

  Meanings({this.partOfSpeech, this.definitions});

  factory Meanings.fromJson(Map<String, dynamic> json) {
    return _$MeaningsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MeaningsToJson(this);
  }
}

@JsonSerializable()
class Definitions {
  String? definition;
  String? example;
  List<String>? synonyms;

  Definitions({this.definition, this.example, this.synonyms});

  factory Definitions.fromJson(Map<String, dynamic> json) {
    return _$DefinitionsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DefinitionsToJson(this);
  }
}
