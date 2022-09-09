<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# MB Route Transitions 

## Features

This small package allows the developer to handle transitions between pages with ease(In).

## Getting started

This package is really a simple one. You just have to call MBRouteTransitions with a few parameters to transition to another page with zero effor.

## Usage

- Standard and more customisable constructor
```
MBRouteTransitions(
              context: context,
              child: Page2(), 
              animation: AnimationType.fadeIn,
              replacement: false,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInCirc,
              fadeBegin: 0.2,
              fadeEnd: 1,
            );
```

- Easier to use constructor with fewer options
```
MBRouteTransitions.standardTransition(
                context: context, 
                child: Page2(),
            );
```
