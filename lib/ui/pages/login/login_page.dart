import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:unitask/app/extension/sized_box_extension.dart';
import 'package:unitask/app/extension/snackbar_extension.dart';
import 'package:unitask/app/router/app_page.dart';
import 'package:unitask/core/models/result.dart';
import 'package:unitask/features/auth/auth_provider.dart';
import 'package:unitask/ui/common/label_text_filed.dart';
import 'package:unitask/ui/pages/signup/signup_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _emailController = .new();
  final TextEditingController _pwController = .new();

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  Future<void> _onLogin() async {
    final email = _emailController.text.trim();
    final password = _pwController.text.trim();

    // 이메일/비밀번호 빈 값 검증
    if (email.isEmpty || password.isEmpty) {
      return context.showSnackbar('이메일 또는 비밀번호를 입력해주세요', isError: true);
    }

    final result = await ref
        .read(authProvider.notifier)
        .login(email: email, password: password);

    switch (result) {
      case Success():
        if (mounted) context.goNamed(AppPage.home.name);
      case Failure(:final exception):
        if (mounted) {
          context.showSnackbar(exception.toString(), isError: true);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(authProvider).isLoading;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(LucideIcons.graduationCap, size: 50),
                const Text(
                  'UniTask',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const Text('과제 관리를 스마트하게'),
                50.heightBox,
                LabelTextFiled(
                  controller: _emailController,
                  label: '이메일',
                  hintText: 'example@university.edu',
                  icon: LucideIcons.mail,
                ),
                20.heightBox,
                LabelTextFiled(
                  controller: _pwController,
                  label: '비밀번호',
                  hintText: '0000000',
                  icon: LucideIcons.lockKeyhole,
                  obscureText: true,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('비밀번호 찾기'),
                  ),
                ),
                20.heightBox,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: loading ? null : _onLogin,
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    child: loading
                        ? const SizedBox.square(
                            dimension: 30,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            '로그인',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                  ),
                ),
                20.heightBox,
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    SizedBox(width: 8),
                    Text('또는', style: TextStyle(color: Colors.grey)),
                    SizedBox(width: 8),
                    Expanded(child: Divider()),
                  ],
                ),
                20.heightBox,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('계정이 없으신가요? '),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupPage(),
                          ),
                        );
                      },
                      child: const Text('회원가입'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
