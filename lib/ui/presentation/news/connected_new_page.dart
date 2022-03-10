// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// class ConnectedNewsPage extends HookConsumerWidget {
//   const ConnectedNewsPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final theme = ref.watch(appThemeProvider);
//     final l10n = useL10n();
//     final router = useRouter();
//
//     final user = ref.watch(userViewModelProvider.select((value) => value.user));
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           l10n.news,
//           style: theme.textTheme.h60.bold().rotunda(),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.error),
//             onPressed: () {
//               return showErrorSnackbar(context: context, message: l10n.error);
//             },
//           ),
//           IconButton(
//             icon: CircleAvatar(
//               backgroundImage: profileImageProvider(user?.imageUrl),
//               backgroundColor: Colors.transparent,
//               radius: 12,
//             ),
//             onPressed: () => router.push(const SignInRoute()),
//           )
//         ],
//       ),
//       body: const NewsPage(),
//     );
//   }
// }
