import 'package:flutter_test/flutter_test.dart';
import 'package:company_obligations_app/app/app.dart';

void main() {
  testWidgets('Exibe a tela inicial', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('Dashboard'), findsOneWidget);
  });
}