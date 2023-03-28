import 'package:floriferous/carta_flor.dart';
import 'package:floriferous/carta_arreglo.dart';
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

  test('Si CartaArreglo(TipoFlor.amapola, ColorFlor.naranja, Insecto.polilla) se puntua con el tipo de flor', () {
    CartaFlor cartaFlor = CartaFlor(tipoFlor: TipoFlor.amapola, colorFlor: ColorFlor.naranja);
    CartaArreglo cartaArreglo = CartaArreglo(TipoFlor.amapola, ColorFlor.naranja, Insecto.polilla);
    cartaArreglo.puntuarArreglo(cartaFlor, ParametroCarta.flor);
    expect(cartaArreglo.puntos, equals(1));
  });

   test('Si se quiere volver a puntear el mismo parametro de la flor de Carta arreglo', () {
    CartaFlor cartaFlor = CartaFlor(tipoFlor: TipoFlor.amapola, colorFlor: ColorFlor.naranja);
    CartaFlor cartaFlor2 = CartaFlor(tipoFlor: TipoFlor.amapola, colorFlor: ColorFlor.naranja, insecto: Insecto.abeja);
    CartaArreglo cartaArreglo = CartaArreglo(TipoFlor.amapola, ColorFlor.naranja, Insecto.polilla);
    cartaArreglo.puntuarArreglo(cartaFlor, ParametroCarta.flor);
    expect(() => cartaArreglo.puntuarArreglo(cartaFlor2, ParametroCarta.flor), throwsA(isA<ParametroYaPuntuado>()));
  });

  test('Si se puntea 2 parametros de una cartaArreglo', () {
    CartaFlor cartaFlor = CartaFlor(tipoFlor: TipoFlor.amapola, colorFlor: ColorFlor.naranja);
    CartaFlor otraCartaFlor = CartaFlor(tipoFlor: TipoFlor.crisantemo, colorFlor: ColorFlor.naranja);
    CartaArreglo cartaArreglo = CartaArreglo(TipoFlor.amapola, ColorFlor.naranja, Insecto.polilla);
    cartaArreglo.puntuarArreglo(cartaFlor, ParametroCarta.flor);
    cartaArreglo.puntuarArreglo(otraCartaFlor, ParametroCarta.color);
    expect(cartaArreglo.puntos, equals(3));
  });

  test('Si se puntea 3 parametros de una cartaArreglo', () {
    CartaFlor cartaFlor = CartaFlor(tipoFlor: TipoFlor.amapola, colorFlor: ColorFlor.naranja);
    CartaFlor otraCartaFlor = CartaFlor(tipoFlor: TipoFlor.crisantemo, colorFlor: ColorFlor.naranja);
    CartaFlor terceraCartaFlor = CartaFlor(tipoFlor: TipoFlor.lirio, colorFlor: ColorFlor.rosa, insecto: Insecto.polilla);
    CartaArreglo cartaArreglo = CartaArreglo(TipoFlor.amapola, ColorFlor.naranja, Insecto.polilla);
    cartaArreglo.puntuarArreglo(cartaFlor, ParametroCarta.flor);
    cartaArreglo.puntuarArreglo(otraCartaFlor, ParametroCarta.color);
    cartaArreglo.puntuarArreglo(terceraCartaFlor, ParametroCarta.insecto);
    expect(cartaArreglo.puntos, equals(5));
  });

  test('Si se quiere volver a puntear con una carta ya punteada', () {
    CartaFlor cartaFlor = CartaFlor(tipoFlor: TipoFlor.amapola, colorFlor: ColorFlor.naranja);
    CartaArreglo cartaArreglo = CartaArreglo(TipoFlor.amapola, ColorFlor.naranja, Insecto.polilla);
    cartaArreglo.puntuarArreglo(cartaFlor, ParametroCarta.flor);
    expect(() => cartaArreglo.puntuarArreglo(cartaFlor, ParametroCarta.color), throwsA(isA<CartaYaUtilizada>()));
  });
  });
  
}
