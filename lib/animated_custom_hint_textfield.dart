library animated_custom_hint_textfield;

import 'package:flutter/material.dart';

enum HintAnimationType {
  fade,
  slide,
  scale,
  slideFromTop,
  slideFromBottom,
  topToBottom,
  bottomToTop,
}

/// A custom widget that animates hint text in a text field.
class AnimatedHintTextField extends StatefulWidget {
  final List<String> hints;
  final TextEditingController? controller;
  final InputDecoration? inputDecoration;

  /// The style of the animated hint text.
  final TextStyle? animatedHintTextStyle;
  final TextStyle? staticHintTextStyle;
  final Color? fieldBackgroundColor;
  final Duration hintSwitchDuration;
  final bool autoFocus;
  final bool showHintWhenTyping;

  /// Whether to animate the entire hint or not.
  final bool animateHintText;

  /// The hint text displayed in the text field.
  final String? staticHintText;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? fieldBorder;
  final Color? focusedBorderColor;
  final Color? unfocusedBorderColor;
  final double? fieldBorderWidth;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final HintAnimationType hintAnimationType; // Use enum for animation type

  /// Creates an [AnimatedHintTextField].
  const AnimatedHintTextField({
    super.key,
    required this.hints,
    this.controller,
    this.inputDecoration,
    this.animatedHintTextStyle,
    this.fieldBackgroundColor,
    this.hintSwitchDuration = const Duration(seconds: 2),
    this.autoFocus = false,
    this.showHintWhenTyping = false,
    this.animateHintText = true,
    this.staticHintTextStyle,
    this.staticHintText,
    this.borderRadius,
    this.fieldBorder,
    this.focusedBorderColor,
    this.unfocusedBorderColor,
    this.fieldBorderWidth = 1.0,
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
    Future.delayed(widget.hintSwitchDuration, () {
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
        color: widget.fieldBackgroundColor ?? Colors.grey[200],
        borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
        border: widget.fieldBorder ??
            Border.all(
              color: _isFocused ? widget.focusedBorderColor ?? Colors.blue : widget.unfocusedBorderColor ?? Colors.grey[300]!,
              width: widget.fieldBorderWidth ?? 1.0,
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
                            if (!widget.animateHintText)
                              Text(
                                widget.staticHintText ?? "",
                                style: widget.staticHintTextStyle ?? const TextStyle(fontSize: 14, color: Colors.black),
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
          style: widget.animatedHintTextStyle ?? const TextStyle(fontSize: 16, color: Colors.grey),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    );
  }
}

class CircularAnimatedHintTextField extends StatefulWidget {
  final Color? fieldBackgroundColor;
  final BorderRadius? borderRadius;
  final Border? fieldBorder;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final TextStyle? staticHintTextStyle;

  /// The style of the animated hint text.
  final TextStyle? animatedHintTextStyle;

  /// The hint text displayed in the text field.
  final String? staticHintText;
  final bool showHintWhenTyping;

  /// Whether to animate the entire hint or not.
  final bool animateHintText;
  final double? fieldBorderWidth;
  final bool autoFocus;
  final InputDecoration? inputDecoration;
  final Color? focusedBorderColor;
  final Color? unfocusedBorderColor;
  final List<String> hints;

  const CircularAnimatedHintTextField({
    super.key,
    this.fieldBackgroundColor,
    this.borderRadius,
    this.fieldBorder,
    this.prefixIcon,
    this.suffixIcon,
    this.staticHintTextStyle,
    this.staticHintText,
    this.showHintWhenTyping = false,
    this.animateHintText = true,
    this.fieldBorderWidth,
    this.autoFocus = false,
    this.inputDecoration,
    this.focusedBorderColor,
    this.unfocusedBorderColor,
    required this.hints,
    this.animatedHintTextStyle,
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
  bool isCyclingHints = true;

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
      isCyclingHints = !isUserTyping;
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
        color: widget.fieldBackgroundColor ?? Colors.grey[200],
        borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
        border: widget.fieldBorder ??
            Border.all(
              color: _isFocused ? widget.focusedBorderColor ?? Colors.blue : widget.unfocusedBorderColor ?? Colors.grey[300]!,
              width: widget.fieldBorderWidth ?? 1.0,
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
                            if (widget.staticHintText != "")
                              Text(
                                widget.staticHintText ?? "",
                                style: widget.staticHintTextStyle ?? const TextStyle(fontSize: 16, color: Colors.grey),
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
                                              widget.hints[index % widget.hints.length],
                                              style: widget.animatedHintTextStyle ??
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
