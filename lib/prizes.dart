import 'package:flutter_fest/daily_steps.dart';

import 'prize.dart';

import 'package:flutter/material.dart';
import 'package:flutter_fest/prize.dart';

final List <Prize> _items = [
  Prize( id: 1,url: 'assets/images/bisiklet.jpeg', title: 'Tebrikler! KAYBİS sisteminden bisiklet kullanma hakkı kazandın.', shortDescription: 'Ulaşım problemi, günümüz kentlerinin en büyük sorunlarından biri. Kentlerin nüfus yoğunluğunun artmasıyla birlikte motorlu taşıt kullanımının fazlalaşması ve beraberinde getirdiği trafik problemlerinin yarattığı sıkıntılar, hava kirliliği ve gürültü hem insan sağlığını hem de kent yaşantısını olumsuz yönde etkilemekte. Sağlıklı, güvenli, ekonomik, doğa dostu ve erişilebilirlik açısından son derece kullanışlı bir ulaşım türü olan bisiklet, kent içi ulaşım problemlerinde en önemli çözümlerden biri olarak görülmekte.'),
  Prize( id: 2,url: 'assets/images/e-scooter.jpg', title: 'Tebrikler. BİNBİN sisteminden E-Scooter kullanma hakkı kazandın.', shortDescription: 'E-scooterlar, trafik tıkanıklığını ve şehir merkezindeki yolculuk sürelerini azaltmaya yardımcı olabilecek düşük karbonlu bir seyahat biçimi olarak görülüyor. Hükümetin Birleşik Krallık’taki şehirlerde kiralama programlarını test etmek için izleme planları yürüttüğü e-scooterlar, özellikle Covid-19 nedeniyle yapılan sosyal mesafe tavsiyesinin ardından giderek daha popüler hale geldi.'),
  Prize( id: 3,url: 'assets/images/bus_card.jpg', title: 'Tebrikler. Bir binişlik toplu taşıma bileti kazandın. ', shortDescription: 'Ulaşımda sürdürülebilirlik sağlayabilmek için ülkemizde uzun yıllardır çalışmalar yapılmaktadır. Ancak ilk başlarda yaşanan sorunun, yolların dar olmasından kaynaklı olduğu sanıldığı için hep daha geniş yollar yapılmaya çalışılmıştır. Bu da araç sayısını daha fazla artırarak bir paradoksa dönüşmüştür. Oysa sorun araç sayısı veya araçların yollara sığmaması değil, bireysel taşıta duyulan ihtiyacın fazla olmasıdır. O yüzden çevre dostu toplu taşıma, sürdürülebilirliğin yegane şartıdır.'),
  Prize( id: 4,url:  'assets/images/netflix.png', title: 'Tebrikler. Bir aylık Netflix aboneliği kazandın ', shortDescription: 'Sürdürülebilirlik konusunda daha fazla belgesel izlemeye ne dersin. İşte bir öneri=> Cowspiracy: Sürdürülebilirliğin Sırrı2014 | 13+ | 1 sa. 30 dk. | Politik BelgesellerFabrika çiftçiliğinin gezegenin doğal kaynaklarını nasıl tükettiğini ve büyük çevreci grupların bu krizi neden görmezden geldiğini öğrenin.'),
  Prize( id: 5,url:  'assets/images/cini.jpg', title: 'Tebrikler. Bir aylık Çini kursu kazandın', shortDescription: "Stresten kurtulmaya ve yeni bir hobi öğrenmeye hazır mısın? Oldukça çevreci olan bu sanat dalı hakında işte bazı bilgiler: Türk çini sanatının tarihi ilk Müslüman Türk devletlerinden Karahanlılara kadar dayanmaktadır. Bu da çini sanatının bin yılı aşkın bir geçmişe sahip olduğunu göstermektedir Büyük Selçuklular ve Anadolu Selçukluları çiniyi mimari süslemelerde sıkça kullanmış, Anadolu Selçuklu Devleti'nin dağılmasından sonra, çini sanatında Osmanlı Devleti'nin kuruluşuyla yeni bir dönem başlamıştır."),
  Prize( id: 6,url:  'assets/images/ticket.jpg', title: 'Tebrikler. Bir sinema bileti kazandın', shortDescription: 'Sinema, bugün, televizyon ve internetten sonra kitle iletişim araçları içersinde en etkin olanlarından birisidir. Kitle iletişim araçları içersinde film, en yaygın olan, okuma yazması olmayan kimselere bile kolayca hitap edebilen, kolay anlaşılabilen hareketli resim, söz veya yazı ve müzikle oluşmuş bir anlatım olanağına sahiptir. İşte bir sinema filmi tavsiyesi: Bisikletli Anneler '),
  Prize( id: 7,url:  'assets/images/comlek.jpg', title: 'Tebrikler. Bir aylık çömlek kursu kazandın', shortDescription: 'Stresten kurtulmaya ve yeni bir hobi öğrenmeye hazır mısın? Oldukça çevreci olan bu sanat dalı hakında işte bazı bilgiler: Çömlekçilik, toprağın ya da asıl olarak killi toprağın çeşitli aşamalardan geçirildikten sonra şekillendirilip kullanılmak üzere çeşitli eşyalar üretilmesine verilen addır.'),
  Prize( id: 8,url:  'assets/images/spotify.jpg', title: 'Tebrikler. Bir Spotify Aboneliği kazandın', shortDescription: 'Müzik beyni hareketli ve hazır olma halinde tutmaya yardımcı olur. Hafızlarını güçlendirmeye yardımcı olur. Müzik insan ruhunu ve sağlığını iyileştirme potansiyeline sahiptir. Spotifydan sürdürülebilirlik hakkında harika bir Podcast seni bekliyor: https://open.spotify.com/show/79e6JCk4GJN1RG2Z9SJK1E'),

];
class Prizes extends StatefulWidget   {

