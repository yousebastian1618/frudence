# Frudence

A personal finance app built with Flutter for viewing income, expenses, and transaction details in one place.

**Status:** Early development. The Transactions screen uses bundled sample data; Home, Budgets, More, and Login are currently placeholders. Authentication, transaction editing, and persistent storage are not implemented yet.

## Features

- Transaction list with date headings.
- Total income, total expenses, and net balance calculated from the sample transactions.
- Category icons and subcategory labels.
- Tappable transaction notes that close when tapping outside or tapping the icon again.
- Separate colors for income and expenses.
- Light and dark themes that follow the system setting.
- Bottom navigation powered by `go_router`, with separate navigation branches for each tab.

## Getting started

### Requirements

- Flutter with a bundled Dart SDK compatible with `^3.13.2`, as specified in [pubspec.yaml](pubspec.yaml).
- A configured Flutter target: a device, emulator, browser, or desktop environment.

Check your local setup:

```bash
flutter doctor
```

### Run locally

```bash
git clone https://github.com/yousebastian1618/frudence.git
cd frudence
flutter pub get
flutter run
```

To choose a particular target:

```bash
flutter devices
flutter run -d <device-id>
```

The current demo runs with local sample data and does not require an API key or backend configuration.

## Project structure

```text
lib/
├── main.dart                 # Application entry point
├── app/
│   ├── app.dart              # Root application widget
│   ├── router/               # Routes and navigation branches
│   ├── shell/                # Shared bottom navigation
│   └── theme/                # Themes and custom app colors
├── core/
│   ├── utils/                # Formatting, assets, colors, and list helpers
│   └── widgets/              # Shared widgets, including tappable notes
└── features/
    ├── auth/
    ├── budget/
    ├── category/
    ├── home/
    ├── more/
    └── transaction/
        ├── data/             # Models and sample transactions
        ├── domain/           # Transaction entity
        └── presentation/     # Transaction page, header, and row widgets

assets/
├── default_icons/
└── images/icons/

test/                         # Widget tests
```

Features separate data, domain, and presentation code where those layers have been introduced. Shared UI and utilities live in `core`, while application configuration lives in `app`.

## Working with sample data

Edit these files to change the demo content:

- [Sample transactions](lib/features/transaction/data/dummy/sample_transactions.dart)
- [Sample categories](lib/features/category/data/dummy/sample_categories.dart)

The Transactions screen calculates its summary directly from `sampleTransactions`. Category and subcategory IDs connect transactions to their display details.

## Development checks

Run static analysis:

```bash
flutter analyze
```

Run the transaction widget tests:

```bash
flutter test test/transaction_page_test.dart test/transaction_box_test.dart
```

These cover opening and reopening the Transactions tab, list layout and scrolling, and loading category images.

The default counter test in `test/widget_test.dart` still references the starter app's `MyApp` widget and needs updating before the full `flutter test` suite can pass.
