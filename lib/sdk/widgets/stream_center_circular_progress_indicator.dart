import 'package:flutter/material.dart';

class StreamCenterCircularProgressIndicator extends StatelessWidget {
  final Stream<bool> stream;
  const StreamCenterCircularProgressIndicator(this.stream, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: stream,
        initialData: false,
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? const SizedBox()
              : const Center(
                  child: CircularProgressIndicator(
                  strokeWidth: 3,
                ));
        });
  }
}
