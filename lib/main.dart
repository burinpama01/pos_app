import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posapp/pages/home.dart';
import 'package:posapp/pages/login_page.dart';
import 'package:posapp/pages/page_login.dart';
import 'package:provider/provider.dart';
import 'bloc//main_bloc.dart';
import 'bloc/authentication_bloc/authentication_bloc.dart';
import 'bloc/external/external_bloc.dart';
import 'bloc/simple_bloc_delegate.dart';
import 'bloc/user_repository.dart';
import 'components/loading_indicator.dart';
import 'components/splash_screen.dart';
import 'notifier/auth_notifier.dart';
import 'notifier/product_notifier.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(
    MyApp(
      userRepository: userRepository,
    ),
  );
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository;

  MyApp({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ExternalBloc>(
          create: (context) => ExternalBloc()
            ..add(
              InitialExternalEvent(),
            ),
        ),
        BlocProvider(
          create: (context) =>
              AuthenticationBloc(userRepository: _userRepository)
                ..add(
                  AuthenticationStarted(),
                ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          // ignore: missing_return
          builder: (context, state) {
            if (state is AuthenticationInitial) {
              return SplashScreen();
            }
            if (state is AuthenticationFailure) {
              return LoginScreen(
                userRepository: _userRepository,
              );
            }
            if (state is AuthenticationSuccess) {
              return HomePage();
            }
          },
        ),
      ),
    );
  }
}
