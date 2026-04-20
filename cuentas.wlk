object cuentaCorriente {
  var saldo = 0

    method saldo(_saldo) {
    saldo = _saldo
  }

  method saldo() {
    return saldo
  }

  method depositar(monto) {
    saldo = saldo + monto
  }

  method extraer(monto) {
    saldo = saldo - monto
    return true
  }
}

object cuentaGastos {
  var saldo = 0
  var costoPorOperacion = 0


    method saldo(_saldo) {
    saldo = _saldo
  }

    method costoPorOperacion(monto) {
      costoPorOperacion = monto
    }
  method saldo() {
    return saldo
  }

  method depositar(monto) {
    if(monto > costoPorOperacion){
        saldo = saldo + monto - costoPorOperacion
    }
  }

    method extraer(monto) {
    saldo = saldo - monto
    return true
  }
}
//Ejercicio 2

object cuentaCombinada {

  method saldo() {
    return 0.max(cuentaGastos.saldo()) + 0.max(cuentaCorriente.saldo()) 
  }

  method depositar(monto) {
    cuentaGastos.depositar(monto)
  }

  method extraer(monto) {
    if (cuentaGastos.saldo() < monto && self.saldo() >= monto) {
      const disponible = cuentaGastos.saldo()
      const resto = monto - disponible

      cuentaGastos.extraer(disponible)
      cuentaCorriente.extraer(resto)

      return true

    } else if (cuentaGastos.saldo() >= monto) {
        cuentaGastos.extraer(monto)
        return true
    }
    else{
      return false
    }
  }

    method costoPorOperacion(costo) {
      cuentaGastos.costoPorOperacion(costo)
    }

      method saldoCuentaPrimaria(monto) {
      cuentaGastos.saldo(monto)
    }

     method saldoCuentaSecundaria(monto) {
      cuentaCorriente.saldo(monto)
    }

}
