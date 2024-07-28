import 'dart:io';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_test/core/extensions/context_extension.dart';
import 'package:ringo_test/core/extensions/num_extensions.dart';
import 'package:ringo_test/core/router/routing_utils.dart';
import 'package:ringo_test/features/auth/cubit/login_cubit.dart';
import 'package:ringo_test/shared/widgets/primary_textfield.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/resources/resources.dart';
import '../../../shared/widgets/primary_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 80,
            title: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: context.textTheme.displaySmall,
                  ),
                  8.space,
                  Text(
                    'Sign in to your account',
                    style: context.textTheme.headlineSmall
                        ?.copyWith(color: AppColors.darkGrey),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1.25,
                    alignment: Alignment.center,
                    child: FormBuilder(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PrimaryTexfield(
                              name: 'email',
                              onChange: (value) => context
                                  .read<LoginCubit>()
                                  .setEmail(value!.isEmpty ? null : value),
                              title: 'Username / Email',
                              hintText: 'Enter Username or Email here',
                            ),
                            16.space,
                            BlocSelector<LoginCubit, LoginState, bool?>(
                              selector: (state) => state.visiblePass,
                              builder: (context, state) {
                                return PrimaryTexfield(
                                  name: 'password',
                                  title: 'Password',
                                  hintText: 'Enter password here',
                                  obscureText: state != true ? true : false,
                                  maxLines: 1,
                                  suffixIcon: IconButton(
                                      onPressed: () => context
                                          .read<LoginCubit>()
                                          .changePassVisibility(),
                                      icon: state != true
                                          ? SvgPicture.asset(SVGAssets.eyeSlash)
                                          : SvgPicture.asset(SVGAssets.eye)),
                                );
                              },
                            ),
                            16.space,
                            Align(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: Text(
                                  'Forgot Password ?',
                                  style: context.textTheme.bodyLarge
                                      ?.copyWith(color: Colors.black),
                                )),
                            16.space,
                            BlocSelector<LoginCubit, LoginState, String?>(
                              selector: (state) => state.email,
                              builder: (context, state) {
                                return PrimaryButton(
                                  onPressed: state == null
                                      ? null
                                      : () {
                                          RoutingUtils.router
                                              .pushReplacementNamed(
                                                  RoutingUtils.base);
                                        },
                                  title: 'Login',
                                  width: double.infinity,
                                );
                              },
                            ),
                            16.space,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Expanded(
                                    child: Divider(
                                        thickness: 1, endIndent: 11.20)),
                                Text('Or login with account',
                                        style: context.textTheme.bodyLarge!)
                                    .tr(),
                                const Expanded(
                                    child: Divider(thickness: 1, indent: 11.20))
                              ],
                            ),
                            20.space,
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border:
                                      Border.all(color: AppColors.borderColor)),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child:
                                          SvgPicture.asset(SVGAssets.google)),
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Continue with Google',
                                        style: context.textTheme.headlineMedium,
                                      )),
                                ],
                              ),
                            ),
                            16.space,
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border:
                                      Border.all(color: AppColors.borderColor)),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child:
                                          SvgPicture.asset(SVGAssets.facebook)),
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Continue with Facebook',
                                        style: context.textTheme.headlineMedium,
                                      )),
                                ],
                              ),
                            ),
                            16.space,
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border:
                                      Border.all(color: AppColors.borderColor)),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 20,
                                      constraints:
                                          const BoxConstraints(maxWidth: 40),
                                      child: SvgPicture.asset(
                                        SVGAssets.apple,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Continue with Apple',
                                        style: context.textTheme.headlineMedium,
                                      )),
                                ],
                              ),
                            ),
                            26.space,
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Dont’t have an account ? ',
                                      style: context.textTheme.headlineSmall
                                          ?.copyWith(
                                              color: AppColors.hintTextColor)),
                                  TextSpan(
                                    text: 'Register Here',
                                    style: context.textTheme.headlineSmall
                                        ?.copyWith(
                                            color: AppColors.primaryColor),
                                  ),
                                ],
                              ),
                            ),
                            10.space,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
