# Datos del Usuario
class UserData:

    #Datos Personales
    def __init__(self, nombre, edad, sexo, altura, peso, porctj_grasa, cuerpo, etapa, tipo, frecuencia):
        self.nombre = nombre
        self.edad = edad
        self.sexo = sexo
        self.altura = altura
        self.peso = peso
        self.porctj_grasa = porctj_grasa
        self.cuerpo = cuerpo
        self.etapa = etapa
        self.tipo = tipo
        self.frecuencia = frecuencia

# Calculos Cientificos / Metabolicos
class MetabolicCalculate:
    # Calculo TMB
    def tmb_calculate(self, nombre, sexo, peso, altura, edad):

        if sexo == "Hombre":
            tmb = (10 * peso) + (6.25 * altura) - (5 * edad) + 5
        else:
            tmb = (10 * peso) + (6.25 * altura) - (5 * edad) - 161
        
        print(f"El TMB de {nombre} es de {tmb:.1f}")
        return tmb

    # Calculo TDEE
    def tdee_calculate(self, nombre, frecuencia, tmb_usuario):
        if frecuencia == 0:
            factor_actividad = 1.2
            print("Nivel de Actividad Sedentario")
    
        elif frecuencia <= 2:
            factor_actividad = 1.375
            print("Nivel de Actividad Moderado Bajo")
    
        elif frecuencia <= 4:
            factor_actividad = 1.55
            print("Nivel de Actividad Moderado Medio")
    
        elif frecuencia <= 6:
            factor_actividad = 1.725
            print("Nivel de Actividad Moderado Alto")
    
        else:
            factor_actividad = 1.9
            print("Nivel de Actividad Atleta Profesional")

        tdee = tmb_usuario * factor_actividad
        print(f"El TDEE de {nombre} segun su factor de actividad {factor_actividad:.1f} por los dias que entrena {frecuencia} es de {tdee:.1f}")
        return tdee

# Calculo Nutricional obtencion de Ingesta
class NutritionalCalculate:
    def ingest_calculate(self, tdee_usuario, fase_entrenamiento, peso):
        if fase_entrenamiento == "Volumen":
        
            calorias_objetivo = tdee_usuario + 300

            gramos_proteina = 2
            consumo_proteina = gramos_proteina * peso
            kcal_proteina = consumo_proteina * 4

            gramos_grasas = 0.25
            kcal_grasas = calorias_objetivo * gramos_grasas
            consumo_grasas = kcal_grasas / 9

            kcal_carbohidratos = calorias_objetivo - (kcal_proteina + kcal_grasas)
            consumo_carbohidratos = kcal_carbohidratos / 4

        elif fase_entrenamiento == "Definicion":
        
            calorias_objetivo = tdee_usuario - 500
    
            gramos_proteina = 2.3
            consumo_proteina = gramos_proteina * peso
            kcal_proteina = consumo_proteina * 4
    
            gramos_grasas = 0.22
            kcal_grasas = calorias_objetivo * gramos_grasas
            consumo_grasas = kcal_grasas / 9
    
            kcal_carbohidratos = calorias_objetivo - (kcal_proteina + kcal_grasas)
            consumo_carbohidratos = kcal_carbohidratos / 4

        elif fase_entrenamiento == "Perdida de Peso":
        
            calorias_objetivo = tdee_usuario - 250

            gramos_proteina = 2.2
            consumo_proteina = gramos_proteina * peso
            kcal_proteina = consumo_proteina * 4

            gramos_grasas = 0.25
            kcal_grasas = calorias_objetivo * gramos_grasas
            consumo_grasas = kcal_grasas / 9
    
            kcal_carbohidratos = calorias_objetivo - (kcal_proteina + kcal_grasas)
            consumo_carbohidratos = kcal_carbohidratos / 4

        elif fase_entrenamiento == "Mantenimiento":
        
            calorias_objetivo = tdee_usuario * 1

            gramos_proteina = 1.8
            consumo_proteina = gramos_proteina * peso
            kcal_proteina = consumo_proteina * 4

            gramos_grasas = 0.25
            kcal_grasas = calorias_objetivo * gramos_grasas
            consumo_grasas = kcal_grasas / 9

            kcal_carbohidratos = calorias_objetivo - (kcal_proteina + kcal_grasas)
            consumo_carbohidratos = kcal_carbohidratos / 4

        self.consumo_agua = peso * 35
        self.ingesta_total = kcal_proteina + kcal_carbohidratos + kcal_grasas

        #Mostramos Consumo de Macros y Agua
        print("Ingesta a Consumir")
        print(f"El total de Kcal a consumir son: {self.ingesta_total:.1f}")
        print(f"Total de Proteina a consumor: {consumo_proteina:.1f}")
        print(f"Total de Carbohidratos a consumor: {consumo_carbohidratos:.1f}")
        print(f"Total de Grasas a consumor: {consumo_grasas:.1f}")
        print(f"Total de Agua a consumor: {self.consumo_agua:.1f}")

        return self.consumo_agua, self.ingesta_total

# Usuario ingresa sus datos
#Recopilamos Datos Personales del Usuario
nombre_usuario = input("¿Cual es su Nombe?: ")
edad_usuario = int(input("¿Cuantos Años tiene?: "))
sexo_usuario = input("Indique su Sexo (Hombre | Mujer): ")

#Se analiza Condicion Fisica del Usuario
altura_usuario = float(input("Indique su Altura en CM: "))
peso_usuario = float(input("Indique su Peso en KG: "))
porcentaje_grasa = float(input("Cual es el porcentaje de Grasa que tiene: "))
tipo_cuerpo = input("Indique el Tipo de Cuerpo que tiene (Ectomorfo | Mesomorfo | Endomorfo): ")

#Consultamos la Fase de Entrenamiento en la que esta
etapa_entrenamiento = input("¿En que Etapa de Entrenamiento esta? (Volumen | Definicion | Perdida de Peso | Mantenimiento): ")
tipo_entrenamiento = input("¿Que Tipo de Entrenamiento realiza? (Fuerza | HIIT | Cardiovascular): ")
frecuencia_semanal = int(input("¿Cuantos Dias a la Semana entrena?: "))

# Guardamos datos de Registro e Ingresados por el Usuario
miUsuario = UserData(nombre_usuario, edad_usuario, sexo_usuario, altura_usuario, peso_usuario, porcentaje_grasa, tipo_cuerpo, etapa_entrenamiento, tipo_entrenamiento, frecuencia_semanal)

#Llamar funciones para calcular TMB y TDEE
calculosMetabolicos = MetabolicCalculate()
miTMB = calculosMetabolicos.tmb_calculate(nombre_usuario, sexo_usuario, peso_usuario, altura_usuario, edad_usuario)
miTDEE = calculosMetabolicos.tdee_calculate(nombre_usuario, frecuencia_semanal, miTMB)

#Llamar a clase para Obtener Ingesta Calorica
calculosIngesta = NutritionalCalculate()
miIngesta = calculosIngesta.ingest_calculate(miTDEE, etapa_entrenamiento, peso_usuario)