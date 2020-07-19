import 'package:flutter/cupertino.dart';

class Profile with ChangeNotifier {
  String phoneNumber = 'xxxx-xxx-xxx';

  static Address tempDefaultAddress =
      Address(name: 'Dual', roomNumber: 243, hostel: Hostel.ganga);
  static dynamic tempDefaultAddressKey = UniqueKey();

  List<Map<dynamic, Address>> _myAddresses = [];
  dynamic defaultAddressKey;

  void setPhoneNumber(String phNo) {
    phoneNumber = phNo;
    notifyListeners();
  }

  void setDefaultAddress(dynamic key) {
    defaultAddressKey = key;
    notifyListeners();
  }

  void addAddress(Address address) {
    dynamic _key = UniqueKey();
    if (_myAddresses.length == 0) {
      defaultAddressKey = _key;
    }
    _myAddresses.add({_key: address});
    notifyListeners();
  }

  void removeAddress(dynamic key) {
    _myAddresses.removeWhere((element) => element.containsKey(key));
    notifyListeners();
  }

  void editAddress(dynamic key, Address address) {
    _myAddresses
        .firstWhere((element) => element.containsKey(key))
        .update(key, (value) => address);
    notifyListeners();
  }

  Address get defaultAddress {
    if (defaultAddressKey == null) {
      return null;
    } else {
      return _myAddresses.firstWhere((element) =>
          element.containsKey(defaultAddressKey))[defaultAddressKey];
    }
  }

  List<Map<dynamic, Address>> get remainingAddresses {
    return _myAddresses
        .where((element) => !element.containsKey(defaultAddressKey))
        .toList();
  }

  String getAddressString(Address myAddress) {
    return '${myAddress.name}, No.${myAddress.roomNumber}, ${Address(name: null, roomNumber: null, hostel: null).hostelDataList[myAddress.hostel]} Hostel, IIT Madras';
  }
}

class Address {
  final String name;
  final int roomNumber;
  final Hostel hostel;

  Address(
      {@required this.name, @required this.roomNumber, @required this.hostel});

  static const Map<Hostel, String> _hostelDataList = const {
    Hostel.ganga: 'Ganga',
    Hostel.jamuna: 'Jamuna',
    Hostel.alakananda: 'Alakananda',
    Hostel.godavari: 'Godavari',
    Hostel.saraswathi: 'Saraswathi',
    Hostel.tapti: 'Tapti',
    Hostel.narmada: 'Narmada',
    Hostel.brahmaputra: 'Brahmaputra',
    Hostel.cauvery: 'Cauvery',
    Hostel.bhadra: 'Bhadra',
    Hostel.tunga: 'Tunga',
    Hostel.pampa: 'Pampa',
    Hostel.sarayu: 'Sarayu',
    Hostel.sharavati: 'Sharavati',
  };

  Map<Hostel, String> get hostelDataList {
    return _hostelDataList;
  }
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
