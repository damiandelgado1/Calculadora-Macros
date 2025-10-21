//Datos de la Persona
Funcion datapersona=datospersona(nombre, edad, sexo)
	
	//Se ingresan datos personales de la persona
	Escribir "Ingrese su Nombre: "; Leer nombre
	Escribir "¿Cuantos años tiene? "; Leer edad
	Escribir "Indique su Sexo: (Hombre | Mujer) "; Leer sexo
FinFuncion

//Analizar Condicion Fisica
Funcion physical=condicion_fisica(altura, peso, tipo_cuerpo, porcentaje_grasa)
	
	//Se consulta su condicion fisica actual
	Escribir "Indique su Altura en metros: "; Leer altura
	Escribir "Indique su Peso en Kilogramos"; Leer peso
	Escribir "Indique su Tipo de Cuerpo: (Ectomorfo | Endoformo | Mesomorfo)"; Leer tipo_cuerpo
	Escribir "¿Cuanto % de Grasa tiene? "; Leer porcentaje_grasa
FinFuncion

//Consultar Fase de Entrenamiento
Funcion workout=entrenamiento(etapa_entrenamiento, frecuencia_semanal, tipo_entrenamiento)
	
	//La persona indica su Fase de entrenamiento
	Escribir "¿En que Etapa de Entrenamiento esta?: (Volumen | Definicion | Perdida de Peso | Recomposicion Corporal) "; Leer etapa_entrenamiento
	Escribir "¿Cuantos Dias a la semana entrena?: "; Leer frecuencia_semanal
	Escribir "Indique el Tipo de Entrenamiento a realizar: (Fuerza | HIIT | Cardiovascular/Rendimiento) "; Leer tipo_entrenamiento
FinFuncion

Algoritmo CalculadoradeMacros
	Definir nombre, sexo, tipo_cuerpo, etapa_entrenamiento, tipo_entrenamiento Como Texto
	Definir edad, frecuencia_semanal Como Entero
	Definir altura, peso, porcentaje_grasa Como Real
	Definir factor_actividad, tmb, tdee, consumo_proteina, consumo_carbohidratos, calorias_objetivo, ingesta_total Como Real
	Definir gramos_carbohidratos, gramos_grasas, gramos_proteina, kcal_carbohidratos, kcal_proteina, kcal_grasas Como Real
	
	//Se consultan datos de la persona
	persona=datospersona(nombre, edad, sexo)
	
	//La persona indica su condicion fisica
	fisico=condicion_fisica(altura, peso, tipo_cuerpo, procentaje_grasa)
	
	//La persona indica la fase de entrenamiento
	training=entrenamiento(etapaentrenamoiento, frecuenciasemanal, tipoentrenamiento)
	
	//Segun el Sexo del Usuario, se realiza el calculo TMB (Tasa Metabolica Basal) y TDEE (Gasto Energetico Total diario)
	Segun sexo Hacer
		caso "Hombre":
			//Si el usuario es Hombre se calcula su TMB
			tmb = (10 * peso) + (6.25 * altura) + (5 * edad) - 5
			Escribir "La ingesta calorica base del Hombre a consumir es", tmb
			
		caso "Mujer":
			//Si el usuario es Mujer se calcula su TMB y TDEE
			tmb = (10 * peso) + (6.25 * altura) - (5 * edad) - 161
			Escribir "La ingesta calorica base de la Mujer a consumir es", tmb
	FinSegun
	
	//Se calcula el FA (Factor de Actividad Fisica)
	Si frecuencia_semanal == 0 Entonces
		factor_actividad = 1.2
		Escribir "Nivel Sedentario"
	SiNo Si frecuencia_semanal <= 2 Entonces
			factor_actividad = 1.375
			Escribir "Nivel Moderado bajo"
	SiNo Si frecuencia_semanal <= 4 Entonces
			factor_actividad = 1.55
			Escribir "Nivel Moderado medio"
	SiNo Si frecuencia_semanal <= 6 Entonces
			factor_actividad = 1.725
			Escribir "Nivel Moderado alto"
	SiNo
		factor_actividad = 1.9
		Escribir "Nivel Atleta profesional"
	FinSi	
	FinSi	
	FinSi
	FinSi
	
	//Calcular TDEE (Gasto Energetico Total Diario)
	tdee = tmb * factor_actividad
	Escribir "La ingesta calorica a consumir del usuario base + su entrenamiento es", tdee
	
	//Segun Etapa de Entrenamiento se calculan Gramos de Macrosnutrientes a consumir
	Segun etapa_entrenamiento Hacer
		caso "Volumen":
			calorias_objetivo = tdee + 300
			
			gramos_proteina = 2.2
			consumo_proteina = gramos_proteina * peso
			kcal_proteina = consumo_proteina * 4
			
			kcal_grasas = calorias_objetivo * porcentaje_grasa
			gramos_grasas = kcal_grasas / 9
			
			kcal_carbohidratos = calorias_objetivo - kcal_proteina - kcal_grasas
			consumo_carbohidratos = kcal_carbohidratos / 4
			
		caso "Definicion":
			calorias_objetivo = tdee - 500
			
			gramos_proteina = 2
			consumo_proteina = gramos_proteina * peso
			kcal_proteina = consumo_proteina * 4
			
			kcal_grasas = calorias_objetivo * porcentaje_grasa
			gramos_grasas = kcal_grasas / 9
			
			kcal_carbohidratos = calorias_objetivo - kcal_proteina - kcal_grasas
			consumo_carbohidratos = kcal_carbohidratos / 4
			
		caso "Perdida de Peso":
			calorias_objetivo = tdee - 200
			
			gramos_proteina = 2.4
			consumo_proteina = gramos_proteina * peso
			kcal_proteina = consumo_proteina * 4
			
			kcal_grasas = calorias_objetivo * porcentaje_grasa
			gramos_grasas = kcal_grasas / 9
			
			kcal_carbohidratos = calorias_objetivo - kcal_proteina - kcal_grasas
			consumo_carbohidratos = kcal_carbohidratos / 4
			
		caso "Recomposicion corporal":
			calorias_objetivo = tdee * 1
			
			gramos_proteina = 1.4
			consumo_proteina = gramos_proteina * peso
			kcal_proteina = consumo_proteina * 4
			
			kcal_grasas = calorias_objetivo * porcentaje_grasa
			gramos_grasas = kcal_grasas / 9
			
			kcal_carbohidratos = calorias_objetivo - kcal_proteina - kcal_grasas
			consumo_carbohidratos = kcal_carbohidratos / 4
	FinSegun
	
	//Mostramos la Ingesta de Macros y Kcal a consumir
	ingesta_total = kcal_carbohidratos + kcal_grasas + kcal_proteina
	Escribir "La ingesta calorica del usuario a consumir es ", ingesta_total
	Escribir "Ingesta a consumir de Proteina ", kcal_proteina
	Escribir "Ingesta a consumir de Carbohidratos ", kcal_carbohidratos
	Escribir "Ingesta a consumir de Grasas ", kcal_grasas
FinAlgoritmo