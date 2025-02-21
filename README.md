# NY Times Most Popular Articles App

## Overview
This Flutter application displays the most popular articles from **The New York Times** using their API. The app follows **Clean Architecture** and **Cubit** for state management, ensuring scalability and maintainability.

---

## Features
- Fetch and display the most popular articles in a **list view**.
- Navigate to an **article details** page by tapping an article.
- Handle API calls efficiently using **Dio**.
- Error handling with proper state management.
- Dependency injection using **GetIt**.
- Fully responsive UI using **Flutter ScreenUtil**.

---

## Project Structure
The project follows **Clean Architecture**, divided into **3 main layers**:

### 1. **Data Layer**
Responsible for handling API requests and data models.
- **Models:** `article_response.dart`
- **Remote Data Source:** `article_api_services.dart`, `article_remote_ds.dart`


### 2. **Domain Layer**
Defines business logic with **repositories and use cases**.
- **Repository Interface:** `article_repository.dart`
- **Use Case:** `get_most_popular_uc.dart`

### 3. **Presentation Layer**
Handles UI and state management using **Cubit**.
- **State Management:** `article_cubit.dart`, `article_state.dart`
- **UI Components:** `most_popular_article_view.dart`, `article_details_view.dart`
- **Widgets:** `article_list.dart`,`article_list_item.dart`, `by_line_and_date_row.dart`, `image_and_source_column.dart`

### **Core Layer** (Shared Utilities)
- **Networking:** `api_consumer.dart`, `dio_consumer.dart`,`api_interceptors.dart`
- **Local Storage:** `cache_helper.dart`
- **Error Handling:** `error_model.dart`, `exceptions.dart`
- **Routing:** `app_routers.dart`, `router_names.dart`
- **Dependency Injection:** `service_locator.dart`
- **Theme & UI Constants:** `app_colors.dart`, `app_themes.dart`
- **Utility Functions:** `show_toast.dart`, `app_strings.dart` ,`app_styles.dart`

---

## Dependencies
The project uses the following dependencies:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.6
  dio: ^5.7.0
  cached_network_image: ^3.3.1
  dartz: ^0.10.1
  equatable: ^2.0.7
  flutter_screenutil: ^5.9.3
  flutter_svg: ^2.0.17
  fluttertoast: ^8.2.8
  freezed_annotation: ^2.4.4
  get_it: ^8.0.0
  go_router: ^14.2.8
  intl: ^0.19.0
  json_annotation: ^4.9.0
  shared_preferences: ^2.2.3
  shimmer: ^3.0.0
  url_launcher: ^6.3.1
  
dev_dependencies:
  build_runner: ^2.4.13
  flutter_lints: ^4.0.0
  flutter_test:
    sdk: flutter
  freezed: ^2.5.7
  json_serializable: ^6.7.0
```

---

## How to Run
1. **Clone the repository**
   ```bash
   git clone <repo_link>
   cd <project_directory>
   ```
2. **Install dependencies**
   ```bash
   flutter pub get
   ```
3. **Run the project**
   ```bash
   flutter run
   ```

---

## API Key Setup
1. **Register** on [NY Times Developer Portal](https://developer.nytimes.com/get-started).
2. **Get your API Key**.
3. **Set up the API Key** in `.env` file or directly in `endpoints_strings.dart`.

---


