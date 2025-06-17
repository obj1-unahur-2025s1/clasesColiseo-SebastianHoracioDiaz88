import arma.*
import gladiadores.*

class Grupo {
    
    const nombre
    const property gladiadores = #{}

    var round = 0


    method nombre () = nombre

    method agregar (unGladiador) {
        gladiadores.add (unGladiador)
    }

    method quitar (unGladiador) {
        gladiadores.remove (unGladiador)
    }

    method masFuerte () {
    
    var vivos = gladiadores.filter ({unGladiador => unGladiador.vida() > 0})
    
    if (vivos.isEmpty()) {
    
    self.error ("no hay peleador disponible")

    }

    return vivos.max({unGladiador => unGladiador.fuerza()})

    }

    method pelearContra (adversario) {
        self.masFuerte().pelearContra (adversario)
        self.masFuerte().pelearContra (adversario)
        self.masFuerte().pelearContra (adversario)
    }

    method curar () {
        gladiadores.forEach({unGladiador => unGladiador.curar()})
    }

}

object coliseo {

    const combatientes = []

    method agregarCombatiente (unCombatiente) {
        combatientes.add(unCombatiente)
    }

    method curarTodos () {
        combatientes.forEach ({unCombatiente => unCombatiente.curar()})
    }

    method combateSucesivo (unGrupo) {
        combatientes.forEach ({unCombatiente => unGrupo.pelearContra(unCombatiente)})
    }

}