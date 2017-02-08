(deffacts initial-facts (animal y))

;=========================================== level 3 abstraction ======================================

(defrule is-multicellular
	?fact <- (animal y)
	=>
	(printout t "Is the organism multicellular? (y,n): ") 
    (assert (multicellular (read)))
    (retract ?fact)
)

(defrule warm-cold-blooded
	(multicellular y)
	=>
	(printout t "Is the animal warm-blooded or cold-blooded? (warm,cold): ") 
    (assert (blood-type (read)))
)

(defrule have-spine
	 ?fact <- (multicellular y)
	=>
	(printout t "Does the organism have a spine? (y,n): ") 
    (assert (spine (read)))
    (retract ?fact)
)

;=========================================== level 3 abstraction ======================================

;=========================================== level 2 abstraction ======================================

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
	(spine y)
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
	?fact3 <- (spine ?)
	?fact4 <- (scales y)
	=>
	(assert (fish y))
	(retract ?fact1)
	(retract ?fact2)
	(retract ?fact3)
	(retract ?fact4)
)

(defrule scaly-skin
	(blood-type cold)
	(spine y)
	=>
	(printout t "Does it have scaly skin? (y,n): ") 
    (assert (scaly-skin (read)))
)

(defrule born-on-land
	(scaly-skin y)
	=>
	(printout t "Was it born on land? (y,n): ") 
    (assert (born-on-land (read)))
)

(defrule is-reptile
	?fact1 <- (blood-type ?)
	?fact2 <- (scaly-skin ?)
	?fact3 <- (spine ?)
	?fact4 <- (born-on-land y)
	=>
	(assert (reptile y))
	(retract ?fact1)
	(retract ?fact2)
	(retract ?fact3)
	(retract ?fact4)
)

(defrule born-in-water
	(blood-type cold)
	(spine y)
	=>
	(printout t "Was it born in water? (y,n): ") 
    (assert (born-in-water (read)))
)

(defrule had-gills-now-lungs 
	(born-in-water y)
	=>
	(printout t "When born had gills and as adult now has lungs? (y,n): ") 
    (assert (gills-lungs (read)))
)

(defrule is-amphibian
	?fact1 <- (blood-type ?)
	?fact2 <- (born-in-water ?)
	?fact3 <- (spine ?)
	?fact4 <- (gills-lungs y)
	=>
	(assert (amphibian y))
	(retract ?fact1)
	(retract ?fact2)
	(retract ?fact3)
	(retract ?fact4)
)

(defrule is-arthropod
	?fact1 <- (blood-type cold)
	?fact2 <- (spine n)
	=>
	(assert (arthropod y))
	(retract ?fact1)
	(retract ?fact2)
)

;=========================================== level 2 abstraction ======================================

;=========================================== level 1 abstraction ======================================

(defrule is-social
	(mammal y)
	=>
	(printout t "Does this mammal make social hierarchies? (y,n): ") 
    (assert (social (read)))
)

(defrule lots-of-hair 
	(mammal y)
	=>
	(printout t "Does this mammal have a lot of hair on its body? (y,n): ") 
    (assert (hair (read)))
)

(defrule is-pet 
	(hair y)
	=>
	(printout t "Does this mammal is usually kept as a pet? (y,n): ") 
    (assert (pet (read)))
)

(defrule is-intelligent 
	(hair y)
	(pet y)
	=>
	(printout t "Is this mammal intelligent? (y,n): ") 
    (assert (intelligent (read)))
)

;=========================================== level 1 abstraction ======================================

;=========================================== level 0 abstraction ======================================

(defrule is-spider
	(arthropod y)
	=>
	(assert (answer spider))
)

(defrule is-frog
	(amphibian y)
	=>
	(assert (answer frog))
)

(defrule is-snake
	(reptile y)
	=>
	(assert (answer snake))
)

(defrule is-shark
	(fish y)
	=>
	(assert (answer shark))
)

(defrule is-human
	(social y)
	=>
	(assert (answer human))
)

(defrule is-elephant
	(hair n)
	=>
	(assert (answer elephant))
)

(defrule is-lion
	(hair y)
	=>
	(assert (answer lion))
)

(defrule is-eagle
	(bird y)
	=>
	(assert (answer eagle))
)

(defrule is-dog
	(pet y)
	(intelligent y)
	=>
	(assert (answer dog))
)

(defrule is-cat
	(pet y)
	(intelligent n)
	=>
	(assert (answer cat))
)

;=========================================== level 0 abstraction ======================================

;============================================= helper functions =======================================

(defrule print-answer
	(answer ?answer)
	=>
	(printout t "I found your animal! Its a " ?answer " !" crlf)
	(reset)
)

;============================================= helper functions =======================================
