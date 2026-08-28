# 📚 Bookly App

A Flutter application for browsing and discovering free books, built with the **Google Books API** and structured using the **MVVM architecture** with **Clean Architecture** principles.

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.8-0175C2?logo=dart&logoColor=white)
![Architecture](https://img.shields.io/badge/Architecture-MVVM-green)
![License](https://img.shields.io/badge/License-MIT-blue)

</div>

---

## ✨ Features

- 🏠 **Home Screen** — Browse featured books and best sellers with a smooth horizontal & vertical lists
- 📖 **Book Details** — View book info, rating, price, and preview link
- 🔍 **Search** — Search for any book by title, author, or category
- 🔄 **Pull to Refresh** — Refresh all home data with a single pull gesture
- 🎨 **Splash Screen** — Animated splash screen with slide transition
- 🌐 **Book Preview** — Launch the book's preview URL directly from the details screen
- ⚠️ **Error Handling** — Friendly error messages with retry buttons for network failures

## 🏗️ Architecture

The project follows the **MVVM (Model-View-ViewModel)** pattern combined with **Clean Architecture** layers:

```
┌─────────────────────────────────────────────┐
│              Presentation Layer             │
│   Views (UI)  ←→  ViewModels (Cubits)       │
├─────────────────────────────────────────────┤
│                 Data Layer                  │
│   Repos (Abstraction) ←→ Repo Impls         │
├─────────────────────────────────────────────┤
│               Core / Network                │
│        ApiService (Dio) + Models            │
└─────────────────────────────────────────────┘
```

### Key Architectural Decisions

| Concern | Solution |
|---|---|
| **State Management** | `flutter_bloc` (Cubit) with `Equatable` states |
| **Dependency Injection** | `get_it` — repos registered by **abstraction** (DIP) |
| **Navigation** | `go_router` with typed routes |
| **Error Handling** | `Either<Failure, T>` from `dartz` + custom `Failure` classes |
| **API Calls** | `Dio` wrapped in a single `ApiService` |
| **Image Loading** | `cached_network_image` with null-safe placeholders |

## 📁 Project Structure

```
lib/
├── Core/
│   ├── errors/          # Failure classes (ServerFailure, DioException mapping)
│   ├── routing/         # GoRouter configuration & route names
│   ├── styles/          # App colors & text styles
│   ├── utils/           # ApiService, ServiceLocator, Constants
│   └── widgets/         # Shared widgets (error widget, loading indicators)
└── Features/
    ├── splash/          # Animated splash screen
    ├── home/
    │   ├── data/        # BookModel + HomeRepo (interface & implementation)
    │   └── presentation/
    │       ├── view_models/   # FeaturedBooks, NewestBooks, SimilarBooks Cubits
    │       └── views/         # HomeView, BookDetailsView + widgets
    └── search/
        ├── data/        # SearchRepo (interface & implementation)
        └── presentation/
            ├── view_models/   # SearchCubit
            └── views/         # SearchView + widgets
```

## 🛠️ Tech Stack & Dependencies

| Package | Purpose |
|---|---|
| `flutter_bloc` | State management (Cubit pattern) |
| `get_it` | Service locator for dependency injection |
| `go_router` | Declarative navigation |
| `dio` | HTTP client for the Google Books API |
| `dartz` | Functional error handling (`Either`) |
| `equatable` | Value equality for models & states |
| `cached_network_image` | Efficient image loading & caching |
| `flutter_svg` | SVG rendering (splash logo) |
| `google_fonts` | Custom fonts |
| `url_launcher` | Opening book preview links |
| `shimmer` | Loading skeleton effects |

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.x or later)
- An IDE (VS Code / Android Studio)

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/Osamasamir88/Bookly-App.git
   cd Bookly-App
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**

   ```bash
   flutter run
   ```

> **Note:** The app uses the Google Books API. The API key is centralized in `lib/Core/utils/app_constants.dart`. For production, consider injecting it via `--dart-define` instead of hardcoding it.

## 📱 Screens

| Splash | Home | Book Details | Search |
|:---:|:---:|:---:|:---:|
| Animated logo & slide text | Featured + Best Sellers | Full book info & similar books | Real-time book search |

<!-- Add screenshots here:
| ![Splash](screenshots/splash.png) | ![Home](screenshots/home.png) | ![Details](screenshots/details.png) | ![Search](screenshots/search.png) |
-->

## 🔄 Data Flow Example

```
User opens Home
      ↓
FeaturedBooksCubit.fetchFeaturedBooks()
      ↓
HomeRepo.fetchFeaturedBooks()          ← abstraction
      ↓
HomeRepoImpl → ApiService (Dio GET)
      ↓
Google Books API response → List<BookModel>
      ↓
Either<Failure, List<BookModel>>
      ↓
emit(FeaturedBooksSuccess / FeaturedBooksFailure)
      ↓
UI rebuilds via BlocBuilder
```

## 🤝 Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request.

## 📄 License

This project is licensed under the MIT License.

---

<div align="center">
Made with ❤️ using Flutter
</div>