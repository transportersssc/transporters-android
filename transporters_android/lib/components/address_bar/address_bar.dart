import 'package:flutter/material.dart';
import 'autocomplete.dart';

class AddressBar extends StatefulWidget {
  final String? place;
  final TextEditingController? controller;
  final String? title;
  const AddressBar({super.key, this.place, this.controller, this.title});

  @override
  State<AddressBar> createState() => _AddressBarState();
}

class _AddressBarState extends State<AddressBar> {
  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AutocompletePlaces()),
    );

    if (!context.mounted) return;

    if (result != null) {
      widget.controller!.text = result;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
          hintText: widget.title,
          suffixIcon: IconButton(
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border_outlined,
              color: isFavorite
                  ? Color.fromARGB(255, 255, 198, 54)
                  : Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          )),
      onTap: () {
        _navigateAndDisplaySelection(context);
      },
    );
  }
}