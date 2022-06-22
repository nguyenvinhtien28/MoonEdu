import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sakura_base/presentation/view_models/user/user_info_view_model.dart';
import 'package:flutter_sakura_base/presentation/widgets/atom/botom_navigation_bar/item_botom_navigation_one.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/const/constants.dart';
import '../../../route/router.dart';
import '../../../widgets/atom/button/button.dart';
import '../../../widgets/atom/glass_morphism_text_area/glass_morphism_text_area.dart';
import '../../../widgets/atom/text_view.dart';

class ChangePasswordPage extends HookConsumerWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isNotification = useState(false);
    final formKey = GlobalKey<FormState>();
    final router = useRouter();
    final changePasswordProvider = ref.read(userViewModelProvider);
    String? oldPassword;
    String? newPassword;
    String? confirmPassword;

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
                onSaved: (value) {
                  oldPassword = value;
                },
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
                icon: Icons.lock_outline,
                obscureText: true,
                onSaved: (value) {
                  confirmPassword = value;
                },
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
                icon: Icons.lock_outline,
                obscureText: true,
                onSaved: (value) {
                  newPassword = value;
                },
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              isNotification.value? const TextView(
                      "Mật khẩu không khớp",
                      fontSize: 14,
                      fontColor: FontColor.red,
                    )
                  : Container(),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Button(
                Messages.change,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (confirmPassword == newPassword) {
                      changePasswordProvider.oldPassword = oldPassword!;
                      changePasswordProvider.newPassword = newPassword!;
                      changePasswordProvider.changePassword();
                    } else {
                      isNotification.value = true;
                    }
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
