import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:unitask/app/extension/snackbar_extension.dart';
import 'package:unitask/core/models/result.dart';
import 'package:unitask/features/auth/auth_provider.dart';
import 'package:unitask/ui/common/label_text_filed.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final TextEditingController _nameController = .new();
  final TextEditingController _emailController = .new();
  final TextEditingController _passwordController = .new();
  final TextEditingController _passwordConfirmController = .new();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  Future<void> _onSignup() async {
    debugPrint('계정 만들기');

    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final passwordConfirm = _passwordConfirmController.text.trim();

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        passwordConfirm.isEmpty) {
      context.showSnackbar('모든 값을 입력해주세요.', isError: true);
      return;
    }

    if (!email.endsWith('@daelim.ac.kr')) {
      context.showSnackbar('대림대학교 이메일 형식으로 입력해주세요.', isError: true);
      return;
    }

    if (password != passwordConfirm) {
      context.showSnackbar('비밀번호가 일치하지 않습니다.', isError: true);
      return;
    }

    final result = await ref
        .read(authProvider.notifier)
        .signup(email: email, password: password, name: name);

    switch (result) {
      case Success():
        if (mounted) context.pop();
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
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          '회원가입',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 25,
            children: [
              LabelTextFiled(
                controller: _nameController,
                label: '이름',
                hintText: '홍길동',
                icon: LucideIcons.userRoundPen,
              ),
              LabelTextFiled(
                controller: _emailController,
                label: '이메일',
                hintText: '202230136@daelim.ac.kr',
                icon: LucideIcons.mail,
              ),
              LabelTextFiled(
                controller: _passwordController,
                label: '비밀번호',
                hintText: '********',
                icon: LucideIcons.lockKeyhole,
                obscureText: true,
              ),
              LabelTextFiled(
                controller: _passwordConfirmController,
                label: '비밀번호 확인',
                hintText: '********',
                icon: LucideIcons.circleCheckBig,
                obscureText: true,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: loading ? null : _onSignup,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  child: loading
                      ? const SizedBox.square(
                          dimension: 30,
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : const Text(
                          '계정 만들기',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
