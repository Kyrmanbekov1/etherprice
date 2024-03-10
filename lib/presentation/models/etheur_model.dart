class EtheurModel {
  String? e;
  int? E;
  String? s;
  int? t;
  String? p;
  String? q;
  int? b;
  int? a;
  int? T;
  bool? m;
  bool? M;

  EtheurModel(
      {this.e,
      this.E,
      this.s,
      this.t,
      this.p,
      this.q,
      this.b,
      this.a,
      this.T,
      this.m,
      this.M});

  EtheurModel.fromJson(Map<String, dynamic> json) {
    e = json['e'];
    e = json['E'];
    s = json['s'];
    t = json['t'];
    p = json['p'];
    q = json['q'];
    b = json['b'];
    a = json['a'];
    t = json['T'];
    m = json['m'];
    m = json['M'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['e'] = this.e;
    data['E'] = this.e;
    data['s'] = this.s;
    data['t'] = this.t;
    data['p'] = this.p;
    data['q'] = this.q;
    data['b'] = this.b;
    data['a'] = this.a;
    data['T'] = this.t;
    data['m'] = this.m;
    data['M'] = this.m;
    return data;
  }


}