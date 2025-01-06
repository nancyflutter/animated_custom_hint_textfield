Custom Animated Hint TextField Flutter Example

Overview

This Flutter application demonstrates the use of custom animated hint text fields. The app provides various animation types for text hints within input fields, enhancing the user experience with smooth and visually appealing transitions.

Key Features:

Animated Hint Text: Hints in text fields dynamically change using animations.

Multiple Animation Types: Includes cyclic scrolling, sliding, scaling, fading, and more.

Customizable Design: Developers can easily modify styles, animations, and text properties to fit their needs.

Static and Animated Hints: Supports both static hint text and animated hint transitions.

Installation

Clone the repository or copy the provided code.

Ensure you have Flutter installed on your machine. You can check this by running flutter doctor.

Run the application using the following commands:

flutter pub get
flutter run

Open the app in an emulator or on a physical device to view the example.

File Structure

main.dart

The entry point of the application, which sets up the MaterialApp and initializes the HomeScreen widget.

Screens and Widgets

HomeScreen

The main screen where all examples of animated hint text fields are displayed. It is divided into sections showcasing various animation types.

CircularAnimatedHintTextField

A text field with cyclic scrolling hint animation.

Example hints: "Burger Delights 🍔", "Pizza Heaven 🍕", etc.

Features static text alongside animated hints.

Code Snippet:

CircularAnimatedHintTextField(
  staticSearchText: "Search food...",
  hints: [
    "Burger Delights 🍔",
    "Pizza Heaven 🍕",
    "Sweet Treats 🍰",
  ],
);

Animation Types

1. Cyclic Scrolling Animation

Scrolls through hints cyclically, creating a looping animation.

Example static hint: "Search food..."

2. Slide Animation

Hints slide horizontally in and out of the text field.

Customizable duration and direction.

Example hints: "🔍 Quick search", "🚀 Easy navigation".

Properties:

hintAnimationType: HintAnimationType.slide

hintChangeDuration: Duration(seconds: 3)

3. Scale Animation

Hints scale in and out to give a zoom effect.

Example hints: "Pizza 🍕", "Burger 🍔".

Properties:

hintAnimationType: HintAnimationType.scale

4. Top-to-Bottom & Bottom-to-Top Animation

Hints move vertically through the text field.

Example hints: "Play Games 🎮", "Learn Stuff 📚".

Properties:

hintAnimationType: HintAnimationType.topToBottom

hintAnimationType: HintAnimationType.bottomToTop

5. Fade Animation

Hints fade in and out for a smooth transition effect.

Example hints: "💡 Quick Search", "🔍 Find Your Favorite".

Properties:

hintAnimationType: HintAnimationType.fade

6. Slide From Top & Slide From Bottom Animation

Hints slide into the text field from the top or bottom.

Example hints: "✨ Sparkle", "🎉 Celebrate".

Properties:

hintAnimationType: HintAnimationType.slideFromTop

hintAnimationType: HintAnimationType.slideFromBottom

Customization

Hint Styles

Static Hint Style:

hintStyleForStatic: TextStyle(color: Colors.grey, fontSize: 14)

Animated Hint Style:

hintStyleForAnimatedHint: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)

Icons

Add prefixIcon and suffixIcon for additional functionality or aesthetics.

Durations and Intervals

Change hint transition duration:

hintChangeDuration: Duration(seconds: 3)

How to Use

Add the AnimatedHintTextField widget in your Flutter project.

Customize properties like hints, hintAnimationType, hintChangeDuration, and more.

Preview the animation in your app.

Example Use Case

AnimatedHintTextField(
  hints: ["Find your favorite 🍕", "Search now 🔍"],
  hintAnimationType: HintAnimationType.fade,
  hintChangeDuration: Duration(seconds: 2),
  backgroundColor: Colors.grey[200],
);

Screenshots

Coming soon

Conclusion

This example showcases how you can enhance text input fields with animations, making your app more dynamic and user-friendly. Customize and experiment with various animation types to create the best experience for your users.

Feedback

Feel free to contribute or provide feedback to improve this example!
