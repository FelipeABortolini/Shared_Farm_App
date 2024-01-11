class OrganizeCultureProducts {
  List<Map<String, dynamic>> get(
      List<Map<String, dynamic>> list,
      String? category,
      String activePrinciple,
      String code,
      String quantity,
      double newQtt,
      // double newLocalQtt,
      String unity,
      String product) {
    list.add(
      {
        'active_principle': activePrinciple,
        'category': category,
        'code': code,
        'product': product,
        'quantity': quantity,
        'newQtt': newQtt,
        // 'newLocalQtt': newLocalQtt,
        'unity': unity,
      },
    );
    return list;
  }
}
