# Wemolo Challenge - Parking Lot Rating App

Welcome to the Wemolo frontend coding challenge! This app allows you to rate parking lots as either "good" or "bad" using a Tinder-like interface. The corresponding parking lot data (name, image, etc.) is fetched via a GraphQL API. You can review your choices from the session to keep in mind for future visits.

## Features

- **Tinder View**
  - View metadata and images of parking lots.
  - Swipe left to label a parking lot as "bad".
  - Swipe right to label a parking lot as "good".
  - Load the next parking lot after any decision.
  - Fetch a maximum of 5 cases in advance using pagination.
  - Stop tindering at any time and switch to the summary view.

- **Summary View**
  - Review the good and bad lots from the session in a list view.
  - Group, sort, and filter results for better overview.

## Setup Instructions

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: Comes with Flutter

### Installation

1. **Clone the repository**
   ```sh
   git clone https://github.com/yourusername/wemolo_challenge.git
   cd wemolo_challenge
   ```

2. **Install dependencies**
    ```sh
    flutter pub get
     ```

3. **Generate mock classes**
    ```sh
    flutter pub run build_runner build
     ```


### Running the App
    ```sh
    flutter run
    ```

### Running Tests
    ```sh
    flutter test
    ```

### Project Structure
    ```sh
    lib/
    ├── core/
    │   └── graphql/
    │       └── graphql_service.dart
    ├── data/
    │   ├── models/
    │   │   └── parking_lot.dart
    │   ├── repositories/
    │   │   └── parking_lot_repository_impl.dart
    ├── domain/
    │   ├── repositories/
    │   │   └── parking_lot_repository.dart
    │   └── usecases/
    │       └── fetch_parking_lots.dart
    ├── presentation/
    │   ├── providers/
    │   │   └── parking_lot_provider.dart
    │   ├── screens/
    │   │   ├── summary_view.dart
    │   │   └── tinder_view.dart
    │   └── widgets/
    │       └── parking_lot_card.dart
    └── main.dart
    ```
