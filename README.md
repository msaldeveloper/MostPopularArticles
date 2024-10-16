# MostPopularArticles

Este proyecto es una aplicación de iOS que muestra los artículos más populares del New York Times utilizando la API de "Most Popular Articles". La aplicación permite visualizar los artículos más enviados, vistos y compartidos, y permite al usuario marcar artículos como favoritos para acceder a ellos rápidamente.

## Características

- Mostrar artículos más populares del New York Times en diferentes categorías (enviados, vistos, compartidos).
- Ver artículos según el período (1, 7 o 30 días).
- Guardar y gestionar artículos favoritos.
- Actualización en tiempo real de la lista de favoritos.
- Manejo de errores para la carga de datos y la conexión de red.

## Requisitos

- iOS 13.0 o superior
- Swift 5.0 o superior
- Xcode 12 o superior

## Instalación

1. Clona este repositorio en tu máquina local:
   ```bash
   git clone https://github.com/tu-usuario/mostPopularArticles.git
   ```

2. Abre el archivo `mostPopularArticles.xcodeproj` en Xcode.

3. Configura el proyecto con tu propia clave de la API del New York Times:
   - Regístrate en [New York Times Developer](https://developer.nytimes.com/) para obtener una API Key.
   - Sustituye la clave en el archivo `ServiceUrl`:
     ```swift
     case apiKey = "TU_API_KEY"
     ```

4. Ejecuta la aplicación en el simulador o en un dispositivo físico.

## Uso

1. La pantalla principal muestra las categorías de artículos populares: enviados, vistos y compartidos.

2. Selecciona un período (1, 7 o 30 días) para ver los artículos más populares en ese período.

3. Toca en un artículo para ver más detalles.

4. Agrega un artículo a la lista de favoritos utilizando el botón correspondiente.

5. Visualiza y gestiona tus artículos favoritos en la pestaña "Favoritos".

## Tecnologías Utilizadas

- **SwiftUI**: Para construir la interfaz de usuario de manera declarativa.
- **MVVM (Model-View-ViewModel)**: Arquitectura utilizada para separar la lógica de negocio de la interfaz de usuario.
- **UserDefaults**: Para almacenar los artículos marcados como favoritos.
- **URLSession**: Para realizar peticiones de red y obtener los datos desde la API.

## Arquitectura del Proyecto

El proyecto sigue la arquitectura **MVVM (Model-View-ViewModel)** para separar la lógica de la interfaz de usuario, con la siguiente estructura:

- **Modelos**: Definen las estructuras de datos (`Article`, `Emailed`, etc.).
- **Vista (SwiftUI)**: Contiene la interfaz de usuario, construida con SwiftUI.
- **ViewModels**: Manejan la lógica de negocio y las funciones para interactuar con las vistas (`EmailedViewModel`, `ViewedViewModel`, etc.).

## Pruebas Unitarias

Las pruebas unitarias están implementadas utilizando `XCTest` para garantizar la correcta funcionalidad de las principales características de la aplicación, como la gestión de favoritos y la carga de artículos desde la API.

Para ejecutar las pruebas:
1. Abre el proyecto en Xcode.

2. Ve a la barra de menú y selecciona `Product > Test` o usa el atajo de teclado `Cmd + U`.


## Funcionalidades Futuras

- Implementar filtrado y búsqueda de artículos.
- Añadir notificaciones push para nuevos artículos populares.
- Mejorar la interfaz de usuario con animaciones y efectos visuales.

