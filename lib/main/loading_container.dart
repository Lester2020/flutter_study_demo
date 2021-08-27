import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final bool isCover;
  const LoadingContainer({Key? key, required this.child, required this.isLoading, this.isCover = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !isCover ? (isLoading ? _loadingView : child) : (isLoading ? Stack(
      children: [
        child,
        _loadingView
      ],
    ) : child);
  }

  Widget get _loadingView {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
