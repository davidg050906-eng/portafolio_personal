import 'package:flutter_test/flutter_test.dart';
import 'package:portafolio_personal/main.dart';

void main() {
  testWidgets('PortafolioApp renderiza la pantalla principal',
      (WidgetTester tester) async {
    await tester.pumpWidget(const PortafolioApp());

    expect(find.byType(PortafolioApp), findsOneWidget);
    expect(find.text('David Alejandro González Cárdenas'), findsOneWidget);
  });
}