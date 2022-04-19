import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewsDetails extends StatefulWidget {
  final int id;
  const NewsDetails({Key? key , required this.id}) : super(key: key);

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
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
                        'IT-FEST 2022',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )),
                ],
              ),
            )),
      body: SingleChildScrollView(
        child: Padding(
          padding:
          const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: SizedBox(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          image: NetworkImage('https://static.wixstatic.com/media/8ff6ba_2696386bbe444235b16ee85b5d810abbf000.jpg/v1/fill/w_960,h_540,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/8ff6ba_2696386bbe444235b16ee85b5d810abbf000.jpg'),
                          fit: BoxFit.cover)),
                  width: MediaQuery.of(context).size.width - 40,
                  height: 400,
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                          "IT-FEST 2022",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800),
                        )),
                    Text(
                       ' 8 мин. назад',
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
                  'Это возможность в короткие сроки в мощной творческой обстановке реализовать проект, собрать команду или влиться в интересный проект',

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
        ),
      ),
    );
  }
}
