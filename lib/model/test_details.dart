class TestDetails {
  String name;
  int totalQue;

  TestDetails({required this.name, required this.totalQue});
}

class MockTest {
  List<TestDetails> tests;

  MockTest({required this.tests});
}
