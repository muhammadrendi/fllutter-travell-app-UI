class Place {
  final String? title, imageResource, description;

  Place(this.title, this.imageResource, this.description);
}

List<Place> places = [
  Place(
    'Grand Tetons',
    'assets/images/travell01.jpg',
    'Grand Teton National Park is an American national park in northwestern Wyoming. At approximately 310,000 acres (480 sq mi; 130,000 ha; 1,300 km2),includes the major peaks of the 40-mile-long (64 km).',
  ),
  Place(
    'Nusa Penida Island',
    'assets/images/travell02.jpg',
    'Nusa Penida is an island southeast of Indonesias island Bali and a district of Klungkung Regency that includes the neighbouring small island of Nusa Lembongan and twelve even smaller islands. ',
  ),
  Place(
    'Penglipuran Village',
    'assets/images/travell03.jpg',
    'Penglipuran Village is of the traditional villages located in Bangli Regency, Bali, Indonesia. Penglipuran village is famous as one of the tourist destinations in Bali because of its society who still preserve their traditional culture in their daily lives.',
  ),
  Place(
    'Sinhagad Fort',
    'assets/images/travell04.jpg',
    'Sinhagad is a hill fortress located at around 35 km southwest of the city of Pune, India. Some of the information available at this fort suggests that the fort could have been built 2000 years ago.',
  ),
  Place(
    'Lovina Beach',
    'assets/images/travell05.jpg',
    'Lovina Beach (or often simply Lovina) is a coastal area on the northwestern side of the island of Bali, Indonesia. The coastal strip stretches from 5 km west of the city of Singaraja to 15 km west.',
  ),
  Place(
    'Mount Bromo',
    'assets/images/travell06.jpg',
    'Mount Bromo (Indonesian and Javanese: Gunung Bromo) is an active somma volcano and part of the Tengger mountains, in East Java, Indonesia. At 2,329 meters (7,641 feet) it is not the highest peak of the massif, but the most famous.',
  ),
  Place(
    'Tegallalang District',
    'assets/images/travell07.jpg',
    'Tegallalang is a district in the Gianyar Regency, Bali, Indonesia. As of the 2010 census, the area was 61.80 km2 and the population was 50,625; the latest official estimate (as at mid 2019) is 53,760. Located around 10 km north of Ubud, its terraced rice fields are a tourist attraction in the area.',
  ),
  Place(
    'Jembrana Regency',
    'assets/images/travell08.jpg',
    'Jembrana is a regency (kabupaten) in the southwest of Bali, Indonesia. It has an area of 841.8 km2 and had a population of 261,638 at the 2010 Census and 317,064 at the 2020 Census. Its regency seat is Negara.',
  ),
  Place(
    'Batu Sanggan Villages',
    'assets/images/travell09.jpg',
    'Batu Sanggan is one of the villages in the Kampar Kiri Hulu sub-district, Kampar Regency, Riau province, Indonesia.',
  ),
  Place(
    'Wayag Island',
    'assets/images/travell10.jpg',
    'Wayag Island is one of the islands within the Raja Ampat district in the province of West Papua. The island is known for its beautiful atolls and amazing underwater life covering a total area of 155,000 hectares, about 383,013.3 acres',
  ),
];

List<Place> popularPlace = [
  Place(
    'Sea',
    'assets/images/travell05.jpg',
    '',
  ),
  Place(
    'River',
    'assets/images/travell09.jpg',
    '',
  ),
  Place(
    'Fisherman',
    'assets/images/travell08.jpg',
    '',
  ),
  Place(
    'Waterfall',
    'assets/images/travell11.jpg',
    '',
  ),
  Place(
    'Ricefield',
    'assets/images/travell12.jpg',
    '',
  ),
];
