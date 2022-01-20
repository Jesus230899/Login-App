part of home_view;

class _HomeMobile extends StatelessWidget {
  final HomeViewModel vM;

  const _HomeMobile(this.vM);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hola ${vM.user.name}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text("Este es tu token ${vM.user.token}",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 35),
            _btnLogOut(context)
          ],
        ),
      ),
    );
  }

  Widget _btnLogOut(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity * 0.8,
      height: 50,
      child: TextButton(
          onPressed: () => Navigator.pushNamedAndRemoveUntil(context,
              LoginView.routeName, ModalRoute.withName(LoginView.routeName)),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
          child: const Text('Cerrar Sesión',
              style: TextStyle(color: Colors.white, fontSize: 15))),
    );
  }
}
