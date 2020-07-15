import 'package:flutter/cupertino.dart';

class Profile with ChangeNotifier {
  String phoneNumber;
  List<Map<dynamic, Address>> _myAddresses = [];
  Address defaultAddressKey;

  void setPhoneNumber(String phNo) {
    phoneNumber = phNo;
  }

  void setDefaultAddress(dynamic key) {
    defaultAddressKey = key;
  }

  void addAddress(Address address) {
    _myAddresses.add({UniqueKey(): address});
  }

  void removeAddress(dynamic key) {
    _myAddresses.removeWhere((element) => element.containsKey(key));
  }

  void editAddress(dynamic key, Address address) {
    _myAddresses
        .firstWhere((element) => element.containsKey(key))
        .update(key, (value) => address);
  }

  Address get defaultAddress {
    return _myAddresses.firstWhere(
        (element) => element.containsKey(defaultAddressKey))[defaultAddressKey];
  }

  List<Map<dynamic, Address>> get remainingAddresses {
    return _myAddresses
        .where((element) => !element.containsKey(defaultAddressKey))
        .toList();
  }
}

class Address {
  final int roomNumber;
  final Hostel hostel;

  Address({@required this.roomNumber, @required this.hostel});

  static const Map<Hostel, String> hostelDataList = const {
    Hostel.ganga: 'Ganga',
    Hostel.jamuna: 'jamuna',
    Hostel.alakananda: 'alakananda',
    Hostel.godavari: 'godavari',
    Hostel.saraswathi: 'saraswathi',
    Hostel.tapti: 'tapti',
    Hostel.narmada: 'narmada',
    Hostel.brahmaputra: 'brahmaputra',
    Hostel.cauvery: 'cauvery',
    Hostel.bhadra: 'bhadra',
    Hostel.tunga: 'tunga',
    Hostel.pampa: 'pampa',
    Hostel.sarayu: 'sarayu',
    Hostel.sharavati: 'sharavati',
  };
}

enum Hostel {
  ganga,
  jamuna,
  alakananda,
  godavari,
  saraswathi,
  tapti,
  narmada,
  brahmaputra,
  cauvery,
  bhadra,
  tunga,
  pampa,
  sarayu,
  sharavati,
}
