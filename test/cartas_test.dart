import 'package:floriferous/floriferous.dart';
import 'package:test/test.dart';

void main() {
  test('Si CartaFlor(TipoFlor.amapola, ColorFlor.morado la descripción será Flor amapola color morado)', () {
    CartaFlor cartaFlor = CartaFlor(tipoFlor: TipoFlor.amapola, colorFlor: ColorFlor.morado);
    expect(cartaFlor.descripcionCarta(), equals("Flor amapola color morado"));
  });
}

enum TipoFlor {crisantemo, margarita, amapola, lirio, tulipan}
enum ColorFlor {blanco, amarillo, naranja, rosa, morado}
class CartaFlor{
    
    late final TipoFlor _tipoFlor;
    late final ColorFlor _colorFlor;

    TipoFlor get getTipoFlor => _tipoFlor;
    ColorFlor get getColorFlor => _colorFlor;

    CartaFlor({required TipoFlor tipoFlor, required ColorFlor colorFlor}){
      _tipoFlor = tipoFlor;
      _colorFlor = colorFlor;
    }

  String descripcionCarta() {
    String tipoFlor = _tipoFlor.name;
    String colorFlor = _colorFlor.name;
    return "Flor $tipoFlor color $colorFlor";
  }
}
