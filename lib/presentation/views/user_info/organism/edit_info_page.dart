import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/presentation/widgets/atom/botom_navigation_bar/item_botom_navigation_one.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/const/constants.dart';
import '../../../route/router.dart';
import '../../../widgets/atom/button/button.dart';
import '../../../widgets/atom/glass_morphism_text_area/glass_morphism_text_area.dart';
import '../../../widgets/atom/text_area/text_area.dart';
import '../../../widgets/atom/text_view.dart';

class EditInfoPage extends HookConsumerWidget {
  const EditInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final router = useRouter();
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: TextView(
                    "Cập nhận thông tin",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontColor: AppColors.blue,
                  ),
                ),
                const SizedBox(
                  height: kDefaultFatPadding,
                ),
                const TextView(Messages.userName,
                    fontSize: 18, fontWeight: FontWeight.bold),
                const SizedBox(
                  height: kDefaultExThinPadding,
                ),
                GlassMorphismTextArea(
                  hintText: Messages.password,
                  icon: Icons.lock_outline,
                  textInputAction: TextInputAction.next,
                  onSaved: (value) {},
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                const TextView(Messages.password,
                    fontSize: 18, fontWeight: FontWeight.bold),
                const SizedBox(
                  height: kDefaultExThinPadding,
                ),
                GlassMorphismTextArea(
                  hintText: Messages.newPassword,
                  textType: TextType.email,
                  icon: Icons.lock_outline,
                  onSaved: (value) {},
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                const TextView(Messages.name,
                    fontSize: 18, fontWeight: FontWeight.bold),
                const SizedBox(
                  height: kDefaultExThinPadding,
                ),
                GlassMorphismTextArea(
                  hintText: Messages.name,
                  textType: TextType.text,
                  icon: Icons.lock_outline,
                  onSaved: (value) {},
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                const TextView(Messages.birthday,
                    fontSize: 18, fontWeight: FontWeight.bold),
                const SizedBox(
                  height: kDefaultExThinPadding,
                ),
                GlassMorphismTextArea(
                  hintText: Messages.birthday,
                  textType: TextType.text,
                  icon: Icons.lock_outline,
                  onSaved: (value) {},
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                const TextView(Messages.address,
                    fontSize: 18, fontWeight: FontWeight.bold),
                const SizedBox(
                  height: kDefaultExThinPadding,
                ),
                GlassMorphismTextArea(
                  hintText: Messages.address,
                  textType: TextType.text,
                  icon: Icons.lock_outline,
                  onSaved: (value) {},
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Button(
                  Messages.change,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    }
                  },
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ItemBottomNavigationOne(
        onTap: router.pop,
      ),
    );
  }
}
