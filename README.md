# iOSZeus

## Descripción tecnica
Aruitectura Viper (Algunos modulos no requieren todos los componentes de viper), con factories para inicializar los modulos. 76% de coverage en testing 🚀 (Por tiempo ya no se alcanzo el 90%) 


Estructura de Folder:

    - APP
        - CompositionRoot (Inicialiazcion de modulos por inyección de dependencias)
        - Commom
        - Modules
            - SeeSelfie
            - CharInfo
            - Camera
            - Home

+ Gestor de paquets: Swift Package Manager


## Tareas
1. Crear una tabla con diferentes tipos de celdas donde:
    
   + a. La primera celda tiene un TextField y solo permite caracteres alfabéticos. ✅
   
   ![simulator_screenshot_A743C48A-23BE-4D35-B268-77713B4322EB](https://user-images.githubusercontent.com/39851501/182037202-be175ef2-ccd1-4d8f-9cbd-cf9a08e3fc95.png)


   + b. La segunda celda pedirá un selfie al usuario, al seleccionar la celda se mostrará un popup mostrando la opción de visualizar o retomar la foto. ✅
 
![WhatsApp Image 2022-07-31 at 11 00 46 AM](https://user-images.githubusercontent.com/39851501/182037301-0b53373e-0187-4471-ad3a-7608cbe7cb02.jpeg)

   + c. La tercer celda mostrar el siguiente text: “Una gráfica o representación gráfica es un tipo de representación de datos, generalmente numéricos, mediante recursos visuales (líneas, vectores, superficies o símbolos), para que se manifieste visualmente la relación matemática o correlación estadística que guardan entre sí. También es el nombre de un conjunto de puntos que se plasman en coordenadas cartesianas y sirven para analizar el comportamiento de un proceso o un conjunto de elementos o signos que permiten la interpretación de un fenómeno. La representación gráfica permite establecer valores que no se han obtenido experimentalmente sino mediante la interpolación (lectura entre puntos) y la extrapolación (valores fuera del intervalo experimental). ”. Al seleccionar la celda, debe mostrar el punto 3 del ejercicio. ✅

2. Consumir el siguiente servicio creando los modelos correspondientes al json de respuesta.
https://s3.amazonaws.com/dev.structure.files/examen/ios/test.json
✅



3. Crear una tabla dinámica a partir de la respuesta(response) ✅
![simulator_screenshot_65E009D9-2768-43F2-8AE1-1A21C4B3C738](https://user-images.githubusercontent.com/39851501/182037322-f44ac1a4-d43c-4281-ac8c-b30cd9f7f7c4.png)

4. Crear un proyecto en firebase para consultar la Data Base Real Time y poder manipular el color de fondo de las pantallas de la aplicación en tiempo real. ✅
![simulator_screenshot_74B9DA6C-7E8C-46E5-9C2D-127F7BBC3EA7](https://user-images.githubusercontent.com/39851501/182037331-3fc1cfd2-e383-4ed2-948e-c41b24119829.png)

5. Crear un botón de enviar al final de la tabla que envie la foto tomada en el punto 1 a googleStorage (firestoreStorage) con el nombre del usuario. ✅
