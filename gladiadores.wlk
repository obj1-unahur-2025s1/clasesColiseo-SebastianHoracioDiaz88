import arma.*
import grupos.*


class Mirmillones {

    var vida = 100

    var armadura

    var arma

    var fuerza

    method puedeConbatir () = vida > 0

    method destreza () = 15

    method fuerza () = fuerza

    method cambiarArmadura (unaArmadura) {
        armadura = unaArmadura
    }

    method defensa () = armadura.poderArmadura(self) + self.destreza()

    method poderAtaque () = arma.poderAtaque() + fuerza

    method agregarArma (unArma) {

    }

    method recibirAtaque (poderAtaque) {

        vida = vida - (poderAtaque - self.defensa())
        

    }

    method atacar (unGladiador) {
        unGladiador.recibirAtaque(self.poderAtaque ())
    }

    method pelearContra (unGladiador) {
        self.atacar(unGladiador)
        unGladiador.atacar(self)
    }

    method vida () = vida

    method amarGrupoCon (unGladiador) {
        const grupo1 = new Grupo (nombre = "Mirmillolandia")
        grupo1.agregar(self)
        grupo1.agregar(unGladiador)
    }

}

class Dimachaurus {

    var vida = 100

    var armas = []

    var destreza

    method puedeConbatir () = vida > 0

    method destreza () = destreza

    method fuerza () = 10

    method cambiarArmadura (unaArmadura) {
        
    }

    method agregarArma (unArma) {
        armas.add (unArma)
    }

    method quitarArma (unArma) {
        armas.remove (unArma)
    }

    method defensa () = self.destreza() / 2

    method poderAtaque () = armas.sum({unArma => unArma.poderAtaque()}) + self.fuerza()

    method recibirAtaque (poderAtaque) {

        vida = vida - (poderAtaque - self.defensa())
        
    }

    method atacar (unGladiador) {
        unGladiador.recibirAtaque(self.poderAtaque ())
        destreza = destreza + 1
    }

    method pelearContra (unGladiador) {
        self.atacar(unGladiador)
        unGladiador.atacar(self)
    }

    method vida () = vida

        method amarGrupoCon (unGladiador) {
        const grupo1 = new Grupo (nombre = "D-"+(self.poderAtaque()+unGladiador.poderAtaque()))
        grupo1.agregar(self)
        grupo1.agregar(unGladiador)
    }

    method curar () {
        vida = 100
    }

}
