# IAInteractive
 Test de desarrollo
Decisiones Técnicas y Justificación
	1.	Estructura del Proyecto Basada en Clean Architecture
	•	Carpetas principales:
	•	Data: Maneja la persistencia y las implementaciones de servicios.
	•	Domain: Contiene los casos de uso y modelos de negocio principales.
	•	Presentation: Gestiona las vistas y la lógica de presentación (ViewModels).

Justificación:
	•	La arquitectura está diseñada para separar las responsabilidades y facilitar el mantenimiento y la escalabilidad.
	•	Clean Architecture permite cambios en una capa (por ejemplo, datos o presentación) sin afectar a otras capas.
	
2.	Uso de SwiftUI para la Interfaz de Usuario
	•	Archivo principal: WeaterApp.swift.
	•	Se basa en @main para iniciar la aplicación, lo que es estándar en proyectos SwiftUI.
	•	Justificación:
	•	SwiftUI permite un diseño de interfaz moderno y reactivo.
	•	La integración con Combine facilita el manejo de estados y flujos de datos.

	3.	Configuraciones de Entorno
	•	Carpeta: Configurations.
	•	Contiene archivos relacionados con configuraciones dinámicas (xcconfig), como claves de API y URLs.
	ustificación:
	•	Permite gestionar entornos de desarrollo y producción de manera centralizada.
	•	Reduce el riesgo de exponer datos sensibles en el código fuente.
	
 4.	Persistencia y Servicios
	•	Carpeta: Data.
	•	Incluye servicios como PersistentWeatherStorage y data sources como UserDefaultWeatherDataSource.
	Justificación:
	•	La modularidad en la persistencia permite escalar hacia bases de datos locales (Core Data, SQLite).
	•	La implementación actual usando UserDefaults es suficiente para el historial de búsquedas.
	
 5.	Capas de Dominio
	•	Carpeta: Domain.
	•	Contiene modelos y WeatherDTO para convertir dichos modelos a la informacion que la app requiere
	Justificación:
	•	Define la lógica de negocio de manera independiente de las implementaciones técnicas.
	•	Facilita pruebas unitarias y cambios en la lógica sin afectar otras capas.
	
 6.	Carpeta Presentation
	•	Estructurada en vistas (Views) y modelos de presentación (ViewModels).
	•	Incluye vistas clave como ContentView, MapsView y HistoryView.
	Justificación:
	•	La separación de vistas y ViewModels sigue el patrón MVVM, que es estándar en SwiftUI.
	•	Facilita la gestión del estado y la lógica específica de cada vista.
	
 8.	Gestión de Recursos
	•	Carpeta: Assets.xcassets.
	•	Maneja íconos y otros recursos visuales.
	•	Carpeta: Preview Content.
	•	Contiene datos de vista previa para SwiftUI mocks utilizados al momento de desarrollar la app 
	Justificación:
	•	Organización estándar para recursos estáticos, separando la lógica de la presentación visual.
	
 9.	Fichero de Configuración
	•	Archivo: Info.plist.
	•	Incluye configuraciones como nombres de claves de API, nombres de launch screen, etc.
	Justificación:
	•	Centralización de configuraciones específicas de la aplicación.

Las decisiones técnicas adoptadas en este proyecto están alineadas con las mejores prácticas de desarrollo móvil moderno:
	•	Clean Architecture: Facilita el mantenimiento, las pruebas y la escalabilidad.
	•	SwiftUI y Combine: Aprovecha lo último en desarrollo de interfaces y manejo de datos reactivos.
	•	Gestión de Entornos y Configuraciones: Mejora la seguridad y la flexibilidad del desarrollo.
