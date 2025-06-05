# Clean Architecture Flutter Portfolio (MVVM + Bloc + Hive)

## Folder Structure

```
lib/
├── core/              # Shared utilities (theme, constants, helpers)
├── data/              # Data sources (local/hive, remote), models, repositories
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/            # Entities, repositories, use cases
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── presentation/      # UI, Blocs/ViewModels, widgets, screens
│   ├── blocs/
│   ├── viewmodels/
│   ├── screens/
│   └── widgets/
└── main.dart
```

---

## Key Patterns & Packages

- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [hive](https://pub.dev/packages/hive)
- [hive_flutter](https://pub.dev/packages/hive_flutter)
- [flutter_animate](https://pub.dev/packages/flutter_animate) / [animated_text_kit](https://pub.dev/packages/animated_text_kit)
- [lottie](https://pub.dev/packages/lottie)
- [url_launcher](https://pub.dev/packages/url_launcher)

---

## Example: Project Flow

**Entity:**  
`domain/entities/project.dart`

**Model (for Hive):**  
`data/models/project_model.dart`

**Hive Local Data Source:**  
`data/datasources/project_local_datasource.dart`

**Repository:**  
`data/repositories/project_repository_impl.dart`  
`domain/repositories/project_repository.dart`

**Use Case:**  
`domain/usecases/get_projects.dart`

**Bloc:**  
`presentation/blocs/project_bloc.dart`

**Screen:**  
`presentation/screens/projects_screen.dart`

**Widget:**  
`presentation/widgets/project_card.dart`

---

## Main App Entry

- Initializes Hive.
- Loads data (projects, skills, etc.) from Hive.
- Provides Blocs and ViewModels to UI.

---

## Responsive UI

- Use `LayoutBuilder`, `MediaQuery`, and custom widgets for mobile/tablet/web.
- Consider `flutter_screenutil` for pixel-perfect scaling.

---

## Example Features

- Hero Section: Animated text, photo, typing effect (animated_text_kit)
- About: Bio, download resume (PDF, using url_launcher)
- Skills: Animated bars/icons, categorized, shimmer/entrance animations
- Projects: Cards, open link on tap, fade-in animation
- Contact: Simple form, UI only, validates but doesn't send (yet)
- Offline: Load everything from Hive

---

## Tips

- Keep Blocs/ViewModels “dumb” — all business logic in UseCases.
- Use dependency injection (get_it or similar) for better testing and maintainability.
- Keep UI widgets stateless when possible, react to Bloc/ViewModel states.