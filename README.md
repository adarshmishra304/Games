# 🎮 Game Hub App (Flutter)

A simple and fun **Flutter Game Hub App** that includes multiple mini-games in one place. Currently, it features:

* 🧩 **8 Puzzle Game**
* ❌⭕ **Tic Tac Toe**

---

## 🚀 Features

### 🧩 8 Puzzle Game

* Random solvable puzzle generation
* Tile movement with valid checks
* Move counter
* Win detection with sound effect 🎉
* Restart option

### ❌⭕ Tic Tac Toe

* Two-player mode (X vs O)
* Win & draw detection
* Turn indicator
* Restart option

---

## 📱 Screens

* Home Screen (Game selection)
* Puzzle Game Screen
* Tic Tac Toe Screen

---

## 🛠️ Tech Stack

* **Flutter**
* **Dart**
* **Material UI**
* **audioplayers package** (for sound effects)

---

## 📂 Project Structure

```
lib/
│── main.dart
│
├── screens/
│   ├── puzzle_screen.dart
│   └── tictactoe_screen.dart
```

---

## ⚙️ Installation & Setup

1. Clone the repository:

```bash
git clone https://github.com/adarshmishra304/Calculator-App.git
```

2. Navigate to the project:

```bash
cd Calculator-App
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the app:

```bash
flutter run
```

---

## 🔊 Assets Setup (Important)

Make sure you add your sound file:

```
assets/sounds/win.mp3
```

And update your `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/sounds/win.mp3
```

---

## 🎯 Future Improvements

* Add more games (Snake, Sudoku, Memory Game)
* Add AI opponent for Tic Tac Toe 🤖
* Improve UI/UX with animations
* Dark mode support 🌙
* Score tracking system

---

## 🤝 Contributing

Contributions are welcome!

1. Fork the repo
2. Create a new branch
3. Make changes
4. Submit a pull request

---

## 👨‍💻 Author

**Adarsh Mishra**
GitHub: https://github.com/adarshmishra304

---

⭐ If you like this project, don’t forget to **star the repo!**
