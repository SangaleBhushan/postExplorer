
# 📱 PostExplorer (SwiftUI Assignment)

An iOS app built with **SwiftUI** that fetches posts from an API, supports searching, favorites, detail views, and animations.  
Built using **MVVM architecture**, clean networking, and polished UI touches such as matched geometry, staggered list animation, bottom header shadow, and a splash screen.

---

## ✨ Features

- ✅ **Fetch Posts** from `https://jsonplaceholder.typicode.com/posts`
- ✅ **List Screen** with post title & userId
- ✅ **Search posts** by title (real-time filter)
- ✅ **Post Detail Screen** with title, body, and favorite toggle
- ✅ **Mark/Unmark favorites** with heart animation
- ✅ **Favorites Tab** to view all favorite posts
- ✅ **Splash Screen** with logo + app name animation
- ✅ **Loading indicator** while fetching posts
- ✅ **Error state** with retry option
- ✅ **Pull-to-refresh** on posts list
- ✅ **Extra animations**:
  - Heart bounce with `spring`
  - Fade-in transitions
  - Staggered list animation
  - Matched geometry effect for heart icon
- ✅ **Custom TabView background**
- ✅ **Bottom shadow on headers**


---
## 📂 Folder Structure

The project follows **MVVM architecture** with a clear separation of concerns:

<img width="638" height="807" alt="image" src="https://github.com/user-attachments/assets/635d534e-28a4-4748-95a3-db630720113e" />



## 🏗 Architecture

The app follows **MVVM**:

- **Models** → Data models (`Post`) and wrapper with UI state (`PostItem`)
- **ViewModels** → Business logic (`PostsViewModel`)
- **Views** → SwiftUI screens (Posts list, Detail, Favorites, Splash)
- **Services** → Networking (`NetworkManager`)
- **Utils** → Reusable extensions & modifiers
- **Resources** → Assets, splash, launch screen

---

## ⚙️ Requirements

- **Xcode 16** (or latest supporting iOS 18)  
- **Swift 5.10+**  
- Deployment target: **iOS 18.0**

---

## 🚀 Setup & Run

1. Clone the repo:
   ```bash
   git clone https://github.com/SanagleBhushan/PostExplorer.git
   cd PostExplorer
   open PostExplorer.xcodeproj



Set deployment target to iOS 18.0:

Project → Targets → PostExplorer → Deployment Info → iOS 18.0

Build & Run on a simulator (e.g. iPhone 15 Pro) or real device.

## 🎨 Splash Screen

Implemented in SplashView.swift

Animated bolt.fill logo with fade & scale

Transition into ContentView with .move + .opacity

🔧 Error & Loading States

ProgressView displayed while fetching posts

Custom ErrorView shows error + retry button

Supports pull-to-refresh (.refreshable {})
--------
## 📸 Screenshots
<img width="400" height="800" alt="Simulator Screenshot - iPhone 16 Plus - 2025-10-03 at 00 11 41" src="https://github.com/user-attachments/assets/7ac814fe-45d0-4d9a-bb85-d0d4c9e44156" />
<img width="400" height="800" alt="Simulator Screenshot - iPhone 16 Plus - 2025-10-03 at 00 11 43" src="https://github.com/user-attachments/assets/6b96bcbd-735c-493c-806c-83a6e5699cff" />
<img width="400" height="800" alt="Simulator Screenshot - iPhone 16 Plus - 2025-10-03 at 00 11 45" src="https://github.com/user-attachments/assets/884e8bca-1229-465e-bda4-abe51c868d18" />
<img width="400" height="800" alt="Simulator Screenshot - iPhone 16 Plus - 2025-10-03 at 00 12 11" src="https://github.com/user-attachments/assets/678e9eb0-d69e-445e-82ca-197c8c90ccfe" />
<img width="400" height="800" alt="Simulator Screenshot - iPhone 16 Plus - 2025-10-03 at 00 12 19" src="https://github.com/user-attachments/assets/7289a15a-74d7-44eb-93d7-ceef1cca6223" />
<img width="400" height="8000" alt="Simulator Screenshot - iPhone 16 Plus - 2025-10-03 at 00 12 25" src="https://github.com/user-attachments/assets/626203ed-a0bf-4c66-9653-4671478e9906" />
<img width="400" height="800" alt="Simulator Screenshot - iPhone 16 Plus - 2025-10-03 at 00 13 06" src="https://github.com/user-attachments/assets/0d8a4f56-78a6-45bf-af49-446cf8536847" />









---------
## 🔮 Improvements (Future Work)

Persist favorites using UserDefaults or Core Data

Offline caching for posts

Unit tests for PostsViewModel with mocked network

Dark mode & theming

Accessibility (VoiceOver, Dynamic Type)

Haptic feedback for favorite toggle

👨‍💻 Author

Bhushan Sangale 

📧 sangalebhushan52@gmail.com

https://github.com/SangaleBhushan/
