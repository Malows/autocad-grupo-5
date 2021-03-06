(defun c:esc2 ()
  (setq osmodo (getvar "osmode"))
  (setvar "osmode" 0)
  (file)
  (setq	altura (getreal	(strcat	"\nIngrese la altura del escalon...<" file_altura ">: "))
	ancho  (getreal	(strcat	"\nIngrese la ancho del escalon...<" file_ancho ">: "))
	gradas (getint "\nIngrese el numero de gradas del escalon...")
	p1     (getpoint "\nIngrese la base del escalon...")
  )
  (if (= nil altura)
    (setq altura (distof file_altura))
    (setq xx_altura (rtos altura))
  )
  (if (= nil ancho)
    (setq ancho (distof file_ancho))
    (setq xx_ancho (rtos ancho))
  )
  (repeat gradas
    (setq p2 (polar p1 (/ pi 2) altura)
	  p3 (polar p2 0 ancho)
    )
    (command "line" p1 p2 p3 "")
    (setq p1 p3)
  )
  (escriturafile)
  (setvar "osmode" osmodo)
)
;;;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
(defun file ()
  (setq	file1	    (open "d:/facultad/textos/esc.txt" "r")
	file_altura (read-line file1)
	file_ancho  (read-line file1)
  )
  (close file1)
)

;;;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
(defun escriturafile ()
  (setq	file1 (open "d:/facultad/textos/esc.txt" "w"))
	(write-line xx_altura file1)
	(write-line xx_ancho file1)
  
  (close file1)
)