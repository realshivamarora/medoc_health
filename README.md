# 🧪 Sample Pickup App

A mobile Flutter application to manage **daily healthcare sample pickups** with local persistence using Hive and state management using Provider. Designed for seamless tracking of pickup stages from scheduling to delivery.

---

## 📱 Features

-   🔍 **View Today’s Pickups** – Display scheduled pickups for the current day.
-   🛠️ **Update Pickup Status** – Progress through sample stages:
    -   Scheduled → In Transit → Collected → Delivered
-   📊 **End-of-Day Summary** – Get a categorized view of pickup statuses.
-   🧪 **Mock Data Generation** – Auto-generates sample pickups for testing on first launch.
-   💾 **Local Persistence** – Uses Hive to store data offline.
-   📦 **Clean Architecture** – Organized into models, providers, widgets, and screens.

---

## 📸 Screenshots

> *(You can add screenshots here later if required)*

---

## 🏗️ Project Structure

Refining Code Formatting

I'm currently focused on the formatting aspect. My primary aim is to take all incoming text and encapsulate it within a single Markdown code block. This will ensure it's presented correctly in a README file. I'm exploring the best approach to achieve this while keeping the output as clean and easily copy-able as possible.

Isolating Core Content

I've been working on refining the extraction process. My focus is on removing extraneous elements like conversational notes and retaining only the essential markdown content. I'm prioritizing accuracy in preserving the original formatting – headings, lists, and code blocks – within the final code block. The output needs to be a clean, ready-to-paste markdown block, ensuring a seamless experience for the user.

Crafting Markdown Output

I'm now fully immersed in the creation phase. My focus is on crafting a single, all-encompassing markdown code block. I've meticulously preserved all original markdown elements, including the nuanced structure of nested code blocks, and am now integrating the entire draft into a singular, clean block ready for seamless copying and pasting. The extra conversational notes and instructions have been completely scrubbed away.

Of course! Here is the clean, copy-able markdown code for your README.md file.

Markdown

# 🧪 Sample Pickup App

A mobile Flutter application to manage **daily healthcare sample pickups** with local persistence using Hive and state management using Provider. Designed for seamless tracking of pickup stages from scheduling to delivery.

---

## 📱 Features

-   🔍 **View Today’s Pickups** – Display scheduled pickups for the current day.
-   🛠️ **Update Pickup Status** – Progress through sample stages:
    -   Scheduled → In Transit → Collected → Delivered
-   📊 **End-of-Day Summary** – Get a categorized view of pickup statuses.
-   🧪 **Mock Data Generation** – Auto-generates sample pickups for testing on first launch.
-   💾 **Local Persistence** – Uses Hive to store data offline.
-   📦 **Clean Architecture** – Organized into models, providers, widgets, and screens.

---

## 📸 Screenshots

> *(You can add screenshots here later if required)*

---

## 🏗️ Project Structure

lib/
├── models/         # Data models with Hive integration
│   └── pickup.dart
├── providers/      # Provider for managing pickup logic
│   └── pickup_provider.dart
├── screens/        # UI screens
│   ├── home_screen.dart
│   └── summary_screen.dart
├── widgets/        # Custom reusable widgets
│   └── pickup_card.dart
└── main.dart       # Entry point

---


## 🚀 Getting Started

### Prerequisites

-   [Flutter SDK](https://flutter.dev/docs/get-started/install)
-   Dart
-   Android Studio / VS Code

### Installation

1.  **Clone the repository**
    ```bash
    git clone [https://github.com/YOUR_USERNAME/sample-pickup-app.git](https://github.com/YOUR_USERNAME/sample-pickup-app.git)
    cd sample-pickup-app
    ```
2.  **Install dependencies**
    ```bash
    flutter pub get
    ```
3.  **Generate Hive adapters**
    ```bash
    flutter packages pub run build_runner build
    ```
4.  **Run the app**
    ```bash
    flutter run
    ```

---

## ⚙️ Dependencies

| Package        | Purpose                     |
| -------------- | --------------------------- |
| `provider`     | State management            |
| `hive`         | Lightweight local storage   |
| `hive_flutter` | Flutter bindings for Hive   |
| `uuid`         | Unique ID generation        |

---

## ✅ Functionality Demonstrated

-   Custom model serialization using Hive
-   State management using `Provider`
-   UI updates on state change
-   Date/time filtering logic
-   Toggle-based stage advancement
-   Navigation between screens
-   Flutter best practices (widget decomposition, separation of concerns)

---

### 📦 Sample Data

Mock data is auto-generated on first launch if no pickups exist for the day, ensuring instant interactivity for demo or testing purposes.

### 📁 Important Notes

-   No backend/API is required – the app is entirely local.
-   The app will always show “No pickups scheduled today” unless mock data is generated or entries already exist in the Hive box.
-   `build_runner` is necessary for generating Hive type adapters.

---

## 🧑‍💻 Author

**Shivam Arora** *Engineering Student – Lovely Professional University* GitHub: `@yourusername`

---

## 📄 License

This project is licensed under the MIT License.
---

## 🏗️ Project Structure
