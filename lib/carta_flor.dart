
import 'package:equatable/equatable.dart';

enum TipoFlor {crisantemo, margarita, amapola, lirio, tulipan}
enum ColorFlor {blanco, amarillo, naranja, rosa, morado}
enum Insecto {abeja, escarabajo, mariposa, mariquita, polilla, noInsecto}
class CartaFlor extends Equatable{
    
    late final TipoFlor _tipoFlor;
    late final ColorFlor _colorFlor;
    late final Insecto _insecto;

    TipoFlor get getTipoFlor => _tipoFlor;
    ColorFlor get getColorFlor => _colorFlor;
    Insecto get getInsecto => _insecto;

    CartaFlor({required TipoFlor tipoFlor, required ColorFlor colorFlor, Insecto insecto = Insecto.noInsecto}){
      _tipoFlor = tipoFlor;
      _colorFlor = colorFlor;
      _insecto = insecto;
    }

  String descripcionCarta() {
    String tipoFlor = _tipoFlor.name;
    String colorFlor = _colorFlor.name;
    if(_insecto == Insecto.noInsecto){
      return "Flor $tipoFlor color $colorFlor";
    }
    String insecto = _insecto.name;
    return "Flor $tipoFlor color $colorFlor con $insecto";
  }
  
  @override
  List<Object?> get props => [_tipoFlor, _colorFlor, _insecto];
}