import 'package:flutter/material.dart';
import 'package:real_diploma/constants/text_styles.dart';
import 'package:real_diploma/data/datasources/firestore_database.dart';

class DeleteWordDialog extends StatelessWidget {
  final String wordId;

  const DeleteWordDialog({super.key, required this.wordId});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Delete word?',
        style: AppTextStyles.sectionTitle,
        textAlign: TextAlign.center,
      ),
      content: const SizedBox(height: 5),
      actions: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
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
                  backgroundColor: WidgetStateProperty.all<Color>(
                    const Color.fromARGB(255, 207, 83, 89),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () async {
                  FirestoreDatabase().deleteWord(wordId);
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Delete',
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
