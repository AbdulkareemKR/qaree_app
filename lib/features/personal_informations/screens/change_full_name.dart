import 'package:Qaree/widgets/loading_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:Qaree/providers/reader_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeFullName extends ConsumerStatefulWidget {
  const ChangeFullName({super.key});

  @override
  ConsumerState<ChangeFullName> createState() => _ChangeFullNameState();
}

class _ChangeFullNameState extends ConsumerState<ChangeFullName> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(readerProvider);

    return user.when(
      data: (user) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Username", //babel text
                hintText: "Enter your email", //hint text
                prefixIcon: Icon(Icons.people), //prefix iocn
                hintStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold), //hint text style
                labelStyle: TextStyle(
                    fontSize: 13, color: Colors.redAccent), //label style
              ),
            ),
          ],
        ),
      ),
      error: (error, stackTrace) => Text("An error Ocurred"),
      loading: () => LoadingContainer(),
    );
  }
}
