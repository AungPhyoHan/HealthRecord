import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CustomDropDownWidget extends ConsumerStatefulWidget {
  CustomDropDownWidget(
      {super.key,
      required this.controller,
      required this.sugguestionsCallback,
      required this.hintText});
  final TextEditingController controller;
  FutureOr<Iterable<Object?>> Function(String) sugguestionsCallback;
  final String hintText;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends ConsumerState<CustomDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
        suggestionsBoxDecoration:
            const SuggestionsBoxDecoration(color: Colors.grey),
        textFieldConfiguration: TextFieldConfiguration(
            controller: widget.controller,
            keyboardType: TextInputType.none,
            decoration: InputDecoration(
                hintText: widget.hintText,
                suffixIcon: const Icon(Icons.arrow_drop_down)),
            onTap: () => widget.controller.clear()),
        suggestionsCallback: widget.sugguestionsCallback,
        itemBuilder: (context, itemData) {
          return Padding(
            padding: const EdgeInsets.only(top: 0.5),
            child: ListTile(
              tileColor: Colors.white,
              hoverColor: Colors.white,
              selectedColor: Colors.white,
              title: Text(
                itemData.toString(),
                style: const TextStyle(fontSize: 13, color: Colors.black),
              ),
            ),
          );
        },
        onSuggestionSelected: (value) {
          setState(() {});
          widget.controller.text = value.toString();
        });
  }
}
