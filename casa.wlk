import cuentas.*
object casa {
    var gastosTotalAlMes = 0
    var cuenta = cuentaCorriente
    var viveres = 30
    var montoReparaciones = 0

    method gastosTotalAlMes() {
      return  gastosTotalAlMes
    }
//Lo que hago es al gasto restar segun la cuenta bancaria y sumar a los gastos totales del mes
    method gastar(cantidad) {
       if (cuenta.extraer(cantidad)) {
           gastosTotalAlMes = gastosTotalAlMes + cantidad
       }
    }

    method extraer(monto) {
      cuenta.extraer(monto)
    }

    method cambiarMes() {
      self.resetearGastosDelMes()
    }

    method resetearGastosDelMes() {
      gastosTotalAlMes = 0
    }

    method saldoCuenta(monto) {
      cuenta.saldo(monto)
    }

    method saldo() {
      return cuenta.saldo()
    }


    method cambiarACuenta(cuentaBancaria) {
      cuenta = cuentaBancaria
    }

    method depositar(monto) {
      cuenta.depositar(monto)
    }

  
    //Ejercicio 3

  method romper(monto) {
    montoReparaciones = montoReparaciones + monto
  }

  method viveres(porcentaje) {
    viveres = porcentaje
  }

  method comprarViveres(porcentaje,calidad) {
    if(self.puedeComprar(porcentaje)){
      var gasto = porcentaje * calidad
      self.gastar(gasto)
      viveres = viveres + porcentaje
    }
  }
  method puedeComprar(porcentaje) {
    return viveres + porcentaje <= 100
  }

  method hacerReparaciones() {
    self.gastar(montoReparaciones)
    montoReparaciones = 0
  }

  method hayViveresSuficientes() {
    return viveres >= 40
  }

  method hayQueHacerReparaciones() {
    return montoReparaciones > 0
  }

  method enOrden() {
    return not self.hayQueHacerReparaciones() && self.hayViveresSuficientes()
  }

  method cantidadViveres() {
    return viveres
  }
}

/*
Asumiendo que la casa comienza con 30% de víveres y sin necesidad de reparaciones:  
y una cuenta corriente con 2000 pesos

- Romper algo de 1000 pesos, aumentando el monto de reparación.  
- Verificar que la casa:  
  - No Tiene víveres suficientes.  
  - Hay que hacer reparaciones.  
  - No está en orden.  
- intentar comprar 80% de viveres de calidad 2. No se debería poder. La cantidad de viveres sigue siendo 30%, el saldo 2000 y los gastos 0
- comprar 20% de víveres de calidad 2. verificar que:
  - Tiene víveres suficientes. 
  - los viveres son 50 
  - No está en orden.  
  - El saldo de la cuenta corriente es 1960
  - el gasto mensual es de 40
- realizar las reparaciones y verificar que:
  - no hay que hacer reparaciones.  
  - está en orden.  
  - El saldo de la cuenta corriente es 960
  - el gasto mensual es de 1040
  */