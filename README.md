# Flutter Chat Application

## Features
This application is built using **Flutter** and **Firebase**, offering a comprehensive chat experience with a clean and structured design.

### Main Features

#### 📂 Clean Folder Structure
- Organized and scalable folder structure for better maintainability.
- Component-wise development for modular and reusable code.

#### 🔐 Authentication Screen
- User-friendly UI for login and signup.
- Complete authentication functionality with Firebase integration.

#### 💬 User Chat Screen Features
- **Search Chat:** Quickly find conversations using a search bar.
- **Send and Receive Messages:** Real-time messaging powered by Firebase.
- **Seen/Unseen Status:**
    - Messages are marked as "seen" once the recipient views them.
- **Unseen Count Badge:**
    - Displays the number of unseen messages as a badge (e.g., "1" for one unseen message, "2" for two unseen messages).
- **Sent, Delivered, and Online Indicators:**
    - Single tick: Message sent.
    - Double tick (grey): Message delivered.
    - Colored double tick: Message seen.
    - Online status indicators for active users.

#### 🌐 Online Status and Last Active Timestamp
- Show the online/offline status of users.
- Display the last active timestamp for offline users.

#### 🔔 Notification Feature
- Push notifications for new messages.
- Alerts when the app is in the background or closed.

#### 👤 User Profile Screen
- Displays user details including:
    - Name
    - Email
    - Bio
    - Profile Image
- Editable fields for updating profile information.

## Getting Started
1. Clone this repository.
2. Set up Firebase for your project (Firestore, Authentication, and Cloud Messaging).
3. Run the application using:
   ```bash
   flutter run