  const Prizes({Key? key}) : super(key: key);

  @override
  _PrizesState createState() => _PrizesState();
}

class _PrizesState extends State<Prizes>  with ChangeNotifier{
  @override
  void dispose(){
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    void conditions(int id){
      if(id==1){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const detailScreen(count: 0,)),
        );
      };
      if(id==2){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const detailScreen(count: 1)),
        );
      };
      if(id==3){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const detailScreen(count: 2)),
        );
      };
      if(id==4){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const detailScreen(count: 3)),
        );
      };
      if(id==5){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const detailScreen(count: 4)),
        );
      };
      if(id==6){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const detailScreen(count: 5)),
        );
      };
      if(id==7){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const detailScreen(count: 6)),
        );
      };
      if(id==8){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const detailScreen(count: 7)),
        );
      };
    }
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/prize4.jpg'),
                fit: BoxFit.cover,
              ),),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  colors: [Colors.black.withOpacity(.6),
                    Colors.black.withOpacity(.1)],
                ),
              ),
              child: Center(child: Text('Prizes',style: TextStyle(
                fontSize: 50,
                fontFamily: 'Amatic SC',
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),)),
            ),
          ),
          Expanded(
              child:GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: _items.map((item) => InkWell(
                  onTap: (){
                    conditions(item.id);
                    },

                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(item.url),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                )).toList(),
              )
          ),
        ],
      ),
    );

  }

}
class detailScreen extends StatelessWidget {
  final int count;
  const detailScreen( {Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(

        body: Container(child: Column(children: [
          Expanded(
            flex: 3,
            child: Image(image: AssetImage(_items[count].url),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Text(_items[count].title,style: TextStyle(color: Colors.lightGreen,fontSize: 24, )),
          ),
          Expanded(flex: 3,
            child: SingleChildScrollView(child: Text(_items[count].shortDescription)),
          ),

          Expanded(flex: 2,child: SingleChildScrollView(child: card())),

        ],)),
      ),
    );
  }
}

