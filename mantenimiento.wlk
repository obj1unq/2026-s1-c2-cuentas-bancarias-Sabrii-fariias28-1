object viveres {
    var calidadViveres = 0
    var cantidadViveres = (calidadViveres * 30) / 100

    method cambiarCantidadViveres(cantidad) {
      cantidadViveres = (calidadViveres * cantidad) / 100
    }
    
    method viveres(porcentaje) {
      return (self.calidad() * porcentaje ) / 100
    }

    method calidad() {
      return calidadViveres
    }
    method cambiarCalidad(calidad) {
      calidadViveres = calidad
    }

}