(deftemplate mouse (slot color) (slot amount))
(deftemplate cat (slot state) (slot mice_eaten))

(deffacts facts0
	(mouse (color "grey") (amount 5))
	(mouse (color "white") (amount 4))
	(cat (state "hungry") (mice_eaten 0))
)

(defrule r1 "When a cat is hungry it wants to eat."
	?fact_id0 <- (cat (state ?state))
	(test (eq ?state "hungry"))
	=>
	(modify ?fact_id0 (state "wants to eat"))
)

(defrule r2 "When a cat wants to eat and there is mice, it eats them."
	?fact_id1 <- (cat (state "wants to eat") (mice_eaten ?mice_eaten))
	?fact_id2 <- (mouse (color ?color) (amount ?amount))
	(test (> ?amount 0))
	=>
	(modify ?fact_id1 (mice_eaten (+ ?mice_eaten 1)))
	(modify ?fact_id2 (amount (- ?amount 1)))
)