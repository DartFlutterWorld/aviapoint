class CompanyShortInfo {
  final String? name;
  final String? shortName;
  final String? inn;
  final String? ogrn;
  final String? kpp;
  final String? address;
  final String? status;
  final String? type;
  final String? manager;
  final String? generalDirector;
  final String? email;
  final String? phone;
  final String? site;

  const CompanyShortInfo({
    this.name,
    this.shortName,
    this.inn,
    this.ogrn,
    this.kpp,
    this.address,
    this.status,
    this.type,
    this.manager,
    this.generalDirector,
    this.email,
    this.phone,
    this.site,
  });

  bool get isEmpty {
    return [
      name,
      shortName,
      inn,
      ogrn,
      kpp,
      address,
      status,
      type,
      manager,
      generalDirector,
      email,
      phone,
      site,
    ].every((value) => value == null || value.isEmpty);
  }
}
