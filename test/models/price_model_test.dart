import 'package:ecom_app/models/price_model.dart';
import 'package:test/test.dart';

void main() {
  test('fromJson should return a PriceModel from a JSON argument', () {
    const mockData = {"amount": "45.00", "currency": "GBP"};

    final expectation = new PriceModel(
      amount: mockData['amount'],
      currency: mockData['currency'],
    );

    final result = PriceModel.fromJson(mockData);

    expect(result.toString(), expectation.toString());
  });
}
