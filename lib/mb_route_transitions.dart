import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Complex Animation Type
enum AnimationType { fadeIn }

/// Standard Animations
enum AnimationTypeStandard { normal, cupertino }

/// Main class, [context] is the BuildContext of the app at that moment
/// [child] Widget to navigate to
/// [animation] animation of the complex kind
/// [animationStandard] animation of the easier kind
/// [duration] duration of tha animation (only applies to AnimationType animations)
/// [curve] the type of animation you want
class MBRouteTransitions {
  final BuildContext context;
  final Widget child;
  late final AnimationType animation;
  late final Duration duration;
  final bool replacement;
  late final double fadeBegin;
  late final double fadeEnd;
  late final Curve curve;

  late final AnimationTypeStandard animationStandard;

  /// Complex constructor
  MBRouteTransitions({
    this.duration = const Duration(milliseconds: 500),
    required this.context,
    required this.child,
    this.animation = AnimationType.fadeIn,
    this.replacement = false,
    this.curve = Curves.easeInOut,
    this.fadeBegin = 0,
    this.fadeEnd = 1,
  }) {
    switch (animation) {
      case AnimationType.fadeIn:
        _fadeInTransition();
        break;
    }
  }

  /// Easier constructor
  MBRouteTransitions.standardTransition({
    required this.context,
    required this.child,
    this.animationStandard = AnimationTypeStandard.normal,
    this.replacement = false,
  }) {
    switch (animationStandard) {
      case AnimationTypeStandard.normal:
        _normalTransition();
        break;
      case AnimationTypeStandard.cupertino:
        _cupertinoTransition();
        break;
    }
  }

  /// Android-like transitions to a new page
  void _normalTransition() {
    replacement
        ? Navigator.pushReplacement(
            context, MaterialPageRoute(builder: ((context) => child)))
        : Navigator.push(
            context, MaterialPageRoute(builder: ((context) => child)));
  }

  /// Cupertino Transition to new page
  void _cupertinoTransition() {
    replacement
        ? Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: ((context) => child)))
        : Navigator.push(
            context, CupertinoPageRoute(builder: ((context) => child)));
  }

  /// Fade animation controller. Central for more complex animations.
  void _fadeInTransition() {
    final route = PageRouteBuilder(
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: Tween<double>(begin: fadeBegin, end: fadeEnd).animate(
            CurvedAnimation(parent: animation, curve: curve),
          ),
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return child;
      },
    );

    replacement ? _pushReplacementPage(route) : _pushPage(route);
  }

  void _pushPage(Route route) => Navigator.push(context, route);
  void _pushReplacementPage(Route route) =>
      Navigator.pushReplacement(context, route);
}
