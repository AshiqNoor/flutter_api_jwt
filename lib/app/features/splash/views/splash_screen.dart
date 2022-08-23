part of splash;

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashProvider>().validateUser();
    });
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: Image.asset(
            ImagePath.logo,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
