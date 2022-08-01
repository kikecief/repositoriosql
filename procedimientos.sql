DROP DATABASE IF EXISTS TEST;
CREATE DATABASE TEST;
USE TEST;

DROP PROCEDURE IF EXISTS CONDICIONAL_1()
DELIMITER $$
CREATE PROCEDURE CONDICIONAL_1(IN EDAD INT)
BEGIN
    IF EDAD < 18 THEN
		SELECT "Eren menor de edad";
	ELSE
		SELECT "Eres mayor de edad";
	END IF;
END $$
DELIMITER ;

CALL CONDICIONAL_1(17);

DROP PROCEDURE IF EXISTS CONDICIONAL_2()
DELIMITER $$
CREATE PROCEDURE CONDICIONAL_2(in color VARCHAR(10))
BEGIN
    CASE color
		WHEN "rojo" THEN
			SELECT "No puedes pasar";
		WHEN "rojo" THEN
			SELECT "Pasa con precaucion";
		WHEN "rojo" THEN
			SELECT "Puedes pasar";
		else
			SELECT "No conozco";
	END CASE;
END $$
DELIMITER ;

CALL CONDICIONAL_2("rojo");