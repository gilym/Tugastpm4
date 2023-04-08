class datadiri {
  String name;
  String nim;
 String kelas;
  String cita_cita;
  String ttl;
  String image;

  datadiri({
    required this.name,
    required this.nim,
    required this.kelas,
    required this.cita_cita,
    required this.ttl,
    required this.image,

  });
}

var data =[
  datadiri(
      name: 'Muhammad Fajar Andikha',
      nim: '123200054',
      kelas: 'IF - A',
      cita_cita: 'Cita-Cita Bekerja di Google',
      ttl: 'Magelang , 9 Juli 2000',
      image: 'assets/fajar.jpeg'),
  datadiri(
      name: 'Gilang Yoenal Marinta',
      nim: '123200056',
      kelas: 'IF - A',
      cita_cita: 'Ingin Menjadi Kaya',
      ttl:'Biak , 15 Agustus 2002',
      image: 'assets/gilang.JPG'),

  datadiri(
      name: 'Hartanta Dwi Putra Sembiring',
      nim: '123200037',
      kelas: 'IF - A',
      cita_cita: 'Ingin Menjadi Petani Berdasi',
      ttl: 'Kabanjahe , 28 Mei 2002',
      image: 'assets/hartanta.jpg'),
];
