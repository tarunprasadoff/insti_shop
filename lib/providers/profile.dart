import 'package:flutter/cupertino.dart';

class Profile with ChangeNotifier {
  String phoneNumber = 'xxxx-xxx-xxx';

  static Address tempDefaultAddress =
      Address(roomNumber: 243, hostel: Hostel.ganga);
  static dynamic tempDefaultAddressKey = UniqueKey();

  List<Map<dynamic, Address>> _myAddresses = [
    {tempDefaultAddressKey: tempDefaultAddress},
    {UniqueKey(): Address(roomNumber: 144, hostel: Hostel.sharavati)},
    {UniqueKey(): Address(roomNumber: 3015, hostel: Hostel.cauvery)},
    {UniqueKey(): Address(roomNumber: 212, hostel: Hostel.bhadra)},
    {UniqueKey(): Address(roomNumber: 121, hostel: Hostel.ganga)},
  ];
  dynamic defaultAddressKey = tempDefaultAddressKey;

  void setPhoneNumber(String phNo) {
    phoneNumber = phNo;
    notifyListeners();
  }

  void setDefaultAddress(dynamic key) {
    defaultAddressKey = key;
    notifyListeners();
  }

  void addAddress(Address address) {
    defaultAddressKey = UniqueKey();
    _myAddresses.add({defaultAddressKey: address});
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
    return _myAddresses.firstWhere(
        (element) => element.containsKey(defaultAddressKey))[defaultAddressKey];
  }

  List<Map<dynamic, Address>> get remainingAddresses {
    return _myAddresses
        .where((element) => !element.containsKey(defaultAddressKey))
        .toList();
  }

  String getAddressString(Address myAddress) {
    return 'No.${myAddress.roomNumber}, ${Address(roomNumber: null, hostel: null).hostelDataList[myAddress.hostel]} Hostel, IIT Madras';
  }
}

class Address {
  final int roomNumber;
  final Hostel hostel;

  Address({@required this.roomNumber, @required this.hostel});

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
