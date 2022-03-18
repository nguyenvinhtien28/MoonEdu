import 'package:flutter/material.dart';
import 'package:flutter_sakura_base/presentation/widgets/atom/botom_navigation_bar/item_botom_navigation_one.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/const/constants.dart';
import '../../../route/router.dart';
import '../../../widgets/atom/button/button.dart';
import '../../../widgets/atom/glass_morphism_text_area/glass_morphism_text_area.dart';
import '../../../widgets/atom/text_area/text_area.dart';
import '../../../widgets/atom/text_view.dart';

class ChangeEmailPage extends HookConsumerWidget {
  const ChangeEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final router = useRouter();
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: TextView(
                  "Thay đổi mật khẩu",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontColor: AppColors.blue,
                ),
              ),
              const SizedBox(
                height: kDefaultFatPadding,
              ),
              const TextView(Messages.oldPassword,
                  fontSize: 18, fontWeight: FontWeight.bold),
              const SizedBox(
                height: kDefaultExThinPadding,
              ),
              GlassMorphismTextArea(
                hintText: Messages.oldPassword,
                icon: Icons.lock_outline,
                textInputAction: TextInputAction.next,
                onSaved: (value) {},
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              const TextView(Messages.newPassword,
                  fontSize: 18, fontWeight: FontWeight.bold),
              const SizedBox(
                height: kDefaultExThinPadding,
              ),
              GlassMorphismTextArea(
                hintText: Messages.newPassword,
                textType: TextType.email,
                icon: Icons.lock_outline,
                obscureText: true,
                onSaved: (value) {},
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              const TextView(Messages.confirmPassword,
                  fontSize: 18, fontWeight: FontWeight.bold),
              const SizedBox(
                height: kDefaultExThinPadding,
              ),
              GlassMorphismTextArea(
                hintText: Messages.confirmPassword,
                textType: TextType.text,
                icon: Icons.lock_outline,
                obscureText: true,
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
      bottomNavigationBar: ItemBottomNavigationOne(
        onTap: router.pop,
      ),
    );
  }
}
