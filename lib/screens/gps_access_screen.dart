import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app/blocs/blocs.dart';

class GpsAccessScreen extends StatelessWidget {
  const GpsAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          return !state.isGpsEnabled
              ? const _EnableGpsMessage()
              : const _AccesButton();
        },
      )),
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage();

  @override
  Widget build(BuildContext context) {
    return const Text('Debe de habilitar el gps',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300));
  }
}

class _AccesButton extends StatelessWidget {
  const _AccesButton();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Es necesario el acceso al gps'),
        FilledButton(
          onPressed: () {
            final gpsBloc = BlocProvider.of<GpsBloc>(context);
            gpsBloc.askGpsAccess();
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)),
          child: const Text('Solicitar acceso',
              style: TextStyle(color: Colors.white)),
        )
      ],
    );
  }
}
