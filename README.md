<div align="center">
  <img src="assets/images/logo (2).png" alt="Mizan Logo" width="100"/>
  <h1>💰 Mizan (ميزان)</h1>
  <p><b>Your Smart Personal Financial Balance Manager</b></p>
  
  [![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
  [![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
  [![Status](https://img.shields.io/badge/Status-Active-success?style=for-the-badge)]()
  
  <p><i>Empowering users to track, manage, and optimize their daily finances.</i></p>
</div>

---

## 🎥 Application Showcase

<div align="center">
  <table style="border-collapse: separate; border-spacing: 0; border: 3px solid #7A9176; border-radius: 15px; background-color: #FEF1E0; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
    <tr>
      <td align="center" style="padding: 15px;">
        <video src="https://github.com/user-attachments/assets/8a60aa70-b73a-472a-bf0f-139ba7bc44cd" width="280" controls style="border-radius: 10px;"></video>
        <br/><br/>
        <sub><b>A comprehensive walkthrough of Mizan's UI and Core Features</b></sub>
      </td>
    </tr>
  </table>
</div>

## 🚀 Overview

**Mizan** (Arabic for "Balance" or "Scale") is a comprehensive, meticulously crafted Flutter application tailored for Arabic-speaking users. It bridges the gap between complex financial tracking and everyday usability, offering a beautifully designed interface powered by robust underlying architecture.

Whether it's calculating live currency conversions, tracking monthly installments, or automatically allocating salary segments using the proven 50/30/20 budgeting rule, Mizan is engineered to keep your financial life perfectly scaled.

## ✨ Core Features

*   **📊 Smart Budgeting Allocation:** Automatically divides the user's total salary into Needs (50%), Wants (30%), and Savings (20%) with dynamic, interactive circular progress indicators.
*   **💱 Real-Time Currency Conversion:** Integrated with the `er-api` via Dio to fetch live USD-based global exchange rates, allowing instant conversions across 19 supported currencies.
*   **📅 Installments Tracker:** A complete CRUD-capable interface for users to add, edit, track, and delete their upcoming financial obligations and monthly installments.
*   **🔐 Localized Profile Management:** Features a secure, customized user profile interface, strictly localized with RTL (Right-to-Left) layouts and specialized Arabic typography (ReemKufi, Lemonada).

## 🛠️ Tech Stack & Architecture

*   **Framework:** Flutter & Dart
*   **State Management:** Ephemeral State (StatefulWidgets)
*   **Networking:** `dio` for secure and rapid API consumption.
*   **Localization:** `flutter_localizations` for native RTL alignment and cultural formatting.
*   **UI/UX:** Custom Material Design implementations, `Stack` for layered layouts, and `ClipRRect` for seamless media rendering.

## 📁 Project Structure
```text
mizanappmaterial/
├── assets/
│   ├── fonts/               # Custom Arabic fonts (ReemKufi, ReadexPro, etc.)
│   └── images/              # Application assets, icons, and state GIFs
├── lib/
│   ├── Models/
│   │   ├── api_service.dart # Dio-based REST API service
│   │   └── currency_model.dart # JSON Serialization models
│   ├── screens/             # UI Components
│   │   ├── Conversion_currency.dart
│   │   ├── Expenses_Screen.dart
│   │   ├── Installments_Screen.dart
│   │   ├── MizanApp_Home.dart
│   │   ├── MizanApp_Log.dart
│   │   └── Profile_Screen.dart
│   └── main.dart            # Application entry point
└── pubspec.yaml             # Dependencies and configuration
