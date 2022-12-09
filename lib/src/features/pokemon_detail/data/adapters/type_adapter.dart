import 'package:pokedex/src/features/pokemon_detail/data/models/value_objects_models/type_model.dart';
import 'package:pokedex/src/features/pokemon_detail/domain/entities/values_objects/pokemon_types_value_objects.dart';

class TypeAdapter {
  static TypesEntity adapter(TypeModel typeModel) {
    return TypesEntity(name: typeModel.name);
  }
}
