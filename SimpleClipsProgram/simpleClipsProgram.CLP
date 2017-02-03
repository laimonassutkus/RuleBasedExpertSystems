; define a template
(deftemplate person
	(slot name)
	(slot age)
)

; define facts
(deffacts person_facts
	(person (name "Tom") (age 10))
	(person (name "Annie") (age 15))
	(person (name "Dan") (age 20))
)

; define rules
(defrule r1 "If a person is under 12, he wants to go to a circus."
	?fact_id0 <- (person (age ?age) (name ?name))
	(test (< ?age 12))
	=>
	(modify ?fact_id0 (age (+ ?age 1)))
	(printout t "I am " ?name " and I want to go to circus." crlf)
)

; define rules
(defrule r2 "If a person's name is shorter than 6 characters - it is a short name."
	?fact_id1 <- (person (age ?age) (name ?name))
	(test (< (str-length ?name) 6))
	=>
	(printout t "I am " ?name " and my name is short." crlf)
)