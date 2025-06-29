
import 'package:flutter/material.dart';

class QuantityEditDialog extends StatefulWidget {
  final int initialQuantity;

  const QuantityEditDialog({super.key, required this.initialQuantity});

  @override
  State<QuantityEditDialog> createState() => _QuantityEditDialogState();
}

class _QuantityEditDialogState extends State<QuantityEditDialog> {
  late TextEditingController _controller;
  late int _currentQuantity;

  @override
  void initState() {
    super.initState();
    _currentQuantity = widget.initialQuantity;
    _controller = TextEditingController(text: _currentQuantity.toString());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Quantity'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            onChanged: (value) {
              final int? newQuantity = int.tryParse(value);
              if (newQuantity != null && newQuantity > 0 && newQuantity <= 1000) {
                setState(() {
                  _currentQuantity = newQuantity;
                });
              }
            },
          ),
          Slider(
            value: _currentQuantity.toDouble(),
            min: 1,
            max: 1000,
            divisions: 999,
            label: _currentQuantity.toString(),
            onChanged: (double value) {
              setState(() {
                _currentQuantity = value.toInt();
                _controller.text = _currentQuantity.toString();
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  if (_currentQuantity > 1) {
                    setState(() {
                      _currentQuantity--;
                      _controller.text = _currentQuantity.toString();
                    });
                  }
                },
              ),
              Text(_currentQuantity.toString()),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  if (_currentQuantity < 1000) {
                    setState(() {
                      _currentQuantity++;
                      _controller.text = _currentQuantity.toString();
                    });
                  }
                },
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(_currentQuantity),
          child: const Text('Update'),
        ),
      ],
    );
  }
}
