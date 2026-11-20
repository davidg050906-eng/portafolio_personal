# Portafolio Personal — David Alejandro González Cárdenas
Aplicación móvil con tema visual personalizado y acceso directo a canales de contacto y emprendimiento.

## Estructura del proyecto
- lib/main.dart: punto de entrada de la aplicación y configuración del tema y rutas.
- lib/routes/app_routes.dart: definición centralizada de rutas (/, /venture, /about, /contact).
- lib/themes/app_theme.dart: paleta oscura personalizada (negro, morado profundo y acento amarillo) con google_fonts.
- lib/models/portfolio_models.dart: modelos de datos (ContactOption, Recommendation).
- lib/widgets/: componentes reutilizables (CustomAppBar con firma y acceso a contacto ProfileHeader).
- lib/screens/: pantallas de inicio (HomeScreen), emprendimiento principal (VentureScreen), perfil (AboutScreen) y contacto (ContactScreen).
- assets/images/profile.JPG: fotografía de perfil.

## Dependencias principales
- google_fonts: tipografía moderna en la interfaz.
- url_launcher: apertura de enlaces externos (WhatsApp, correo electrónico, GitHub, Instagram y tienda weB)