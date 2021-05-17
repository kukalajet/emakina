import 'package:color_repository/color_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:fuel_repository/fuel_repository.dart';
import 'package:http/http.dart' as http;
import 'package:listing_repository/src/models/models.dart';
import 'package:location_repository/location_repository.dart';
import 'package:manufacturer_repository/manufacturer_repository.dart';
import 'package:model_repository/model_repository.dart';
import 'package:plate_repository/plate_repository.dart';
import 'package:transmission_repository/transmission_repository.dart';
import 'package:valute_repository/valute_repository.dart';
import 'package:vehicle_type_repository/vehicle_type_repository.dart';

class ListingRepository {
  ListingRepository({@required this.httpClient});

  final http.Client httpClient;

  static Listing sample() {
    return Listing(
      id: 0,
      title: "FORD FOCUS TITANIUM SPORT, 2014 , MANUAL , 1.6 NAFTE",
      description: '''FORD FOCUS TITANIUM SPORT
✅VITI 2014
✅MOTORRI 1.6 NAFTE TEPER EKONOMIK ( KONSUMI NE QYTET 4.6 LITRA )
✅KAMBIO MANUALE
✅KM 119.000 ME LIBER SHERBIMESH
✅OPSIONET : FENERE XENON - BI XENON - CD- AUX - USB - ESP - OPSIONE NE TIMON - KLIMA - XHAMA DHE PASQYRA ELEKTRIKE - KOMPJUTER BORDI - MBYLLJE QENDRORE ME PULT , 2 CELESA ORIGJINAL ETJ....
✅NE GJENDJE PERFEKTE MOTORRIKE DHE XHENERIKE. MAKINA ESHTE BLERE NE SALLON.
✅ME DOGANE TE PAGUAR. E SAPOARDHUR
✅CMIMI 7790 EURO
✅INFO : 0692765740
PER ME SHUME INFO NE FACEBOOK :
https://www.facebook.com/AutoclassTirana/
DHE INSTAGRAM :
https://www.instagram.com/auto__class/''',
      type: VehicleType(id: 0, name: 'Sedan'),
      transmission: Transmission(id: 0, type: 'Manual'),
      year: 2014,
      mileage: 110000,
      fuel: Fuel(id: 0, type: 'Dizel/Naftë'),
      images: [
        "https://media.merrjep.al/Image/ead4bcf5-9303-4eae-aa79-30f2ca118b4a/20210506/false/false/1280/960/FORD-FOCUS-TITANIUM-SPORT--2014---MANUAL---1-6-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/b95af5d8-050a-4c8a-b87e-16a449a548eb/20210506/false/false/1280/960/FORD-FOCUS-TITANIUM-SPORT--2014---MANUAL---1-6-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/9321c3c6-0af4-4270-8746-9c2caa4aeacd/20210506/false/false/1280/960/FORD-FOCUS-TITANIUM-SPORT--2014---MANUAL---1-6-NAFTE.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'Të huaja'),
      color: Color(id: 0, name: 'red', code: '#b74093'),
      location: Location(id: 0, name: 'test'),
      manufacturer: Manufacturer(id: 0, name: 'Ford'),
      model: Model(id: 0, name: 'Focus'),
      price: Price(value: 7790, valute: Valute.euro()),
      isFavorite: false,
    );
  }

  final List<Listing> _listings = <Listing>[
    Listing(
      id: 0,
      title: "FORD FOCUS TITANIUM SPORT, 2014 , MANUAL , 1.6 NAFTE",
      description: '''FORD FOCUS TITANIUM SPORT
✅VITI 2014
✅MOTORRI 1.6 NAFTE TEPER EKONOMIK ( KONSUMI NE QYTET 4.6 LITRA )
✅KAMBIO MANUALE
✅KM 119.000 ME LIBER SHERBIMESH
✅OPSIONET : FENERE XENON - BI XENON - CD- AUX - USB - ESP - OPSIONE NE TIMON - KLIMA - XHAMA DHE PASQYRA ELEKTRIKE - KOMPJUTER BORDI - MBYLLJE QENDRORE ME PULT , 2 CELESA ORIGJINAL ETJ....
✅NE GJENDJE PERFEKTE MOTORRIKE DHE XHENERIKE. MAKINA ESHTE BLERE NE SALLON.
✅ME DOGANE TE PAGUAR. E SAPOARDHUR
✅CMIMI 7790 EURO
✅INFO : 0692765740
PER ME SHUME INFO NE FACEBOOK :
https://www.facebook.com/AutoclassTirana/
DHE INSTAGRAM :
https://www.instagram.com/auto__class/''',
      type: VehicleType(id: 0, name: 'Sedan'),
      transmission: Transmission(id: 0, type: 'Manual'),
      year: 2014,
      mileage: 110000,
      fuel: Fuel(id: 0, type: 'Dizel/Naftë'),
      images: [
        "https://media.merrjep.al/Image/ead4bcf5-9303-4eae-aa79-30f2ca118b4a/20210506/false/false/1280/960/FORD-FOCUS-TITANIUM-SPORT--2014---MANUAL---1-6-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/b95af5d8-050a-4c8a-b87e-16a449a548eb/20210506/false/false/1280/960/FORD-FOCUS-TITANIUM-SPORT--2014---MANUAL---1-6-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/9321c3c6-0af4-4270-8746-9c2caa4aeacd/20210506/false/false/1280/960/FORD-FOCUS-TITANIUM-SPORT--2014---MANUAL---1-6-NAFTE.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'Të huaja'),
      color: Color(id: 0, name: 'red', code: '#1589FF'),
      location: Location(id: 0, name: 'test'),
      manufacturer: Manufacturer(id: 0, name: 'Ford'),
      model: Model(id: 0, name: 'Focus'),
      price: Price(value: 7790, valute: Valute.euro()),
      isFavorite: false,
    ),
    Listing(
      id: 1,
      title: "Toyota Yaris 1.4 Nafte 2007 / Start-Stop - Keyless Entry ",
      description: '''Shitet Toyota Yaris 1.4 Nafte 2007
Start Stop - Keyless Entry = ( ndizet me buton, dhe kur i afrohesh makines nuk ka nevoje te shypesh buton per ta hapur thjesht terheq dorezen dhe makina hapet kur e ke celesin ne xhep ose ne dore)
Makina sapo ka ardhur nga Gjermania dhe eshte me dogane te paguar, ndodhet tek ish stacioni i trenit Tirane.
Kambio manuale, gomat i ka shum mire, gjendja xhenerike shume e mire. Kilometrat 218.000 te vetat jo te ulme si 3-ceteku i makinave.
Klima, radio,dhe cdogje tjeter funksionojne ne rregull dhe ska nevoje per asnje riparim.
Motorri dhe kambio funksionojne shume shume mire.
Cmimin mund ta diskutojme por skam asnje lloj emergjence per ta shitur dhe sme duhen leket e ksaj makine domosdoshnerisht keshtu qe ata qe interesohen per 2500€ - 2600€ te shikojne diku tjeter.
Nese dikujt vertete i intereson eshte i mirepritur ta shikoje ne cdokohe..
Numer kontakti : 0697847003 ''',
      type: VehicleType(id: 0, name: 'Veturë e vogël'),
      transmission: Transmission(id: 0, type: 'Manual'),
      year: 2007,
      mileage: 200000,
      fuel: Fuel(id: 0, type: 'Dizel/Naftë'),
      images: [
        "https://media.merrjep.al/Image/9028d295-7fd2-4ea0-8caf-af178b845521/20210506/false/false/1280/960/Toyota-Yaris-1-4-Nafte-2007---Start-Stop---Keyless-Entry.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/6268a3f8-3420-4a41-9e12-7213ea2a18cc/20210506/false/false/1280/960/Toyota-Yaris-1-4-Nafte-2007---Start-Stop---Keyless-Entry.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/3a17df75-f5a1-4dc3-ac08-12137173f67d/20210506/false/false/1280/960/Toyota-Yaris-1-4-Nafte-2007---Start-Stop---Keyless-Entry.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'Shqiptare'),
      color: Color(id: 0, name: 'Gri', code: '#1589FF'),
      location: Location(id: 0, name: 'test'),
      manufacturer: Manufacturer(id: 0, name: 'Toyota'),
      model: Model(id: 0, name: 'Yaris'),
      price: Price(value: 2000, valute: Valute.euro()),
      isFavorite: false,
    ),
    Listing(
      id: 2,
      title: ' Shitet smart nafte ',
      description: '''Shitet smart for two , nafte 800cc
Makina ne gjendje perfekte motorrike dhe xhenerike
e gatshme per cfardo prove.
Makina shitet per arsye mosperdorimi...
Vaj filtra te sapobera, goma te reja.
Shume ekonomike. ''',
      type: VehicleType(id: 0, name: 'Veturë e vogël'),
      transmission: Transmission(id: 0, type: 'Automatik'),
      year: 2000,
      mileage: 90000,
      fuel: Fuel(id: 0, type: 'Dizel/Naftë'),
      images: [
        "https://media.merrjep.al/Image/3aea641d-6d64-4842-bdd2-c2bc3a895b69/20210514/false/false/1280/960/Shitet-smart-nafte.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/650694a0-3f31-4c89-ad2f-c17b6dfa0596/20210514/false/false/1280/960/Shitet-smart-nafte.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/cf23d7ad-4775-4689-b2af-c51df41ea288/20210514/false/false/1280/960/Shitet-smart-nafte.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'Shqiptare'),
      color: Color(id: 0, name: 'Gri', code: '#1589FF'),
      location: Location(id: 0, name: 'Tiranë'),
      manufacturer: Manufacturer(id: 0, name: 'Smart'),
      model: Model(id: 0, name: 'For Two'),
      price: Price(value: 1700, valute: Valute.euro()),
      isFavorite: false,
    ),
    Listing(
      id: 3,
      title: "Golf 6 2.5 74000km",
      description: '''Golf 6 viti 2012
2.5 benzine i pershtatshem 100% per gaz
74000 km
Navi\ 6 CD\ Bluetooth\ memory card USB
Komanda ne timone
Sedilje me ngrohje
4 xhamat e zi
Goma te reja
Makina eshte ne gjendje perfekte
Me dogan gati per targa ''',
      type: VehicleType(id: 0, name: 'Sedan'),
      transmission: Transmission(id: 0, type: 'Automatik'),
      year: 2012,
      mileage: 70000,
      fuel: Fuel(id: 0, type: 'Benzin'),
      images: [
        "https://media.merrjep.al/Image/923b5377-eb11-4f3d-bba4-499392a550c9/20210508/false/false/1280/960/Golf-6-2-5--74000km.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/e4f21be0-f0e7-4b2f-a0cc-e6ba7b7c5c4e/20210508/false/false/1280/960/Golf-6-2-5--74000km.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/7b2d2b22-2857-4403-bb56-c5aedfb08c73/20210508/false/false/1280/960/Golf-6-2-5--74000km.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'Të huaja'),
      color: Color(id: 0, name: 'E bardhë', code: '#1589FF'),
      location: Location(id: 0, name: 'Tiranë'),
      manufacturer: Manufacturer(id: 0, name: 'VW Volkswagen / Golf'),
      model: Model(id: 0, name: 'Golf'),
      price: Price(value: 7500, valute: Valute.euro()),
      isFavorite: false,
    ),
    Listing(
      id: 4,
      title: 'Shitet BMW X1',
      description:
          '''Makina eshte e pajisur me klima,fener origjinal xenon bixenon.
Kilometra origjinale 170000km
1.8 nafte S-drive shume ekonomike.
Navigator te madh multifuksional me iDrive.
Sensor parkimi 180grade.
Kamer parkimi.
Cruise Controle .
Dual Clima.
Strat-Stop(Ndizet me buton).
Eco Mode(Fiket ne semafor).
4 goma te reja michelin korrik 2020.
Cmimi i diskutueshem.
Kontaktoni ne Whatsapp.''',
      type: VehicleType(id: 0, name: 'Sedan'),
      transmission: Transmission(id: 0, type: 'Manual'),
      year: 2010,
      mileage: 170000,
      fuel: Fuel(id: 0, type: 'Dizel/Naftë'),
      images: [
        "https://media.merrjep.al/Image/db1cb04c889443e3814e483df8dffd82/20210425/false/false/1280/960/Shitet-BMW-X1.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/5dd4753b5ff441d3a474fe677548931a/20210425/false/false/1280/960/Shitet-BMW-X1.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/161e92a5f65b4ddf9b27cf4a148f4a54/20210425/false/false/1280/960/Shitet-BMW-X1.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'test'),
      color: Color(id: 0, name: 'red', code: '#1589FF'),
      location: Location(id: 0, name: 'Durres'),
      manufacturer: Manufacturer(id: 0, name: 'BMW / X-modele'),
      model: Model(id: 0, name: 'X1'),
      price: Price(value: 1200000, valute: Valute.leke()),
      isFavorite: false,
    ),
    Listing(
      id: 5,
      title: 'Mercedes benz GLA200 2015',
      description:
          '''Mercedes benz GLA200 , viti prodhimit 2015 me 207 mij km, me dogan paguar gati per targa, i pa perdorur fare ne shqiperi , kambio automatike , cd player ,Bluetooth, kondicioner , disqe alumini , kamera parkime ,sensor parkimi, super ekonomik ne konsum , ne gjendje te mire motorrike dhe xhenerike...

Cmimi:19500€ i diskutushem
Cel:0682140278 ''',
      type: VehicleType(id: 0, name: 'SUV'),
      transmission: Transmission(id: 0, type: 'Automatik'),
      year: 2015,
      mileage: 200000,
      fuel: Fuel(id: 0, type: 'Dizel/Naftë'),
      images: [
        "https://media.merrjep.al/Image/07f33da2-0bd0-481a-8b64-492910839449/20210514/false/false/1280/960/Mercedes-benz-GLA200--2015.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/8fe6e8f0-d668-48bd-b922-f68f0192992e/20210514/false/false/1280/960/Mercedes-benz-GLA200--2015.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/ae62ead9-65d0-40b7-b962-4019b1268fd0/20210514/false/false/1280/960/Mercedes-benz-GLA200--2015.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'Shqiptare'),
      color: Color(id: 0, name: 'E bardhë', code: '#1589FF'),
      location: Location(id: 0, name: 'Fier'),
      manufacturer: Manufacturer(id: 0, name: 'Mercedes-Benz / GLA-Class'),
      model: Model(id: 0, name: 'GLA 200'),
      price: Price(value: 19500, valute: Valute.euro()),
      isFavorite: false,
    ),
    Listing(
      id: 0,
      title: "FORD FOCUS TITANIUM SPORT, 2014 , MANUAL , 1.6 NAFTE",
      description: '''FORD FOCUS TITANIUM SPORT
✅VITI 2014
✅MOTORRI 1.6 NAFTE TEPER EKONOMIK ( KONSUMI NE QYTET 4.6 LITRA )
✅KAMBIO MANUALE
✅KM 119.000 ME LIBER SHERBIMESH
✅OPSIONET : FENERE XENON - BI XENON - CD- AUX - USB - ESP - OPSIONE NE TIMON - KLIMA - XHAMA DHE PASQYRA ELEKTRIKE - KOMPJUTER BORDI - MBYLLJE QENDRORE ME PULT , 2 CELESA ORIGJINAL ETJ....
✅NE GJENDJE PERFEKTE MOTORRIKE DHE XHENERIKE. MAKINA ESHTE BLERE NE SALLON.
✅ME DOGANE TE PAGUAR. E SAPOARDHUR
✅CMIMI 7790 EURO
✅INFO : 0692765740
PER ME SHUME INFO NE FACEBOOK :
https://www.facebook.com/AutoclassTirana/
DHE INSTAGRAM :
https://www.instagram.com/auto__class/''',
      type: VehicleType(id: 0, name: 'Sedan'),
      transmission: Transmission(id: 0, type: 'Manual'),
      year: 2014,
      mileage: 110000,
      fuel: Fuel(id: 0, type: 'Dizel/Naftë'),
      images: [
        "https://media.merrjep.al/Image/ead4bcf5-9303-4eae-aa79-30f2ca118b4a/20210506/false/false/1280/960/FORD-FOCUS-TITANIUM-SPORT--2014---MANUAL---1-6-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/b95af5d8-050a-4c8a-b87e-16a449a548eb/20210506/false/false/1280/960/FORD-FOCUS-TITANIUM-SPORT--2014---MANUAL---1-6-NAFTE.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/9321c3c6-0af4-4270-8746-9c2caa4aeacd/20210506/false/false/1280/960/FORD-FOCUS-TITANIUM-SPORT--2014---MANUAL---1-6-NAFTE.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'Të huaja'),
      color: Color(id: 0, name: 'red', code: '#1589FF'),
      location: Location(id: 0, name: 'test'),
      manufacturer: Manufacturer(id: 0, name: 'Ford'),
      model: Model(id: 0, name: 'Focus'),
      price: Price(value: 7790, valute: Valute.euro()),
      isFavorite: false,
    ),
    Listing(
      id: 1,
      title: "Toyota Yaris 1.4 Nafte 2007 / Start-Stop - Keyless Entry ",
      description: '''Shitet Toyota Yaris 1.4 Nafte 2007
Start Stop - Keyless Entry = ( ndizet me buton, dhe kur i afrohesh makines nuk ka nevoje te shypesh buton per ta hapur thjesht terheq dorezen dhe makina hapet kur e ke celesin ne xhep ose ne dore)
Makina sapo ka ardhur nga Gjermania dhe eshte me dogane te paguar, ndodhet tek ish stacioni i trenit Tirane.
Kambio manuale, gomat i ka shum mire, gjendja xhenerike shume e mire. Kilometrat 218.000 te vetat jo te ulme si 3-ceteku i makinave.
Klima, radio,dhe cdogje tjeter funksionojne ne rregull dhe ska nevoje per asnje riparim.
Motorri dhe kambio funksionojne shume shume mire.
Cmimin mund ta diskutojme por skam asnje lloj emergjence per ta shitur dhe sme duhen leket e ksaj makine domosdoshnerisht keshtu qe ata qe interesohen per 2500€ - 2600€ te shikojne diku tjeter.
Nese dikujt vertete i intereson eshte i mirepritur ta shikoje ne cdokohe..
Numer kontakti : 0697847003 ''',
      type: VehicleType(id: 0, name: 'Veturë e vogël'),
      transmission: Transmission(id: 0, type: 'Manual'),
      year: 2007,
      mileage: 200000,
      fuel: Fuel(id: 0, type: 'Dizel/Naftë'),
      images: [
        "https://media.merrjep.al/Image/9028d295-7fd2-4ea0-8caf-af178b845521/20210506/false/false/1280/960/Toyota-Yaris-1-4-Nafte-2007---Start-Stop---Keyless-Entry.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/6268a3f8-3420-4a41-9e12-7213ea2a18cc/20210506/false/false/1280/960/Toyota-Yaris-1-4-Nafte-2007---Start-Stop---Keyless-Entry.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/3a17df75-f5a1-4dc3-ac08-12137173f67d/20210506/false/false/1280/960/Toyota-Yaris-1-4-Nafte-2007---Start-Stop---Keyless-Entry.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'Shqiptare'),
      color: Color(id: 0, name: 'Gri', code: '#1589FF'),
      location: Location(id: 0, name: 'test'),
      manufacturer: Manufacturer(id: 0, name: 'Toyota'),
      model: Model(id: 0, name: 'Yaris'),
      price: Price(value: 2000, valute: Valute.euro()),
      isFavorite: false,
    ),
    Listing(
      id: 2,
      title: ' Shitet smart nafte ',
      description: '''Shitet smart for two , nafte 800cc
Makina ne gjendje perfekte motorrike dhe xhenerike
e gatshme per cfardo prove.
Makina shitet per arsye mosperdorimi...
Vaj filtra te sapobera, goma te reja.
Shume ekonomike. ''',
      type: VehicleType(id: 0, name: 'Veturë e vogël'),
      transmission: Transmission(id: 0, type: 'Automatik'),
      year: 2000,
      mileage: 90000,
      fuel: Fuel(id: 0, type: 'Dizel/Naftë'),
      images: [
        "https://media.merrjep.al/Image/3aea641d-6d64-4842-bdd2-c2bc3a895b69/20210514/false/false/1280/960/Shitet-smart-nafte.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/650694a0-3f31-4c89-ad2f-c17b6dfa0596/20210514/false/false/1280/960/Shitet-smart-nafte.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/cf23d7ad-4775-4689-b2af-c51df41ea288/20210514/false/false/1280/960/Shitet-smart-nafte.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'Shqiptare'),
      color: Color(id: 0, name: 'Gri', code: '#1589FF'),
      location: Location(id: 0, name: 'Tiranë'),
      manufacturer: Manufacturer(id: 0, name: 'Smart'),
      model: Model(id: 0, name: 'For Two'),
      price: Price(value: 1700, valute: Valute.euro()),
      isFavorite: false,
    ),
    Listing(
      id: 3,
      title: "Golf 6 2.5 74000km",
      description: '''Golf 6 viti 2012
2.5 benzine i pershtatshem 100% per gaz
74000 km
Navi\ 6 CD\ Bluetooth\ memory card USB
Komanda ne timone
Sedilje me ngrohje
4 xhamat e zi
Goma te reja
Makina eshte ne gjendje perfekte
Me dogan gati per targa ''',
      type: VehicleType(id: 0, name: 'Sedan'),
      transmission: Transmission(id: 0, type: 'Automatik'),
      year: 2012,
      mileage: 70000,
      fuel: Fuel(id: 0, type: 'Benzin'),
      images: [
        "https://media.merrjep.al/Image/923b5377-eb11-4f3d-bba4-499392a550c9/20210508/false/false/1280/960/Golf-6-2-5--74000km.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/e4f21be0-f0e7-4b2f-a0cc-e6ba7b7c5c4e/20210508/false/false/1280/960/Golf-6-2-5--74000km.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/7b2d2b22-2857-4403-bb56-c5aedfb08c73/20210508/false/false/1280/960/Golf-6-2-5--74000km.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'Të huaja'),
      color: Color(id: 0, name: 'E bardhë', code: '#1589FF'),
      location: Location(id: 0, name: 'Tiranë'),
      manufacturer: Manufacturer(id: 0, name: 'VW Volkswagen / Golf'),
      model: Model(id: 0, name: 'Golf'),
      price: Price(value: 7500, valute: Valute.euro()),
      isFavorite: false,
    ),
    Listing(
      id: 4,
      title: 'Shitet BMW X1',
      description:
          '''Makina eshte e pajisur me klima,fener origjinal xenon bixenon.
Kilometra origjinale 170000km
1.8 nafte S-drive shume ekonomike.
Navigator te madh multifuksional me iDrive.
Sensor parkimi 180grade.
Kamer parkimi.
Cruise Controle .
Dual Clima.
Strat-Stop(Ndizet me buton).
Eco Mode(Fiket ne semafor).
4 goma te reja michelin korrik 2020.
Cmimi i diskutueshem.
Kontaktoni ne Whatsapp.''',
      type: VehicleType(id: 0, name: 'Sedan'),
      transmission: Transmission(id: 0, type: 'Manual'),
      year: 2010,
      mileage: 170000,
      fuel: Fuel(id: 0, type: 'Dizel/Naftë'),
      images: [
        "https://media.merrjep.al/Image/db1cb04c889443e3814e483df8dffd82/20210425/false/false/1280/960/Shitet-BMW-X1.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/5dd4753b5ff441d3a474fe677548931a/20210425/false/false/1280/960/Shitet-BMW-X1.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/161e92a5f65b4ddf9b27cf4a148f4a54/20210425/false/false/1280/960/Shitet-BMW-X1.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'test'),
      color: Color(id: 0, name: 'red', code: '#1589FF'),
      location: Location(id: 0, name: 'Durres'),
      manufacturer: Manufacturer(id: 0, name: 'BMW / X-modele'),
      model: Model(id: 0, name: 'X1'),
      price: Price(value: 1200000, valute: Valute.leke()),
      isFavorite: false,
    ),
    Listing(
      id: 5,
      title: 'Mercedes benz GLA200 2015',
      description:
          '''Mercedes benz GLA200 , viti prodhimit 2015 me 207 mij km, me dogan paguar gati per targa, i pa perdorur fare ne shqiperi , kambio automatike , cd player ,Bluetooth, kondicioner , disqe alumini , kamera parkime ,sensor parkimi, super ekonomik ne konsum , ne gjendje te mire motorrike dhe xhenerike...

Cmimi:19500€ i diskutushem
Cel:0682140278 ''',
      type: VehicleType(id: 0, name: 'SUV'),
      transmission: Transmission(id: 0, type: 'Automatik'),
      year: 2015,
      mileage: 200000,
      fuel: Fuel(id: 0, type: 'Dizel/Naftë'),
      images: [
        "https://media.merrjep.al/Image/07f33da2-0bd0-481a-8b64-492910839449/20210514/false/false/1280/960/Mercedes-benz-GLA200--2015.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/8fe6e8f0-d668-48bd-b922-f68f0192992e/20210514/false/false/1280/960/Mercedes-benz-GLA200--2015.jpeg?noLogo=true",
        "https://media.merrjep.al/Image/ae62ead9-65d0-40b7-b962-4019b1268fd0/20210514/false/false/1280/960/Mercedes-benz-GLA200--2015.jpeg?noLogo=true",
      ],
      plate: Plate(id: 0, name: 'Shqiptare'),
      color: Color(id: 0, name: 'E bardhë', code: '#1589FF'),
      location: Location(id: 0, name: 'Fier'),
      manufacturer: Manufacturer(id: 0, name: 'Mercedes-Benz / GLA-Class'),
      model: Model(id: 0, name: 'GLA 200'),
      price: Price(value: 19500, valute: Valute.euro()),
      isFavorite: false,
    ),
  ];

  Future<List<Listing>> fetchListings(int startIndex, int limit) async {
    return startIndex < 40 ? _listings : [];
  }
}
