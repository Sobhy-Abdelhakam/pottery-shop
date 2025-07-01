import 'package:flutter/material.dart';

class VodafoneCashInputForm extends StatelessWidget {
  const VodafoneCashInputForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Enter Vodafone Cash Details',
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Phone Number',
            hintText: '010XXXXXXXX',
          ),
          keyboardType: TextInputType.phone,
        ),
      ],
    );
  }
}
