import 'dart:async';

class Invoice {
  final String monthYear;
  final int amount;
  final String paidStatus;
  final String month;
  final String year;
  final String pay;
  final bool showInvoice;

  const Invoice(
      {this.monthYear,
      this.amount,
      this.paidStatus,
      this.month,
      this.year,
      this.pay,
      this.showInvoice});

  Invoice.fromMap(Map<String, dynamic> map)
      : monthYear = map['monthyear'],
        amount = map['amount'],
        paidStatus = map['paid_status'],
        month = getMonth(map['monthyear']),
        year = yearThai(map['monthyear']),
        pay = payWithInDay(),
        showInvoice = calInvoice(map['monthyear']);
}

abstract class InvoiceRepository {
  Future<List<Invoice>> fetch();
}

class FetchDataException implements Exception {
  String _message;

  FetchDataException(this._message);

  String toString() {
    return "Exception: $_message";
  }
}

calInvoice(String monthYear) {
  DateTime now = new DateTime.now();
  var onMonth = monthYear.substring(0, 2);
  var month = int.parse(onMonth);
  var year = int.parse(monthYear.substring(2, 6));
  var currentMonth = now.month;
  var currentYear = (now.year + 543);

  if (currentMonth == month && currentYear == year) {
    return true;
  } else {
    return false;
  }
}

payWithInDay() {
  DateTime now = new DateTime.now();
  DateTime lastDayOfMonth = new DateTime(now.year, now.month + 1, 0);

  return "${lastDayOfMonth.day} ${monthThai(lastDayOfMonth.month)} ${(now.year + 543)}";
}

getMonth(String monthYear) {
  monthYear = monthYear.substring(0, 2);
  var month = int.parse(monthYear);
  return monthThai(month);
}

yearThai(String monthYear) {
  return monthYear.substring(2, 6);
}

monthThai(int month) {
  switch (month) {
    case 1:
      return 'ม.ค.';
      break;
    case 2:
      return 'ก.พ.';
      break;
    case 3:
      return 'มี.ค.';
      break;
    case 4:
      return 'เม.ย.';
      break;
    case 5:
      return 'พ.ค.';
      break;
    case 6:
      return 'มิ.ย.';
      break;
    case 7:
      return 'ก.ค.';
      break;
    case 8:
      return 'ส.ค.';
      break;
    case 9:
      return 'ก.ย.';
      break;
    case 10:
      return 'ต.ค.';
      break;
    case 11:
      return 'พ.ย.';
      break;
    case 12:
      return 'ธ.ค.';
      break;
    default:
  }
}
