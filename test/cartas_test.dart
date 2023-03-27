import 'package:floriferous/floriferous.dart';
import 'package:test/test.dart';

void main() {
  test('Si CartaFlor(TipoFlor.amapola, ColorFlor.morado) la descripción será Flor amapola color morado', () {
    CartaFlor cartaFlor = CartaFlor(tipoFlor: TipoFlor.amapola, colorFlor: ColorFlor.morado);
    expect(cartaFlor.descripcionCarta(), equals("Flor amapola color morado"));
  });

  test('Si CartaFlor(TipoFlor.amapola, ColorFlor.morado, Insecto.abeja) la descripción será Flor amapola color morado con abeja', () {
    CartaFlor cartaFlor = CartaFlor(tipoFlor: TipoFlor.amapola, colorFlor: ColorFlor.morado, insecto: Insecto.abeja);
    expect(cartaFlor.descripcionCarta(), equals("Flor amapola color morado con abeja"));
  });
}

enum TipoFlor {crisantemo, margarita, amapola, lirio, tulipan}
enum ColorFlor {blanco, amarillo, naranja, rosa, morado}
enum Insecto {abeja, escarabajo, mariposa, mariquita, polilla, noInsecto}
class CartaFlor{
    
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
}
