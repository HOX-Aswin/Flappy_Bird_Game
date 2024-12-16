# Flappy Bird Game 🎮 (Flutter + Flame)

**A modern recreation of the classic Flappy Bird game built using Flutter and Flame, a powerful game engine for Flutter. This project demonstrates how to create engaging 2D games for mobile and web using Flutter's flexibility and Flame's game development tools.**

---

## Features 🌟
- **Smooth Animations**: Leveraging Flame for efficient sprite management and seamless game physics.  
- **Randomized Obstacles**: Dynamic pipe generation for endless gameplay variety.  
- **Score System**: Tracks your current score and displays your high score.  
- **Responsive Controls**: Tap the screen to flap and avoid obstacles.  
- **Customizable Gameplay**: Easily tweak parameters like bird speed, gravity, or obstacle difficulty.  

---

## Technologies Used 🛠️
- **Framework**: Flutter  
- **Game Engine**: Flame  
- **State Management**: Flame's built-in components  
- **Rendering**: Sprite animations with Flame for bird and pipe graphics  

---

## How to Play? 🎯
1. Clone the repository:  
   ```bash
   git clone https://github.com/yourusername/flappy-bird-flutter.git
   ```

2. Navigate to the project directory:  
   ```bash
   cd flappy-bird-flutter
   ```

3. Install dependencies:  
   ```bash
   flutter pub get
   ```

4. Run the game on your preferred platform:  
   - **For Android**:  
     ```bash
     flutter run
     ```

5. **Gameplay Instructions**:  
   - Tap anywhere on the screen to make the bird flap.  
   - Avoid colliding with the pipes or hitting the ground.  
   - Aim for the highest score possible!  

---

## Folder Structure 📂
```
flappy-bird-flutter/
├── assets/
│   └── images/
│       ├── background.png     # Background image
│       ├── bird.png           # Bird sprite
│       ├── bottom_pipe.png    # Bottom pipe sprite
│       ├── ground.png         # Ground sprite
│       └── top_pipe.png       # Top pipe sprite
├── lib/
│   ├── components/
│   │   ├── background.dart    # Background component
│   │   ├── bird.dart          # Bird sprite and physics
│   │   ├── ground.dart        # Ground sprite component
│   │   ├── pipe.dart          # Pipe component
│   │   ├── pipe_manager.dart  # Pipe generation logic
│   │   └── score.dart         # Score tracking
│   ├── const.dart             # Constants for game configuration
│   ├── game.dart              # Core game logic
│   └── main.dart              # Game initialization
├── linux/                     # Linux platform support
├── macos/                     # macOS platform support
├── web/                       # Web platform support
├── windows/                   # Windows platform support
├── test/                      # Unit tests
├── .gitignore                 # Git ignore file
├── .metadata                  # Flutter metadata
```
