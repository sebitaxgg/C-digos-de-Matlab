# Códigos-de-Matlab
# Este texto explica los distintos códigos utilizados en el TFG para el estudio del modelo de Bose-Hubbard
- Base: Calcula la base |n1,n2,n3> del modelo
- Basesim: Calcula la base de autoestados de R, expresión 7 del TFG.
- Energía: Calcula la matriz del Hamilatoniano en la base canónica y las energías
- Energíasim: Calcula la matriz H en la base de rotación, separando el espectro en los 3 diferentes sectores y calculando las matrices de cambio de base entre la base de R y la de R y H.
- Corrientereflex: Calcula el parámetro de orden O_{ref}, expresión 20 del TFG.
- Vcambiobase Calcula la matriz de cambio de base entre la base canónica y la de autoestados canónica.
- Matriz_Ni_auto: Calcula las matricesde N_i en la base de autoestados de H
- Cambioatrio: Calcula la matriz de cambio de base entre la base canónica y de rotación.
- Matriz_Ni_autotrios: Calcula las matricesde N_i en la base de autoestados de H y R
- EstadoCoherente: Función que dadas unas condiciones iniciales calculalos coeficientes del estado coherente en la base canónica.
- Coherente: Calcula la evolución temporal de 6 estados coherente X1,...,X6 además de los parámetros de orden.
- Coherentebucle: Realiza lo mismo que Coherente pero introduciendo los parámetros en una matriz, pudiendo hacer muchos más casos.
- densidad: Calcula el estado de equilibrio rho_eq, y los valores de equilibrio de N_i y de la corriente de reflexión.
- Diagrama: Dibuja un histograma de los ratios del espectro escogido en una zona del intervalo que se busque estudiar.
- Distribucionparesytrios: Calcula la distancia de las energías a un triplete y doblete.
- Encontrar_roto: Caclula estados coherente a partir de variables aleatorias que cumplan ciertas condiciones de energía
- SimP: Me divide el sector \alpha = 1 de rotación en los dos subespectros del operador de reflexión.

Modo de proceder para calcular evolución temporal
Definir N->Base->Energia->Corrientereflex->Vcambiobase->Matriz_Ni_auto->Elegir condiciones iniciales o usar Encontrar_roto->Coherente o Coherentebucle
Modo de proceder para calcular el estado de equilibrio
Definir N no múltiplo de 3->Base->Basesim->Energia->Energiasim->Corrientereflex->Cambioatrio->Matriz_Ni_autotrios->densidad
Si quieres comparar el estado de equilibrio con la evolución temporal como en el TFG, es necesario realizar los dos.
