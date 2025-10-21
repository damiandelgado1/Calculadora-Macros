//Segun datos del Usuario se obtiene el TMB
Función tmb = calcular_tmb(sexo, peso, altura, edad)
	Definir tmb Como Real
	
	Si sexo == "Hombre" Entonces
		tmb = (10 * peso) + (6.25 * altura) - (5 * edad) - 5
	SiNo
		tmb = (10 * peso) + (6.25 * altura) - (5 * edad) - 161
	FinSi
	
	Escribir "El TMB del/la ", sexo," es de ", tmb
FinFuncion

//Calcular TDEE segun Frecuencia Entrenamiento y TMB
Funcion tdee = calcular_tdee (frecuencia_semanal, mi_tmb, sexo)	
	Definir tdee, factor_actividad Como Real
	
	Si frecuencia_semanal == 0 Entonces
		factor_actividad = 1.2
		Escribir "Nivel de Actividad Sedentario"
		
	SiNo Si frecuencia_semanal <= 2 Entonces
		factor_actividad = 1.375
		Escribir "Nivel de Actividad Moderado Bajo"
		
	SiNo Si frecuencia_semanal <= 4 Entonces
		factor_actividad = 1.55
		Escribir "Nivel de Actividad Moderado Medio"
	SiNo Si frecuencia_semanal <= 6 Entonces
		factor_actividad = 1.725
		Escribir "Nivel de Actividad Moderado Alto"
	SiNo
		factor_actividad = 1.9
		Escribir "Nivel de Actividad Atleta Profesional"
	FinSi
	FinSi
	FinSi
	FinSi
	
	tdee = mi_tmb * factor_actividad
	Escribir "El TDEE del/la ", sexo, " segun su factor actividad ", factor_actividad, " por los dias que entrena ", frecuencia_semanal, " son ", tdee
FinFuncion

//Se Calcula y Obtienen los Gramos de Macros segun Objetivo
Funcion ingesta_total = calcular_ingesta (mi_tdee, etapa_entrenamiento, peso)
	Definir calorias_objetivo, ingesta_total, consumo_agua Como Real
	Definir gramos_proteina, gramos_carbohidratos, gramos_grasas, consumo_proteina, consumo_carbohidratos, consumo_grasas, kcal_proteina, kcal_carbohidratos, kcal_grasas Como Real
	
	Segun etapa_entrenamiento Hacer
		Caso "Volumen":
			calorias_objetivo = mi_tdee + 300
			
			gramos_proteina = 2
			consumo_proteina = gramos_proteina * peso
			kcal_proteina = consumo_proteina * 4
			
			gramos_grasa = 0.25
			kcal_grasas = calorias_objetivo * gramos_grasa
			consumo_grasas = kcal_grasas / 9
			
			kcal_carbohidratos = calorias_objetivo - (kcal_proteina + kcal_grasas)
			consumo_carbohidratos = kcal_carbohidratos / 4
			
		Caso "Definicion":
			calorias_objetivo = tdee - 500
			
			gramos_proteina = 2.3
			consumo_proteina = gramos_proteina * peso
			kcal_proteina = consumo_proteina * 4
			
			gramos_grasa = 0.22
			kcal_grasas = calorias_objetivo * gramos_grasa
			consumo_grasas = kcal_grasas / 9
			
			kcal_carbohidratos = calorias_objetivo - (kcal_proteina + kcal_grasas)
			consumo_carbohidratos = kcal_carbohidratos / 4
			
		Caso "Perdida de Peso":
			calorias_objetivo = tdee - 250
			
			gramos_proteina = 2.2
			consumo_proteina = gramos_proteina * peso
			kcal_proteina = consumo_proteina * 4
			
			gramos_grasa = 0.25
			kcal_grasas = calorias_objetivo * gramos_grasa
			gramos_grasas = kcal_grasas / 9
			
			kcal_carbohidratos = calorias_objetivo - (kcal_proteina + kcal_grasas)
			consumo_carbohidratos = kcal_carbohidratos / 4
			
		Caso "Mantenimiento":
			calorias_objetivo = tdee * 1
			
			gramos_proteina = 1.8
			consumo_proteina = gramos_proteina * peso
			kcal_proteina = consumo_proteina * 4
			
			gramos_grasa = 0.25
			kcal_grasas = calorias_objetivo * porcentaje_grasa
			consumo_grasas = kcal_grasas / 9
			
			kcal_carbohidratos = calorias_objetivo - (kcal_proteina + kcal_grasas)
			consumo_carbohidratos = kcal_carbohidratos / 4
	FinSegun
	
	consumo_agua = peso * 35
	
	ingesta_total = kcal_proteinas + kcal_carbohidratos + kcal_grasas
	Escribir "El total de kcal a consumir son ", ingesta_total
	Escribir "Total de Proteina a consumir ", consumo_proteina
	Escribir "Total de Carbohidratos a consumir ", consumo_carbohidratos
	Escribir "Total de Grasas a consumir ", consumo_grasas
	Escribir "Consumo de Agua ", consumo_agua
FinFuncion

Algoritmo CalculadoradeMacros
	Definir nombre, sexo, tipo_cuerpo, etapa_entrenamiento, tipo_entrenamiento Como Cadena
	Definir edad, frecuencia_semanal Como Entero
	Definir altura, peso, porcentaje_grasa Como Real
	Definir factor_actividad, tmb, mi_tmb, tdee, mi_tdee, ingesta_total, mi_ingesta Como Real
	
	//Recopilacion de Datos del Usuario
	Escribir "¿Cual es su Nombre? "; Leer nombre
	Escribir "¿Cuantos años tiene? "; Leer edad
	Escribir "Indique su Sexo (Hombre | Mujer)"; Leer sexo
	
	//Se analiza la Condicion de Fisica del Usuario
	Escribir "Indique su altura en cm "; Leer altura
	Escribir "Indique su Peso en Kg "; Leer peso
	Escribir "¿Cual es su % de Grasa? "; Leer porcentaje_grasa
	Escribir "¿Que tipo de Cuerpo tiene? (Ectomorfo | Mesomorfo | Endomorfo)"; Leer tipo_cuerpo
	
	//Consultamos la Fase de Entrenamiento en la que esta
	Escribir "¿En que etapa de entrenamiento esta? (Volumen | Definicion | Perdida de Peso | Mantenimiento)"; Leer etapa_entrenamiento
	Escribir "¿Que tipo de Entrenamiento realiza? (Fuerza | HIIT | Cardiovascular) "; Leer tipo_entrenamiento
	Escribir "¿Cuantos dias a la semana entrena? "; Leer frecuencia_semanal
	
	mi_tmb = calcular_tmb(sexo, peso, altura, edad)
	mi_tdee = calcular_tdee(frecuencia_semanal, mi_tmb, sexo)
	mi_ingesta = calcular_ingesta(mi_tdee, etapa_entrenamiento, peso)
FinAlgoritmo