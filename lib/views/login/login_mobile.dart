part of login_view;

class _LoginMobile extends StatelessWidget {
  final LoginViewModel vM;

  const _LoginMobile(this.vM);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.black,
            body: _body(context),
          ),
          Visibility(
              visible: vM.loader,
              child: Container(
                color: Colors.black.withOpacity(0.4),
                width: double.infinity,
                height: double.infinity,
                child: const Center(
                    child: CircularProgressIndicator(color: Colors.white)),
              )),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _appName(context),
          _formContainer(context),
        ],
      ),
    );
  }

  Widget _appName(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        children: [
          _itemName('MITHRIL', FontWeight.bold, 10, 30),
          _itemName('TECHNOLOGIES', FontWeight.w400, 4, 14),
        ],
      ),
    );
  }

  Widget _itemName(String name, FontWeight font, double spacing, double size) {
    return Text(name,
        style: TextStyle(
            color: Colors.white,
            fontWeight: font,
            letterSpacing: spacing,
            fontSize: size));
  }

  Widget _formContainer(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          children: [
            const Text('Iniciar Sesión',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
            const SizedBox(height: 20),
            _fields(),
            const SizedBox(height: 15),
            const Divider(),
            const SizedBox(height: 15),
            _btnLogin(context),
          ],
        ));
  }

  Widget _fields() {
    return Form(
      key: vM.formKey,
      autovalidateMode: vM.autoValidateMode,
      child: Column(
        children: [
          TextFormField(
              controller: vM.emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: _decoration('Correo electrónico', false),
              cursorColor: Colors.black,
              validator: emailValidator),
          const SizedBox(height: 15),
          TextFormField(
            controller: vM.passwordController,
            decoration: _decoration('Contraseña', true),
            cursorColor: Colors.black,
            validator: passwordValidator,
            obscureText: vM.obscurePassword,
          ),
        ],
      ),
    );
  }

  Widget _btnLogin(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
          onPressed: () => vM.onPressedLogin(context),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
          child: const Text('Entrar',
              style: TextStyle(color: Colors.white, fontSize: 15))),
    );
  }

  InputDecoration _decoration(String text, bool isPassword) {
    return InputDecoration(
        contentPadding: const EdgeInsets.only(left: 10),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(10)),
        filled: true,
        hintStyle:
            TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),
        hintText: text,
        fillColor: Colors.grey[200],
        suffixIcon: _showPasswordIcon(isPassword));
  }

  Widget _showPasswordIcon(bool isPassword) {
    if (isPassword) {
      if (vM.obscurePassword) {
        return IconButton(
            color: Colors.black,
            onPressed: () => vM.obscurePassword = !vM.obscurePassword,
            icon: const Icon(Icons.visibility_outlined));
      } else {
        return IconButton(
            color: Colors.black,
            onPressed: () => vM.obscurePassword = !vM.obscurePassword,
            icon: const Icon(Icons.visibility_off_outlined));
      }
    } else {
      return null;
    }
  }
}
