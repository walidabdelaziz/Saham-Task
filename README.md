# Sahm - iOS

**Sahm** is a mini food delivery tracking app built with SwiftUI. It displays a list of food orders from a local mock REST API and allows users to view individual order details. Order statuses update live in real-time via a WebSocket connection using Mockoon.

## 📱 Features

- [x] Order List Screen – View a list of food orders
- [x] Order Detail Screen – View selected order info
- [x] Real-time WebSocket updates per order
- [x] WebSocket reconnect logic
- [x] MVVM + Clean Architecture
- [x] Mock server setup with Mockoon

---

## 📋 Requirements

- iOS 18.0+
- Xcode 15.0+
- Swift 5.5+
- [Mockoon](https://mockoon.com/) (for local mock server)

---

## 🛠 Technologies Used

### ✅ SwiftUI

- Declarative UI with smooth layout and rendering
- Navigation between order list and details screen

### ✅ MVVM + Clean Architecture

- **Presentation Layer**: SwiftUI views + ViewModels  
- **Domain Layer**: Entities, Use Cases  
- **Data Layer**: Networking and Services

### ✅ Networking

- REST using `URLSession`
- WebSocket using `URLSessionWebSocketTask`
- WebSocket auto-reconnect logic on failure

### ✅ Dependency Injection

- Use case and service layers injected into ViewModels

---

## 🧪 Mock API Setup (Mockoon)

- Install [Mockoon]
- Import the provided Orders.json file to Mockoon, You can find the file in the project root directory.
