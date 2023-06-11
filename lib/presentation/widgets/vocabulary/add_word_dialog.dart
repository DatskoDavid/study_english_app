import 'package:flutter/material.dart';

import '../../../data/data_handler.dart';
import '../../../data/datasources/word_datasource.dart';

class AddWordDialog extends StatefulWidget {
  const AddWordDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<AddWordDialog> createState() => _AddWordDialogState();
}

class _AddWordDialogState extends State<AddWordDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _wordController = TextEditingController();

  bool wordIsCorrect = true;
  String incorrectWord = '';

  Future checkWord(String word) async {
    await WordsDatsource.getWord(word).then(
      (value) {
        wordIsCorrect = true;
      },
    ).onError(
      (error, stackTrace) {
        wordIsCorrect = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Input word'),
      content: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: TextFormField(
          controller: _wordController,
          onChanged: (value) {
            if (!wordIsCorrect && incorrectWord != value) {
              wordIsCorrect = true;
            }
          },
          decoration: InputDecoration(
            hintText: 'Enter here...',
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            } else if (!value.contains(RegExp(r'^[a-z]+$'))) {
              return 'Word must contain only letters';
            } else if (!wordIsCorrect) {
              incorrectWord = value;
              return 'Word is incorrect';
            } else {
              return null;
            }
          },
        ),
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 66, 143, 68),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () async {
                  await checkWord(_wordController.text);
                  if (_formKey.currentState!.validate()) {
                    DataHandler.addWordWorkflow(_wordController.text);
                    // FirestoreDatabase().addWord()
                    Navigator.pop(context);
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
