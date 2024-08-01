import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context){
    ScaffoldMessenger.of(context).clearSnackBars();
     final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );
    
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context){
    showDialog(context: context, builder: (context) =>  AlertDialog(
      title: const Text('Estas Seguro?'),
      content: const Text('Estas seguro que deseas eliminar?'),
      actions: [
        TextButton(onPressed: () => context.pop(), 
        child: const Text("Cancelar")),

        FilledButton(onPressed: () {
          Navigator.of(context).pop();
        }, 
        child: const Text("Aceptar"))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                    'Hola mundo'
                  )
                ]);
              },
              child: const Text('Licencias Usadas')),
           FilledButton(
            onPressed: ()=> openDialog(context),
            child: const Text('Mostrar diálogo')),
            ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/');
            },
            child: const Text('Ir al inicio'),
          ),],
            
        ),
        ),
      
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context), 
      ),
    );
  }
}