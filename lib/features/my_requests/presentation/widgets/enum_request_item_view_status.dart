enum EnumRequestItemViewStatus {
  pending,
  accepted,
  rejected,
  unknown;

  //todo  TODO: come Here
  static EnumRequestItemViewStatus byId(int id) {
    switch (id) {
      case 1:
        return EnumRequestItemViewStatus.pending;
      case 2:
        return EnumRequestItemViewStatus.accepted;
      case 3:
        return EnumRequestItemViewStatus.rejected;
      default:
        return EnumRequestItemViewStatus.unknown;
    }
  }
}


/*
تحت الاجراء
مقبول
مرفوض
*/