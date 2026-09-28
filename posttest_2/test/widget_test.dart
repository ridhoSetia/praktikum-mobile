import 'package:flutter_test/flutter_test.dart';
import 'package:posttest_2/cartPage.dart';
import 'package:posttest_2/main.dart';

void main() {
  testWidgets('App smoke test and navigation test', (WidgetTester tester) async {
    await tester.pumpWidget(const CncStoreApp());
    expect(find.text('cncstore'), findsOneWidget);
    expect(find.text('Keranjang'), findsOneWidget);

    // Tap Keranjang in NavigationBar
    await tester.tap(find.text('Keranjang'));
    await tester.pumpAndSettle();

    // Verify CartPage is displayed
    expect(find.byType(CartPage), findsOneWidget);
    expect(find.text('Keranjang Belanja'), findsOneWidget);
  });
}
