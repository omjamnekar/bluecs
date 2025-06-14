import 'package:bluecs/views/screens/home.dart';
import 'package:bluecs/views/screens/network.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InitialLoad extends StatefulWidget {
  const InitialLoad({super.key});

  @override
  State<InitialLoad> createState() => _InitialLoadState();
}

class _InitialLoadState extends State<InitialLoad> {
  bool isLoading = true;
  bool isOffline = false;
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  @override
  void initState() {
    super.initState();

    // Check initial connection and start listener
    checkConnection();
    _subscription = Connectivity().onConnectivityChanged.listen((statuses) {
      setState(() {
        isOffline = statuses.contains(ConnectivityResult.none);
      });
    });

    // Simulate initial loading delay
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  Future<void> checkConnection() async {
    final results = await Connectivity().checkConnectivity();
    setState(() {
      isOffline = results.contains(ConnectivityResult.none);
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        layoutBuilder: (currentChild, previousChildren) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ...previousChildren,
              if (currentChild != null) currentChild,
            ],
          );
        },
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: isOffline
            ? const NetworkPage(key: ValueKey('network'))
            : isLoading
                ? const LoadingScreen(key: ValueKey('loading'))
                : const HomePage(key: ValueKey('home')),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "BLUECE.IN",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: 45,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            "loading...",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
