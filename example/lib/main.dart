import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Animated Hint TextField',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomeScreen(), // With static text
      // home: const HintAnimationScreen(),  // without Static text
    );
  }
}

/// Example of how to use (Animated Hint Text with Static Hint Text)

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Custom Animated Hint TextField✨',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager().primaryFocus?.unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),

                // 1. Cyclic Scrolling Example
                /// Static hint text with animated text
                const Text(
                  " ◆ Cyclic Scrolling Animation",
                  style: TextStyle(fontSize: 15, color: Colors.purple, fontWeight: FontWeight.bold),
                ),
                const CircularAnimatedHintTextField(
                  staticSearchText: "Search food...",
                  hintStyleForStatic: TextStyle(color: Colors.grey, fontSize: 14),
                  hints: [
                    "Burger Delights 🍔",
                    "Pizza Heaven 🍕",
                    "Sweet Treats 🍰",
                    "Noodles Galore 🍜",
                    "Taco Time 🌯",
                    "Fries Galore 🍟",
                  ],
                  hintStyleForAnimatedHint: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 14),
                const CircularAnimatedHintTextField(
                  prefixIcon: Icon(Icons.search_off_rounded, color: Colors.purple),
                  suffixIcon: Icon(Icons.access_time_filled, color: Colors.purple),
                  staticSearchText: "Search food...",
                  hintStyleForStatic: TextStyle(color: Colors.grey, fontSize: 14),
                  hints: [
                    "'Burger Delights 🍔'",
                    "'Pizza Heaven 🍕'",
                    "'Sweet Treats 🍰'",
                    "'Noodles Galore 🍜'",
                    "'Taco Time 🌯'",
                    "'Fries Galore 🍟'",
                  ],
                  hintStyleForAnimatedHint: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),

                // 2. Slide Animation Example
                const Text(
                  " ◆ Slide Animation",
                  style: TextStyle(fontSize: 15, color: Colors.deepOrange, fontWeight: FontWeight.bold),
                ),
                AnimatedHintTextField(
                  prefixIcon: const Text("🫠"),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(100),
                  staticSearchText: "Search items...",
                  hintStyleForStatic: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  hints: const [
                    "🔍 Quick search",
                    "🚀 Easy navigation",
                    "🌍 Explore destinations",
                  ],
                  // animateEntireHint: false,
                  backgroundColor: Colors.grey[100],
                  hintStyleForAnimatedHint: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                  hintChangeDuration: const Duration(seconds: 3),
                  hintAnimationType: HintAnimationType.slide,
                ),
                const SizedBox(height: 24),

                // 3. Scale Animation Example
                const Text(
                  " ◆ Scale In/Out Animation",
                  style: TextStyle(fontSize: 15, color: Colors.green, fontWeight: FontWeight.bold),
                ),
                AnimatedHintTextField(
                  suffixIcon: const Icon(Icons.ac_unit, color: Colors.green),
                  borderWidth: 1,
                  isFocusedBorderColor: Colors.yellow,
                  unFocusedBorderColor: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                  staticSearchText: "Find items...",
                  hintStyleForStatic: const TextStyle(color: Colors.grey, fontSize: 14),
                  hints: const [
                    "Pizza 🍕",
                    "Burger 🍔",
                    "Cake 🍰",
                    "Noodles 🍜",
                    "Sandwich 🥪",
                  ],
                  // animateEntireHint: false,
                  backgroundColor: Colors.grey[100],
                  hintStyleForAnimatedHint: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                  hintChangeDuration: const Duration(seconds: 3),
                  hintAnimationType: HintAnimationType.scale,
                ),
                const SizedBox(height: 24),

                // 4. Circular Scrolling (Top to Bottom) Animation Example
                const Text(
                  " ◆ Top to Bottom",
                  style: TextStyle(fontSize: 15, color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                AnimatedHintTextField(
                  prefixIcon: const Icon(Icons.bubble_chart, color: Colors.blue),
                  staticSearchText: "Find items...",
                  hintStyleForStatic: const TextStyle(color: Colors.grey, fontSize: 14),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(100),
                  hints: const [
                    "Play Games 🎮",
                    "Learn Stuff 📚",
                    "Watch Movies 🎥",
                    "Listen to Music 🎧",
                  ],
                  // animateEntireHint: false,
                  backgroundColor: Colors.grey[100],
                  hintStyleForAnimatedHint: const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                  hintChangeDuration: const Duration(seconds: 3),
                  hintAnimationType: HintAnimationType.topToBottom,
                ),
                const SizedBox(height: 24),

                const Text(
                  " ◆ Bottom To Top",
                  style: TextStyle(fontSize: 15, color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                AnimatedHintTextField(
                  staticSearchText: "Find items...",
                  hintStyleForStatic: const TextStyle(color: Colors.grey, fontSize: 14),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(100),
                  hints: const [
                    "Play Games 🎮",
                    "Learn Stuff 📚",
                    "Watch Movies 🎥",
                    "Listen to Music 🎧",
                  ],
                  // animateEntireHint: false,
                  backgroundColor: Colors.grey[100],
                  hintStyleForAnimatedHint: const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                  hintChangeDuration: const Duration(seconds: 3),
                  hintAnimationType: HintAnimationType.bottomToTop,
                ),
                const SizedBox(height: 24),

                // 5. Fade Animation Example
                const Text(
                  " ◆ Fade Animation",
                  style: TextStyle(fontSize: 16, color: Colors.pink, fontWeight: FontWeight.bold),
                ),
                AnimatedHintTextField(
                  // animateEntireHint: false,
                  hints: const [
                    '💡 Quick Search',
                    '🌍 Explore More',
                    '🔍 Find Your Favorite',
                  ],
                  staticSearchText: "Search items...",
                  hintStyleForStatic: const TextStyle(color: Colors.grey, fontSize: 14),
                  backgroundColor: Colors.grey[200],
                  hintStyleForAnimatedHint: const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                  hintChangeDuration: const Duration(seconds: 2),
                  hintAnimationType: HintAnimationType.fade,
                ),
                const SizedBox(height: 24),

                // 6. Slide from Top Animation Example
                const Text(
                  " ◆ Slide From Top Animation",
                  style: TextStyle(fontSize: 16, color: Colors.indigo, fontWeight: FontWeight.bold),
                ),
                const AnimatedHintTextField(
                  // animateEntireHint: false,
                  staticSearchText: "Find items...",
                  hintStyleForStatic: TextStyle(color: Colors.grey, fontSize: 14),
                  hints: ["✨ Sparkle", "🎉 Celebrate", "🌟 Shine Bright", "💥 Explode", "💫 Magic"],
                  hintAnimationType: HintAnimationType.slideFromTop,
                  hintStyleForAnimatedHint: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),

                // 7. Slide From Bottom Animation Example
                const Text(
                  " ◆ Slide From Bottom Animation",
                  style: TextStyle(fontSize: 16, color: Colors.orange, fontWeight: FontWeight.bold),
                ),
                AnimatedHintTextField(
                  prefixIcon: const Icon(Icons.search, color: Colors.orange),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(100),
                  staticSearchText: "Search...",
                  hintStyleForStatic: const TextStyle(color: Colors.grey, fontSize: 14),
                  hints: const ["🍕 Pizza", "🍔 Burger", "🍩 Donut", "🍨 Ice Cream"],
                  // animateEntireHint: false,
                  backgroundColor: Colors.grey[100],
                  hintStyleForAnimatedHint: const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                  hintChangeDuration: const Duration(seconds: 2),
                  hintAnimationType: HintAnimationType.slideFromBottom,
                ),
                const SizedBox(height: 24),
                const SizedBox(height: 400),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Example of how to use (Animated Hint Text without Static Hint Text)
class HintAnimationScreen extends StatelessWidget {
  const HintAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Custom Animated Hint TextField✨',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager().primaryFocus?.unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),

                // 1. Cyclic Scrolling Example
                /// Static hint text with animated text
                const Text(
                  " ◆ Cyclic Scrolling Animation",
                  style: TextStyle(fontSize: 15, color: Colors.purple, fontWeight: FontWeight.bold),
                ),
                const CircularAnimatedHintTextField(
                  hints: [
                    "Burger Delights 🍔",
                    "Pizza Heaven 🍕",
                    "Sweet Treats 🍰",
                    "Noodles Galore 🍜",
                    "Taco Time 🌯",
                    "Fries Galore 🍟",
                  ],
                  hintStyleForAnimatedHint: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                  animateEntireHint: true,
                ),
                const SizedBox(height: 14),
                const CircularAnimatedHintTextField(
                  prefixIcon: Icon(Icons.search_off_rounded, color: Colors.purple),
                  suffixIcon: Icon(Icons.access_time_filled, color: Colors.purple),
                  hints: [
                    "'Burger Delights 🍔'",
                    "'Pizza Heaven 🍕'",
                    "'Sweet Treats 🍰'",
                    "'Noodles Galore 🍜'",
                    "'Taco Time 🌯'",
                    "'Fries Galore 🍟'",
                  ],
                  hintStyleForAnimatedHint: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                  animateEntireHint: true,
                ),
                const SizedBox(height: 24),

                // 2. Slide Animation Example
                const Text(
                  " ◆ Slide Animation",
                  style: TextStyle(fontSize: 15, color: Colors.deepOrange, fontWeight: FontWeight.bold),
                ),
                AnimatedHintTextField(
                  prefixIcon: const Text("🫠"),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(100),
                  // animateEntireHint: true,
                  hints: const [
                    "🔍 Quick search",
                    "🚀 Easy navigation",
                    "🌍 Explore destinations",
                  ],
                  backgroundColor: Colors.grey[100],
                  hintStyleForAnimatedHint: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                  hintChangeDuration: const Duration(seconds: 3),
                  hintAnimationType: HintAnimationType.slide,
                ),
                const SizedBox(height: 24),

                // 3. Scale Animation Example
                const Text(
                  " ◆ Scale In/Out Animation",
                  style: TextStyle(fontSize: 15, color: Colors.green, fontWeight: FontWeight.bold),
                ),
                AnimatedHintTextField(
                  suffixIcon: const Icon(Icons.ac_unit, color: Colors.green),
                  borderWidth: 1,
                  isFocusedBorderColor: Colors.yellow,
                  unFocusedBorderColor: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                  hints: const [
                    "Pizza 🍕",
                    "Burger 🍔",
                    "Cake 🍰",
                    "Noodles 🍜",
                    "Sandwich 🥪",
                  ],
                  // animateEntireHint: true,
                  backgroundColor: Colors.grey[100],
                  hintStyleForAnimatedHint: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                  hintChangeDuration: const Duration(seconds: 3),
                  hintAnimationType: HintAnimationType.scale,
                ),
                const SizedBox(height: 24),

                // 4. Circular Scrolling (Top to Bottom) Animation Example
                const Text(
                  " ◆ Top to Bottom",
                  style: TextStyle(fontSize: 15, color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                AnimatedHintTextField(
                  prefixIcon: const Icon(Icons.bubble_chart, color: Colors.blue),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(100),
                  hints: const [
                    "Play Games 🎮",
                    "Learn Stuff 📚",
                    "Watch Movies 🎥",
                    "Listen to Music 🎧",
                  ],
                  // animateEntireHint: true,
                  backgroundColor: Colors.grey[100],
                  hintStyleForAnimatedHint: const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                  hintChangeDuration: const Duration(seconds: 3),
                  hintAnimationType: HintAnimationType.topToBottom,
                ),
                const SizedBox(height: 24),

                const Text(
                  " ◆ Bottom To Top",
                  style: TextStyle(fontSize: 15, color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                AnimatedHintTextField(
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(100),
                  hints: const [
                    "Play Games 🎮",
                    "Learn Stuff 📚",
                    "Watch Movies 🎥",
                    "Listen to Music 🎧",
                  ],
                  // animateEntireHint: true,
                  backgroundColor: Colors.grey[100],
                  hintStyleForAnimatedHint: const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                  hintChangeDuration: const Duration(seconds: 3),
                  hintAnimationType: HintAnimationType.bottomToTop,
                ),
                const SizedBox(height: 24),

                // 5. Fade Animation Example
                const Text(
                  " ◆ Fade Animation",
                  style: TextStyle(fontSize: 16, color: Colors.pink, fontWeight: FontWeight.bold),
                ),
                AnimatedHintTextField(
                  // animateEntireHint: true,
                  hints: const [
                    'Quick Search 💡',
                    'Explore More 🌍',
                    'Find Your Favorite 🔍',
                  ],
                  backgroundColor: Colors.grey[200],
                  hintStyleForAnimatedHint: const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                  hintChangeDuration: const Duration(seconds: 2),
                  hintAnimationType: HintAnimationType.fade,
                ),
                const SizedBox(height: 24),

                // 6. Slide from Top Animation Example
                const Text(
                  " ◆ Slide From Top Animation",
                  style: TextStyle(fontSize: 16, color: Colors.indigo, fontWeight: FontWeight.bold),
                ),
                const AnimatedHintTextField(
                  // animateEntireHint: true,
                  hints: ["✨ Sparkle", "🎉 Celebrate", "🌟 Shine Bright", "💥 Explode", "💫 Magic"],
                  hintAnimationType: HintAnimationType.slideFromTop,
                  hintStyleForAnimatedHint: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),

                // 7. Slide From Bottom Animation Example
                const Text(
                  " ◆ Slide From Bottom Animation",
                  style: TextStyle(fontSize: 16, color: Colors.orange, fontWeight: FontWeight.bold),
                ),
                AnimatedHintTextField(
                  prefixIcon: const Icon(Icons.search, color: Colors.orange),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(100),
                  hints: const ["🍕 Pizza", "🍔 Burger", "🍩 Donut", "🍨 Ice Cream"],
                  // animateEntireHint: true,
                  backgroundColor: Colors.grey[100],
                  hintStyleForAnimatedHint: const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                  hintChangeDuration: const Duration(seconds: 2),
                  hintAnimationType: HintAnimationType.slideFromBottom,
                ),
                const SizedBox(height: 24),
                const SizedBox(height: 400),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum HintAnimationType {
  fade,
  slide,
  scale,
  slideFromTop,
  slideFromBottom,
  topToBottom,
  bottomToTop,
}

class AnimatedHintTextField extends StatefulWidget {
  final List<String> hints;
  final TextEditingController? controller;
  final InputDecoration? inputDecoration;
  final TextStyle? hintStyleForAnimatedHint;
  final TextStyle? hintStyleForStatic;
  final Color? backgroundColor;
  final Duration hintChangeDuration;
  final bool autoFocus;
  final bool showHintWhenTyping;

  // final bool animateEntireHint;
  final String? staticSearchText;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final Color? isFocusedBorderColor;
  final Color? unFocusedBorderColor;
  final double? borderWidth;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final HintAnimationType hintAnimationType; // Use enum for animation type

  const AnimatedHintTextField({
    super.key,
    required this.hints,
    this.controller,
    this.inputDecoration,
    this.hintStyleForAnimatedHint,
    this.backgroundColor,
    this.hintChangeDuration = const Duration(seconds: 2),
    this.autoFocus = false,
    this.showHintWhenTyping = false,
    // this.animateEntireHint = true,
    this.hintStyleForStatic,
    this.staticSearchText,
    this.borderRadius,
    this.border,
    this.isFocusedBorderColor,
    this.unFocusedBorderColor,
    this.borderWidth = 1.0,
    this.prefixIcon,
    this.suffixIcon,
    this.hintAnimationType = HintAnimationType.fade, // Default to fade animation
  });

  @override
  State<AnimatedHintTextField> createState() => _AnimatedHintTextFieldState();
}

class _AnimatedHintTextFieldState extends State<AnimatedHintTextField> with SingleTickerProviderStateMixin {
  late TextEditingController _controller;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  final FixedExtentScrollController _scrollController = FixedExtentScrollController();

  int _currentIndex = 0;
  bool _isTyping = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(() {
      setState(() {
        _isTyping = _controller.text.isNotEmpty;
      });
    });

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0.0, 0.5), end: Offset.zero).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % widget.hints.length;
        });
        _animationController.forward();
      }
    });

    _startHintAnimation();
  }

  @override
  void dispose() {
    if (widget.controller == null) _controller.dispose();
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _startHintAnimation() {
    Future.delayed(widget.hintChangeDuration, () {
      if (mounted && (!_isTyping || widget.showHintWhenTyping)) {
        _animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.grey[200],
        borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
        border: widget.border ??
            Border.all(
              color: _isFocused ? widget.isFocusedBorderColor ?? Colors.blue : widget.unFocusedBorderColor ?? Colors.grey[300]!,
              width: widget.borderWidth ?? 1.0,
            ),
      ),
      child: FocusScope(
        child: Focus(
          onFocusChange: (focus) {
            setState(() {
              _isFocused = focus;
            });
          },
          child: Row(
            children: [
              if (widget.prefixIcon != null) widget.prefixIcon!,
              const SizedBox(width: 8),
              Expanded(
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    if (!_isTyping || widget.showHintWhenTyping)
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 800),
                        child: Row(
                          key: ValueKey<int>(_currentIndex),
                          children: [
                            // if (!widget.animateEntireHint)
                            Text(
                              widget.staticSearchText.toString(),
                              style: widget.hintStyleForStatic ?? const TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            Flexible(
                              child: _buildAnimationWidget(),
                            ),
                          ],
                        ),
                      ),
                    TextField(
                      textInputAction: TextInputAction.done,
                      controller: _controller,
                      autofocus: widget.autoFocus,
                      decoration: widget.inputDecoration?.copyWith(
                            hintText: '',
                            border: InputBorder.none,
                          ) ??
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ],
                ),
              ),
              if (widget.suffixIcon != null) widget.suffixIcon!,
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimationWidget() {
    switch (widget.hintAnimationType) {
      case HintAnimationType.fade:
        return FadeTransition(
          opacity: _fadeAnimation,
          child: Text(
            widget.hints[_currentIndex],
            style: const TextStyle(fontSize: 16, color: Colors.black),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        );
      case HintAnimationType.slide:
        return SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Text(
              widget.hints[_currentIndex],
              style: const TextStyle(fontSize: 16, color: Colors.black),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        );
      case HintAnimationType.scale:
        return ScaleTransition(
          scale: _scaleAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Text(
              widget.hints[_currentIndex],
              style: const TextStyle(fontSize: 16, color: Colors.black),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        );
      case HintAnimationType.slideFromTop:
        final slideFromTopAnimation = Tween<Offset>(begin: const Offset(0.0, -1.0), end: Offset.zero).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
        return SlideTransition(
          position: slideFromTopAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Text(
              widget.hints[_currentIndex],
              style: const TextStyle(fontSize: 16, color: Colors.black),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        );
      case HintAnimationType.slideFromBottom:
        final slideFromBottomAnimation = Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
        return SlideTransition(
          position: slideFromBottomAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Text(
              widget.hints[_currentIndex],
              style: const TextStyle(fontSize: 16, color: Colors.black),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        );
      case HintAnimationType.topToBottom:
        return _buildCircularScrollingAnimation(const Offset(0, -1), const Offset(0, 1));
      case HintAnimationType.bottomToTop:
        return _buildCircularScrollingAnimation(const Offset(0, 1), const Offset(0, -1));
    }
  }

  Widget _buildCircularScrollingAnimation(Offset begin, Offset end) {
    final circularAnimation = Tween<Offset>(
      begin: begin,
      end: end,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));

    return SlideTransition(
      position: circularAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Text(
          widget.hints[_currentIndex],
          style: widget.hintStyleForAnimatedHint ?? const TextStyle(fontSize: 16, color: Colors.grey),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    );
  }
}

class CircularAnimatedHintTextField extends StatefulWidget {
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final Border? border;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final TextStyle? hintStyleForStatic;
  final TextStyle? hintStyleForAnimatedHint;
  final String? staticSearchText;
  final bool showHintWhenTyping;
  final bool animateEntireHint;
  final double? borderWidth;
  final bool autoFocus;
  final InputDecoration? inputDecoration;
  final Color? isFocusedBorderColor;
  final Color? unFocusedBorderColor;
  final List<String> hints;

  const CircularAnimatedHintTextField({
    super.key,
    this.backgroundColor,
    this.borderRadius,
    this.border,
    this.prefixIcon,
    this.suffixIcon,
    this.hintStyleForStatic,
    this.staticSearchText,
    this.showHintWhenTyping = false,
    this.animateEntireHint = true,
    this.borderWidth,
    this.autoFocus = false,
    this.inputDecoration,
    this.isFocusedBorderColor,
    this.unFocusedBorderColor,
    required this.hints,
    this.hintStyleForAnimatedHint,
  });

  @override
  State<CircularAnimatedHintTextField> createState() => _CircularAnimatedHintTextFieldState();
}

class _CircularAnimatedHintTextFieldState extends State<CircularAnimatedHintTextField> {
  final TextEditingController _controller = TextEditingController();
  late final List<String> _cyclicHints;
  final FixedExtentScrollController _scrollController = FixedExtentScrollController();
  int _currentIndex = 0;
  bool isUserTyping = false;
  bool _isFocused = false;
  bool _isCyclingHints = true;

  @override
  void initState() {
    super.initState();
    _cyclicHints = [...widget.hints, ...widget.hints];
    _startAutoScroll();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  /// Start auto-scrolling the hints every 2 seconds
  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 2), () {
      if (_currentIndex < _cyclicHints.length - 1) {
        _currentIndex++;
      } else {
        // Reset the index when reaching the end, creating a seamless loop
        _currentIndex = widget.hints.length;
        _scrollController.jumpToItem(_currentIndex); // Set position to middle of list
      }

      // Animate to the new hint smoothly
      _scrollController
          .animateToItem(
            _currentIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          )
          .then((_) => _startAutoScroll()); // Continue scrolling after animation completes
    });
  }

  /// Listen to text input changes
  void _onTextChanged() {
    setState(() {
      isUserTyping = _controller.text.isNotEmpty;
      _isCyclingHints = !isUserTyping;
    });

    if (isUserTyping) {
      // Pause cycling when typing starts
      _scrollController.jumpToItem(_currentIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.grey[200],
        borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
        border: widget.border ??
            Border.all(
              color: _isFocused ? widget.isFocusedBorderColor ?? Colors.blue : widget.unFocusedBorderColor ?? Colors.grey[300]!,
              width: widget.borderWidth ?? 1.0,
            ),
      ),
      child: FocusScope(
        child: Focus(
          onFocusChange: (focus) {
            setState(() {
              _isFocused = focus;
            });
          },
          child: Row(
            children: [
              if (widget.prefixIcon != null) widget.prefixIcon!,
              const SizedBox(width: 8),
              Expanded(
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    // Show hints when not typing
                    if (!isUserTyping || widget.showHintWhenTyping)
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: Row(
                          key: ValueKey<int>(_currentIndex),
                          children: [
                            // Display static text if any
                            if (widget.staticSearchText != null)
                              Text(
                                widget.staticSearchText!,
                                style: widget.hintStyleForStatic ?? const TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            // Show hint cycling when typing is not happening
                            if (!isUserTyping)
                              Flexible(
                                child: SizedBox(
                                  height: 50,
                                  child: ListWheelScrollView.useDelegate(
                                    controller: _scrollController,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemExtent: 50,
                                    overAndUnderCenterOpacity: 0.5,
                                    perspective: 0.003,
                                    childDelegate: ListWheelChildBuilderDelegate(
                                      builder: (context, index) {
                                        return Row(
                                          children: [
                                            Text(
                                              // widget.foodHints[index],
                                              widget.hints[index % widget.hints.length],
                                              style: widget.hintStyleForAnimatedHint ??
                                                  const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        );
                                      },
                                      childCount: widget.hints.length * 2,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    // Input field is always active
                    TextField(
                      textInputAction: TextInputAction.done,
                      controller: _controller,
                      autofocus: widget.autoFocus,
                      decoration: widget.inputDecoration?.copyWith(
                            hintText: '',
                            border: InputBorder.none,
                          ) ??
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ],
                ),
              ),
              if (widget.suffixIcon != null) widget.suffixIcon!,
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}
