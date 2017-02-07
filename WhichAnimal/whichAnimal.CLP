(deffacts initial-facts (animal y))

(defrule is-multicellular
	?fact <- (animal y)
	=>
	(printout t "Is the organism multicellular? (y,n): ") 
    (assert (multicellular (read)))
    (retract ?fact)
)

(defrule warm-cold-blooded
	?fact <- (multicellular y)
	=>
	(printout t "Is the animal warm-blooded or cold-blooded? (warm,cold): ") 
    (assert (blood-type (read)))
    (retract ?fact)
)

(defrule have-spine
	(blood-type warm)
	=>
	(printout t "Does the organism have a spine? (y,n): ") 
    (assert (spine (read)))
)

(defrule produces-milk
	?fact1 <- (blood-type warm)
	?fact2 <- (spine y)
	=>
	(printout t "Does the organism ever produce milk? (y,n): ") 
    (assert (produces-milk (read)))
)

(defrule is-mammal
	?fact1 <- (blood-type ?)
	?fact2 <- (spine ?)
	?fact3 <- (produces-milk y)
	=>
	(assert (mammal y))
	(retract ?fact1)
	(retract ?fact2)
	(retract ?fact3)
)

(defrule has-feathers 
	(spine y)
	(blood-type warm)
	=>
	(printout t "Does it have feathers? (y,n): ") 
    (assert (feathers (read)))
)

(defrule is-bird 
	?fact1 <- (blood-type ?)
	?fact2 <- (spine y)
	?fact3 <- (feathers y)
	=>
	(assert (bird y))
	(retract ?fact1)
	(retract ?fact2)
	(retract ?fact3)
)

(defrule have-gills
	(blood-type cold)
	=>
	(printout t "Does it have gills? (y,n): ") 
    (assert (gills (read)))
)

(defrule have-scales 
	(gills y)
	=>
	(printout t "And does it have scales? (y,n): ") 
    (assert (scales (read)))
)

(defrule is-fish
	?fact1 <- (blood-type ?)
	?fact2 <- (gills ?)
	?fact3 <- (scales y)
	=>
	(assert (fish y))
	(retract ?fact1)
	(retract ?fact2)
	(retract ?fact3)
)