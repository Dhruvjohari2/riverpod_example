import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivierpod_app/main.dart';


class MyHomeScreen extends ConsumerWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(fetchUserProvider).when(data: (data) {
      return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Center(
              child: Text(data.name),
            )
          ],
        ),
      );
    }, error: (error, stackTrace) {
      return const Center(
        child: Text('An Error has Occurred'),
      );
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}


// class MyHomeScreen extends ConsumerWidget {
//   const MyHomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final user = ref.watch(userProvider);
//     // final name = ref.watch(nameProvider);
//     // final age = ref.watch(ageProvider);
//     final profression = ref.watch(profressionProvider);
//
//     // changeNotifier
//     final user = ref.watch(userChangeNotifierProvider).user;
//
//     return Scaffold(
//       appBar: AppBar(title: Text(user.name)),
//       body: Column(
//         children: [
//           Center(
//             child: Text(user.name),
//           ),
//           TextField(
//             onSubmitted: (value) {
//               // ref.read(userProvider.notifier).updateName(value);
//               ref.read(userChangeNotifierProvider).updateAge(int.p(value));
//             },
//             // onSubmitted: (value) {
//             //   ref.read(nameProvider.notifier).update((state) => value);
//             // },
//           ),
//           Center(
//             child: Text(user.age.toString()),
//           ),
//           Center(
//             child: Text(profression),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MyHomeScreen extends StatelessWidget {
//   const MyHomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(),
//       body: Consumer(
//         builder: (context,ref,child) {
//           final name = ref.watch(nameProvider);
//           final age = ref.watch(ageProvider);
//           return Column(
//             children: [
//               Center(
//                 child: Text(name),
//               ),
//               Center(
//                 child: Text(age.toString()),
//               ),
//             ],
//           );
//         }
//       ),
//     );
//   }
// }
