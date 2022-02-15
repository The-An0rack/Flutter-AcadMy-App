class UserProfile {
  String name;
  String batch;
  String pic_url;
  late double accuracy;
  List<Map<String, double>> sub_scc;

  UserProfile(this.name, this.batch, this.pic_url, this.sub_scc) {
    double temp = 0;
    for (int i = 0; i < sub_scc.length; i++) {
      temp += sub_scc[i].values.first;
    }
    this.accuracy = temp / sub_scc.length;
  }
}
