import 'package:floriferous/carta_flor.dart';
import 'package:test/test.dart';

void main() {
  group('Cartas flor', () {
    test('Si CartaFlor(TipoFlor.amapola, ColorFlor.morado) la descripción será Flor amapola color morado', () {
    CartaFlor cartaFlor = CartaFlor(tipoFlor: TipoFlor.amapola, colorFlor: ColorFlor.morado);
    expect(cartaFlor.descripcionCarta(), equals("Flor amapola color morado"));
  });

  test('Si CartaFlor(TipoFlor.amapola, ColorFlor.morado, Insecto.abeja) la descripción será Flor amapola color morado con abeja', () {
    CartaFlor cartaFlor = CartaFlor(tipoFlor: TipoFlor.amapola, colorFlor: ColorFlor.morado, insecto: Insecto.abeja);
    expect(cartaFlor.descripcionCarta(), equals("Flor amapola color morado con abeja"));
  });  
  });

  group('Carta Arreglo', () {
    test('Si al constructor como insecto se le pasa un Insecto.noInsecto', () {
    expect(() => CartaArreglo(TipoFlor.amapola, ColorFlor.amarillo, Insecto.noInsecto), throwsA(isA<ValorInsectoNoValido>()));
  });

  test('Si CartaArreglo(TipoFlor.amapola, ColorFlor.blanco, Insecto.abeja) la descripcion sera Flor: amapola, color: blanco, insecto: abeja', () {
    CartaArreglo cartaArreglo = CartaArreglo(TipoFlor.amapola, ColorFlor.blanco, Insecto.abeja);
    expect(cartaArreglo.descripcionCarta(), equals("Flor: amapola, color: blanco, insecto: abeja"));
  });
  });
  
}

class ValorInsectoNoValido implements Exception{}
class CartaArreglo{
    late final TipoFlor _tipoFlor;
    late final ColorFlor _colorFlor;
    late final Insecto _insecto;

    TipoFlor get getTipoFlor => _tipoFlor;
    ColorFlor get getColorFlor => _colorFlor;
    Insecto get getInsecto => _insecto;

    CartaArreglo(TipoFlor tipoFlor, ColorFlor colorFlor, Insecto insecto){
      _tipoFlor = tipoFlor;
      _colorFlor = colorFlor;
      if(insecto == Insecto.noInsecto){
        throw ValorInsectoNoValido();  
      }
      _insecto = insecto;
    }

    String descripcionCarta(){
      String tipoFlor = _tipoFlor.name;
      String colorFlor = _colorFlor.name;
      String insecto = _insecto.name;

      return "Flor: $tipoFlor, color: $colorFlor, insecto: $insecto";
    }



}
