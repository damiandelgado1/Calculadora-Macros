//Datos de la Persona
Funcion datapersona=datospersona(nombre, edad, sexo)
	
	//Se ingresan datos personales de la persona
	Escribir "Ingrese su Nombre: "; Leer nombre
	Escribir "¿Cuantos años tiene? "; Leer edad
	Escribir "Indique su Sexo: (Hombre | Mujer) "; Leer sexo
FinFuncion

//Analizar Condicion Fisica
Funcion physical=condicionfisica(altura, peso, tipocuerpo, porcentajegrasa)
	
	//Se consulta su condicion fisica actual
	Escribir "Indique su Altura en metros: "; Leer altura
	Escribir "Indique su Peso en Kilogramos"; Leer peso
	Escribir "Indique su Tipo de Cuerpo: (Ectomorfo | Endoformo | Mesomorfo)"; Leer tipocuerpo
	Escribir "¿Cuanto % de Grasa tiene? "; Leer porcentajegrasa
FinFuncion

//Consultar Fase de Entrenamiento
Funcion workout=entrenamiento(etapaentrenamiento, frecuenciasemanal, tipoentrenamiento)
	
	//La persona indica su Fase de entrenamiento
	Escribir "¿En que Etapa de Entrenamiento esta?: (Volumen | Definicion | Quema de Grasa | Recomposicion Corporal) "; Leer etapaentrenamiento
	Escribir "¿Cuantos Dias a la semana entrena?: "; Leer frecuenciasemanal
	Escribir "Indique el Tipo de Entrenamiento a realizar: (Fuerza | HIIT | Cardiovascular/Rendimiento) "; Leer tipoentrenamiento
FinFuncion

Algoritmo CalculadoradeMacros
	Definir nombre, sexo, tipocuerpo, etapaentrenamiento, tipoentrenamiento Como Texto
	Definir edad, frecuenciasemanal Como Entero
	Definir altura, peso, porcentajegrasa Como Real
	
	//Se consultan datos de la persona
	persona=datospersona(nombre, edad, sexo)
	
	//La persona indica su condicion fisica
	fisico=condicionfisica(altura, peso, tipocuerpo, procentajegrasa)
	
	//La persona indica la fase de entrenamiento
	training=entrenamiento(etapaentrenamoiento, frecuenciasemanal, tipoentrenamiento)
FinAlgoritmo