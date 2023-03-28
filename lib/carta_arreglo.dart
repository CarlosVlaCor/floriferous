import 'carta_flor.dart';

enum ParametroCarta { flor, color, insecto }

class ValorInsectoNoValido implements Exception {}

class CartaYaUtilizada implements Exception {}

class ParametroYaPuntuado implements Exception {}

class CartaArreglo {
  late final TipoFlor _tipoFlor;
  late final ColorFlor _colorFlor;
  late final Insecto _insecto;

  bool _cumpleConTipoFlor = false;
  bool _cumpleConColorFlor = false;
  bool _cumpleConInsecto = false;
  int _puntos = 0;
  Set _cartasPuntuadas = {};

  TipoFlor get getTipoFlor => _tipoFlor;
  ColorFlor get getColorFlor => _colorFlor;
  Insecto get getInsecto => _insecto;
  bool get cumpleConTipoFlor => _cumpleConTipoFlor;
  bool get cumpleConColorFlor => _cumpleConColorFlor;
  bool get cumpleConInsecto => _cumpleConInsecto;
  int get puntos => _puntos;

  CartaArreglo(TipoFlor tipoFlor, ColorFlor colorFlor, Insecto insecto) {
    _tipoFlor = tipoFlor;
    _colorFlor = colorFlor;
    if (insecto == Insecto.noInsecto) {
      throw ValorInsectoNoValido();
    }
    _insecto = insecto;
  }

  String descripcionCarta() {
    String tipoFlor = _tipoFlor.name;
    String colorFlor = _colorFlor.name;
    String insecto = _insecto.name;

    return "Flor: $tipoFlor, color: $colorFlor, insecto: $insecto";
  }

  void puntuarArreglo(CartaFlor cartaFlor, ParametroCarta parametroCarta) {
    if (_cartasPuntuadas.contains(cartaFlor)) {
      throw CartaYaUtilizada();
    }
    switch (parametroCarta) {
      case ParametroCarta.flor:
        if (_cumpleConTipoFlor) {
          throw ParametroYaPuntuado();
        }
        if (_puntos != 0) {
          _puntos += 1;
        }
        _puntos += 1;
        _cumpleConTipoFlor = true;
        _cartasPuntuadas.add(cartaFlor);

        break;
      case ParametroCarta.color:
        if (_cumpleConColorFlor) {
          throw ParametroYaPuntuado();
        }
        if (_puntos != 0) {
          _puntos += 1;
        }
        _puntos += 1;
        _cumpleConColorFlor = true;
        _cartasPuntuadas.add(cartaFlor);

        break;
      case ParametroCarta.insecto:
        if (_cumpleConInsecto) {
          throw ParametroYaPuntuado();
        }
        if (_puntos != 0) {
          _puntos += 1;
        }
        _puntos += 1;
        _cumpleConInsecto = true;
        _cartasPuntuadas.add(cartaFlor);

        break;
    }
  }
}
