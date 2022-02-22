import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  String title = 'E-KTP Digital dan Potensi Kebocoran Datanya';
  String publish = '17 Januari 2022   11:24';
  String update = '17 Januari 2022   11:26';
  String imageCover =
      'https://img.inews.co.id/media/822/files/inews_new/2021/12/31/infografis_e_ktp_tak_berwujud_fisik_1.jpeg';
  String imageDescription =
      'KTP Digital dan Potensi Kebocoran Data.sumber:kompas.com';
  String content = '''
  Benar-benarlah rakyat Indonesia itu rakyat yang latah, bagaimana tidak? Entah Iri atau terkejut bathin dengan apa yang dicapai oleh seorang Ghozali Everday yang tiba-tiba booming dan menciptakan kehebohan baru dengan pencapaian luar biasanya atas eksistensinya tidak pernah absen untuk berswafoto alias berselfie ria, dari tahun 2017 hingga kini hingga foto-foto selfienya bisa dihargai hingga Rp 1,5 Miliar.

Aksinya yang menterang bisa meraup miliaran rupiah di OpenSea membuat rakyat Indonesia latah dan mengikuti jejaknya. Banyak sekarang beralih ke OpenSea dengan NFT-nya dengan harapan bisa setenar Ghozali Everday, sampai-sampai banyak yang jual KTP-nya di OpenSea. Dilansir dari berbagai berita online, di OpenSea sekarang banyak dipampang foto-foto berbagai macam produk, hingga foto selfie KTP juga beredar marak di OpenSea.

Ini adalah fenomena baru dan tidak perlu ditiru harusnya, kenapa? Masa foto tanda pengenal diri harus ditampilkan di OpenSea? Apakah memang ada investor yang tertarik untuk membeli foto selfie KTPnya? Entahlah, yang pasti NFT tidak hanya mengakibatkan terjadinya peluang praktik pencucian uang, tetapi bisa juga berpotensi maraknya penjualan data-data pribadi karena terjadinya upload foto identitas diri kita bukan?

Apalagi sekarang pemerintah lewat Kementerian Dalam Negeri (Kemendagri) tengah melakukan uji coba KTP Elektronik (E-KTP) dalam bentuk digital. Membaca ini (E-KTP) digital, ingatan saya langsung tertuju pada masalah besar di masa era pemerintahan SBY, sekitar tahun 2010-an yang sampai sekarang belum tuntas ke akar-akarnya. Ya, Korupsi E-KTP alias KTP elektronik yang menjadi skandal besar di negeri ini.

Tidak hanya proyek mega E-KTP ini aja yang masalah, tapi juga data E-KTP, dimana hologram E-KTP adalah buatan Cina dan Perancis, artinya data dan NIK rakyat Indonesia ini diproses atau dikerjakan di luar negeri, bukan di dalam negeri. Apakah negara kita tidak sanggup untuk membuat proyek mahal E-KTP ini? Hingga data rakyat Indonesia berpotensi bocor sampai ke luar negeri?

Ya, mega skandal korupsi E-KTP yang dulu saja sampai sekarang tidak tuntas-tuntas diusut oleh KPK, kini sudah muncul E-KTP baru lagi yang namanya digital. Pertanyaan saya, apakah E-KTP yang dulu itu tidak sama dengan yang sekarang? Dulu juga namanya E-KTP alias Elektronik KTP. Apa bedanya KTP dulu dengan yang sekarang?
  ''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Page'),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  FloatingActionButton(
                    onPressed: () {},
                    heroTag: 'notif',
                    mini: true,
                    child: const Icon(Icons.notifications),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    heroTag: 'share',
                    mini: true,
                    child: const Icon(Icons.share),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Publish : ' + publish,
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          'Update  : $update',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark),
                    color: Colors.blue,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Stack(
                children: [
                  SizedBox(
                    child: Image.network(
                      imageCover,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 6,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_red_eye_rounded),
                      label: const Text('Lihat Foto'),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Text(
                imageDescription,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10),
              ),
              const SizedBox(height: 20),
              Text(
                content,
                textAlign: TextAlign.justify,
                // style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
