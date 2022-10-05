import 'package:ichat/src/extensions/extensions.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const id = '/auth';
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Text(
              """Enter your phone number""",
              style: GoogleFonts.lato(
                color: black,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ).align(alignment: Alignment.topCenter),
            const SizedBox(height: 20),
            Text(
              """Please confirm your region and enter your phone number.""",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: grey,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            )
                .align(alignment: Alignment.topCenter)
                .paddingSymmetric(horizontal: 30),
            const SizedBox(height: 80),
            Form(
                child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: GoogleFonts.lato(
                      color: grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    prefixIcon: const Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ).paddingSymmetric(horizontal: 40)
              ],
            )),
            const SizedBox(height: 80),
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
