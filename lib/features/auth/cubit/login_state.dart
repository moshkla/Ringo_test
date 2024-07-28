part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String? email;
  final bool? visiblePass;
  const LoginState({this.email,this.visiblePass});

  @override
  List<Object?> get props => [email,visiblePass];
}
