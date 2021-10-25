class TestTile {
  String title;
  int quenum;
  int background;

  TestTile(this.title, this.quenum, this.background);
}

var testData = [
  {
    "title": "TCS NQT 2021 - Paper 1",
    "quenum": 90,
    "background": 0xff1E1E99,
  },
  {
    "title": "TCS NQT 2021 - Paper 2",
    "quenum": 90,
    "background": 0xffff60A7,
  },
  {
    "title": "TCS NQT 2020 - Paper 1",
    "quenum": 90,
    "background": 0xffa500A7,
  }
];

List<TestTile> tests = testData
    .map(
      (e) => TestTile(
        e["title"].toString(),
        e['quenum'] as int,
        e['background'] as int,
      ),
    )
    .toList();
