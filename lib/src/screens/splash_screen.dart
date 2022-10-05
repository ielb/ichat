import 'package:ichat/src/extensions/extensions.dart';
import 'package:ichat/src/screens/auth/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ichat',
              style: GoogleFonts.lato(
                color: black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ).align(alignment: Alignment.topCenter),
            const SizedBox(height: 100),
            Image.asset(
              illustration,
              width: 275,
              height: 275,
            ),
            const SizedBox(height: 50),
            Text(
              """Let's talk with your friends and family wherever and whenever""",
              style: GoogleFonts.lato(
                color: grey,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ).paddingSymmetric(horizontal: 50),
            const SizedBox(height: 100),
            GestureDetector(
              onTap: () => context.go(AuthScreen.id),
              child: Container(
                height: 50,
                width: screenSize(context).width * .8,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: black,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: grey.withOpacity(.7),
                          offset: const Offset(1, 5),
                          blurRadius: 15)
                    ]),
                child: Text(
                  "Continue",
                  style: GoogleFonts.lato(color: white, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
