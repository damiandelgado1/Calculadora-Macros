#Segun Datos del Usuario se Obtiene el TMB
def calcular_tmb(sexo, peso, altura, edad):

    if sexo == "Hombre":
        tmb = (10 * peso) + (6.25 * altura) - (5 * edad) - 5
    else:
        tmb = (10 * peso) + (6.25 * altura) - (5 * edad) - 5
    
    print(f"El TMB del/la {sexo} es de {tmb:.1f}")

    return tmb

#Calcular TDEE segun Frecuencia Semanal / Factor Actividad y TMB
def calcular_tdee(frecuencia, tmb_usuario, sexo):
    
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

    print(f"El TDEE del/la {sexo} segun su factor de actividad {factor_actividad:.1f} por los dias que entrena {frecuencia} es de {tdee:.1f}")

    return tdee

#Se Calcula y Obtiene los Gramos de Macros segun Objetivo y Litros de Agua
def calcular_ingesta(tdee_usuario, fase_entrenamiento, peso):

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
    
        calorias_objetivo = mi_tdee - 500
    
        gramos_proteina = 2.3
        consumo_proteina = gramos_proteina * peso
        kcal_proteina = consumo_proteina * 4
    
        gramos_grasas = 0.22
        kcal_grasas = calorias_objetivo * gramos_grasas
        consumo_grasas = kcal_grasas / 9
    
        kcal_carbohidratos = calorias_objetivo - (kcal_proteina + kcal_grasas)
        consumo_carbohidratos = kcal_carbohidratos / 4

    elif fase_entrenamiento == "Perdida de Peso":
    
        calorias_objetivo = mi_tdee - 250
    
        gramos_proteina = 2.2
        consumo_proteina = gramos_proteina * peso
        kcal_proteina = consumo_proteina * 4
    
        gramos_grasas = 0.25
        kcal_grasas = calorias_objetivo * gramos_grasas
        consumo_grasas = kcal_grasas / 9
    
        kcal_carbohidratos = calorias_objetivo - (kcal_proteina + kcal_grasas)
        consumo_carbohidratos = kcal_carbohidratos / 4

    elif fase_entrenamiento == "Mantenimiento":
    
        calorias_objetivo = mi_tdee * 1

        gramos_proteina = 1.8
        consumo_proteina = gramos_proteina * peso
        kcal_proteina = consumo_proteina * 4

        gramos_grasas = 0.25
        kcal_grasas = calorias_objetivo * gramos_grasas
        consumo_grasas = kcal_grasas / 9

        kcal_carbohidratos = calorias_objetivo - (kcal_proteina + kcal_grasas)
        consumo_carbohidratos = kcal_carbohidratos / 4

    consumo_agua = peso * 35
    ingesta_total = kcal_proteina + kcal_carbohidratos + kcal_grasas

    #Mostramos Consumo de Macros y Agua
    print(f"El total de Kcal a consumir son: {ingesta_total:.1f}")
    print(f"Total de Proteina a consumor: {consumo_proteina:.1f}")
    print(f"Total de Carbohidratos a consumor: {consumo_carbohidratos:.1f}")
    print(f"Total de Grasas a consumor: {consumo_grasas:.1f}")
    print(f"Total de Agua a consumor: {consumo_agua:.1f}")

    return consumo_agua, ingesta_total

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

#Llamar funciones para calcular TMB, TDEE e Ingesta
mi_tmb = calcular_tmb(sexo_usuario, peso_usuario, altura_usuario, edad_usuario)
mi_tdee = calcular_tdee(frecuencia_semanal, mi_tmb, sexo_usuario)
mi_ingesta = calcular_ingesta(mi_tdee, etapa_entrenamiento, peso_usuario)

#Lista con Alimentos segun Macros y gramos de dichos Macros en cada alimento
Proteinas = [("Pescado", 19.2), ("Huevo", 13), ("Pollo", 32.8), ("Costilla", 20), ("Leche", 3.3), ("Lomo de Cerdo", 22.2), ("Lata de Atun", 25.7)]

Carbohidratos = [("Pan", 58.6), ("Arroz", 28), ("Fideos", 30.9), ("Leche", 4.8), ("Avena", 66.3)]

Grasas = [("Palta", 15), ("Almendras", 50), ("Aceite", 100), ("Mantequilla", 81)]

print("Alimentos recomendados a Consumir segun Macros")
print("Proteinas", Proteinas)
print("Carbohidratos", Carbohidratos)
print("Grasas", Grasas)