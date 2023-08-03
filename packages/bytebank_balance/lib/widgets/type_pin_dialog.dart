import 'package:flutter/material.dart';

Future<String?> showPinDialog(BuildContext context,
    {required bool isRegister}) async {
  return showDialog(
    context: context,
    builder: (context) {
      TextEditingController pinController = TextEditingController();
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: (isRegister) ? "Cadastre um " : "Digite o ",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    children: const [
                      TextSpan(
                        text: "PIN de 4 digitos do seu aplicativo",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF47a138),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: pinController,
                  obscureText: true,
                  maxLength: 4,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: false,
                    signed: false,
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, pinController.text);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFF47a138),
                    ),
                  ),
                  child: Text(
                    (isRegister) ? "Cadastrar PIN" : "Autenticar",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
