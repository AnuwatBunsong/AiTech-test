import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cremation/model/invoice_model.dart';

class InvoiceListRepository {
  final JsonDecoder _decoder = new JsonDecoder();
  List data;

  Future<List<Invoice>> fetch(
      int status, String token, int page, int size) async {
    final response = await http.get(
        'https://chapanakij.kar-pool.co/api/v1/c/me/invoices?size=$size&page=$page&paid=$status&reverse=true&sort=invmonyear&last_year=false',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    final jsonBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      throw new FetchDataException(
          "Error while getting invoice [StatusCode:$statusCode, Error:${response.reasonPhrase}]");
    }

    final contactsContainer = _decoder.convert(jsonBody);
    final List contactItems = contactsContainer['entities'];

    data = contactItems;

    return data.map((contactRaw) => Invoice.fromMap(contactRaw)).toList();
  }
}
