import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class News {
  final int id;
  final String title;
  final String image;
  final String time;
  final String description;

  News({
    required this.id,
    required this.title,
    required this.image,
    required this.time,
    required this.description,
  });
}

class ListNews extends StatefulWidget {
  ListNews({Key? key}) : super(key: key);

  @override
  State<ListNews> createState() => _ListNewsState();
}

class _ListNewsState extends State<ListNews> {
  final now = DateTime.now();

  final _news = [
    News(
      id: 1,
        title: 'IT-FEST 2022',
        image:
            'https://static.wixstatic.com/media/8ff6ba_2696386bbe444235b16ee85b5d810abbf000.jpg/v1/fill/w_960,h_540,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/8ff6ba_2696386bbe444235b16ee85b5d810abbf000.jpg',
        time: '45 минут назад',
        description:
            'Это возможность в короткие сроки в мощной творческой обстановке реализовать проект ssssssssssssssss'),
    News(
        id: 2,
        title: 'IT-FEST 2022',
        image:
            'https://static.wixstatic.com/media/8ff6ba_2696386bbe444235b16ee85b5d810abbf000.jpg/v1/fill/w_960,h_540,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/8ff6ba_2696386bbe444235b16ee85b5d810abbf000.jpg',
        time: '45 минут назад',
        description:
            'Это возможность в короткие сроки в мощной творческой обстановке реализовать проект ssssssssssssssss'),
    News(
        id: 3,
        title: 'IT-FEST 2022',
        image:
            'https://static.wixstatic.com/media/8ff6ba_2696386bbe444235b16ee85b5d810abbf000.jpg/v1/fill/w_960,h_540,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/8ff6ba_2696386bbe444235b16ee85b5d810abbf000.jpg',
        time: '45 минут назад',
        description:
            'Это возможность в короткие сроки в мощной творческой обстановке реализовать проект ssssssssssssssss'),
    News(
      id: 4,
        title: 'IT-FEST 2022',
        image:
            'https://static.wixstatic.com/media/8ff6ba_2696386bbe444235b16ee85b5d810abbf000.jpg/v1/fill/w_960,h_540,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/8ff6ba_2696386bbe444235b16ee85b5d810abbf000.jpg',
        time: '45 минут назад',
        description:
            'Это возможность в короткие сроки в мощной творческой обстановке реализовать проект ssssssssssssssss'),
    News(
      id: 5,
        title: 'IT-FEST 2022',
        image:
            'https://static.wixstatic.com/media/8ff6ba_2696386bbe444235b16ee85b5d810abbf000.jpg/v1/fill/w_960,h_540,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/8ff6ba_2696386bbe444235b16ee85b5d810abbf000.jpg',
        time: '45 минут назад',
        description:
            'Это возможность в короткие сроки в мощной творческой обстановке реализовать проект ssssssssssssssss'),
    News(
      id: 6,
        title: 'IT-FEST 2022',
        image:
            'https://static.wixstatic.com/media/8ff6ba_2696386bbe444235b16ee85b5d810abbf000.jpg/v1/fill/w_960,h_540,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/8ff6ba_2696386bbe444235b16ee85b5d810abbf000.jpg',
        time: '45 минут назад',
        description:
            'Это возможность в короткие сроки в мощной творческой обстановке реализовать проект ssssssssssssssss'),
  ];
  var filteredNews = <News>[];

  final search_controller = TextEditingController();

  void _searchNews() {
    final search_text = search_controller.text;
    if (search_text.isNotEmpty) {
      filteredNews = _news.where((News news) {
        return news.title.toLowerCase().contains(search_text);
      }).toList();
    } else {
      filteredNews = _news;
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchNews();
    search_controller.addListener(() {
      _searchNews();
    });
  }

  void _onNewsTap(int index){
    final id =_news[index].id;
  Navigator.of(context).pushNamed('/main_screen/movie_details' , arguments: id);
  }

  void _addNews(){
    Navigator.of(context).pushNamed('/main_screen/add_news' );
  }


  @override
  Widget build(BuildContext context) {
    final InputBorder = OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromRGBO(232, 232, 232, 1), width: 2),
        borderRadius: BorderRadius.circular(100));

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.0), // here the desired height
          child: AppBar(
            backgroundColor: Color.fromRGBO(66, 104, 124, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: Row(
              children: [
                Expanded(
                    child: Text(
                  'Новости',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )),
                IconButton(onPressed: (){
                  _addNews();
                }, icon: SvgPicture.asset('assets/add.svg'))
              ],
            ),
          )),
      body: Stack(
        children: [
          ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.only(top: 61),
            itemCount: filteredNews.length,
            itemExtent: 320,
            itemBuilder: (BuildContext context, int index) {
              final news = filteredNews[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: SizedBox(
                  child: Stack(
                    children:[

                      Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(216, 224, 228, 1),
                        border: Border.all(
                          color: const Color.fromRGBO(216, 224, 228, 1),
                          width: 12,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  image: DecorationImage(
                                      image: NetworkImage(news.image),
                                      fit: BoxFit.cover)),
                              width: MediaQuery.of(context).size.width - 40,
                              height: 1800,
                              child: const Padding(
                                padding: EdgeInsets.all(5),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                news.title,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w800),
                              )),
                              Text(
                                now.minute.toString() + ' мин. назад',
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(153, 153, 153, 1)),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            news.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                      Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap:()=>_onNewsTap(index),
                        ),
                      )
                  ]
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: TextField(
              controller: search_controller,
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    size: 30,
                    color: Color.fromRGBO(189, 189, 189, 1),
                  ),
                  border: InputBorder,
                  hintText: 'Поиск',
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(189, 189, 189, 1),
                    fontSize: 17,
                  ),
                  fillColor: Color.fromRGBO(246, 246, 246, 1),
                  filled: true,
                  contentPadding: EdgeInsets.only(left: 20),
                  enabledBorder: InputBorder,
                  focusedBorder: InputBorder),
            ),
          ),
        ],
      ),
    );
  }
}
