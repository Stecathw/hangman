import 'package:flutter/material.dart';
import 'package:hangman/utils/colors.dart';
import 'package:hangman/core/components/bold_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
            child: SizedBox(
              width: 250,
              height: 250,
              child: Image.asset('assets/hangman.png'),
            ),
          ),
          SizedBox(
            height: 80,
            width: 150,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(AppColor.primaryColorRed),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/game');
                },
                child:
                    boldTextField(AppLocalizations.of(context)!.play, 28, 3)),
          )
        ]),
      ),
    );
  }
}
