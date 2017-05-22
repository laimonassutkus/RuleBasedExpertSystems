(deftemplate mouse (slot color) (slot amount))
(deftemplate cat (slot state) (slot mice_eaten) (slot starving_days))

(deffacts facts0
	(mouse (color "grey") (amount 5))
	(mouse (color "white") (amount 4))
	(cat (state "hungry") (mice_eaten 0) (starving_days 0))
)

(defrule r1 "When a cat is hungry it wants to eat."
	?fact_id0 <- (cat (state ?state))
	(test (eq ?state "hungry"))
	=>
	(modify ?fact_id0 (state "wants to eat"))
)

(defrule r2 "When a cat wants to eat and there is mice, it eats them."
	(declare (salience 1))
	?fact_id1 <- (cat (state "wants to eat") (mice_eaten ?mice_eaten))
	?fact_id2 <- (mouse (color ?color) (amount ?amount))
	(test (> ?amount 0))
	=>
	(modify ?fact_id1 (mice_eaten (+ ?mice_eaten 1)) (starving_days 0))
	(modify ?fact_id2 (amount (- ?amount 1)))
)

(defrule r3 "If a cat has eaten 5 mice, it goes to sleep."
	(declare (salience 2))
	?fact_id3 <- (cat (mice_eaten ?mice_eaten) (state ?state))
	(test (= ?mice_eaten 5))
	=>
	(modify ?fact_id3 (state "sleeping"))
)

(defrule r4 "If a cat is sleeping, it digests mice."
	(declare (salience 3))
	?fact_id4 <- (cat (state "sleeping") (mice_eaten ?mice_eaten))
	(test (> ?mice_eaten 0))
	=>
	(modify ?fact_id4 (mice_eaten (- ?mice_eaten 1)))
)

(defrule r5 "If a cat finished digesting mice, it wakes up and is hungry."
	?fact_id5 <- (cat (state "sleeping") (mice_eaten 0))
	=>
	(modify ?fact_id5 (state "hungry"))
)

(defrule r6 "When there is no mice and cat wants to eat, cat is starving."
	?fact_id6 <- (cat (state "wants to eat") (starving_days ?starving_days))
	?fact_id7 <- (mouse (amount 0))
	=>
	(modify ?fact_id6 (starving_days (+ ?starving_days 1)))
)

(defrule r7 "If a cat has been starving_days for 7 days, it dies."
	(declare (salience 1))
	?fact_id8 <- (cat (state "wants to eat") (starving_days 7))
	=>
	(modify ?fact_id8 (state "dead"))
)
