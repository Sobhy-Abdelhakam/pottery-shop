import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pottery/feature/checkout/widgets/visa_text_field.dart';

class VisaInputForm extends StatelessWidget {
  const VisaInputForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            VisaTextField(
              label: "Card Number",
              hintText: "XXXX XXXX XXXX XXXX",
              icon: Icons.credit_card,
              inputType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
              ],
            ),
            const SizedBox(height: 16),
            const VisaTextField(
              label: "Card Holder",
              hintText: "John Doe",
              icon: Icons.person_outline,
              inputType: TextInputType.name,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: VisaTextField(
                    label: "Expiry Date",
                    hintText: "MM/YY",
                    icon: Icons.date_range,
                    inputType: TextInputType.datetime,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(5),
                      ExpiryDateFormatter(),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: VisaTextField(
                    label: "CVV",
                    hintText: "123",
                    icon: Icons.lock_outline,
                    inputType: TextInputType.number,
                    obscureText: true,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Formatter for Expiry Date MM/YY
class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    final buffer = StringBuffer();

    for (int i = 0; i < text.length && i < 4; i++) {
      if (i == 2) buffer.write('/');
      buffer.write(text[i]);
    }

    return newValue.copyWith(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}
