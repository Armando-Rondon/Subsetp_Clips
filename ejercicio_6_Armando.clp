(deftemplate lista
    (multifield nombre)
    (multifield campos)
)

(defrule subset
    (lista
        (nombre ?nombre1)
        (campos $?campos1)
    )
    (lista
        (nombre ?nombre2 & ~nombre1)
        (campos $?campos2 & ~$?campos1)
    )
   ;?campos1 <- (lista ($?campos))
   ;?campos2 <- (lista ($?campos))
    (test(subsetp $?campos1 $?campos2))
=>
    (printout t "La lista: "  $?nombre1 " esta dentro de lista : " $?nombre2 crlf)

)