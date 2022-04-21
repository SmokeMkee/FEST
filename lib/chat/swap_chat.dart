import 'package:flutter/material.dart';

import 'chat-detail.dart';
import 'conversation_list.dart';
class SwapChatUsers{
  String name;
  String messageText;
  String imageURL;
  String time;
  SwapChatUsers({required this.name,required this.messageText,required this.imageURL,required this.time});
}


class SwapChatWidget extends StatefulWidget {
  const SwapChatWidget({Key? key}) : super(key: key);

  @override
  State<SwapChatWidget> createState() => _SwapWidgetState();
}

class _SwapWidgetState extends State<SwapChatWidget> {


  void swapChats(){
    Navigator.of(context).pushNamed('/main_screen/add_news' );
  }

  List<SwapChatUsers> chatUsers = [
    SwapChatUsers(name: "Merekeyev Timur", messageText: "Слышал сегодня поступит зп)😉😉", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6eXk0IwHSiexF2ciMnRXDzc3TpYPqCYeofg&usqp=CAU", time: "28 Aprel", ),
    SwapChatUsers(name: "Estai Tastanov", messageText: "Где мое первое место ???", imageURL: "https://images11.cosmopolitan.ru/upload/img_cache/12d/12d2e3af103da435cacaaa25d60d26cc_cropped_550x740.jpg", time: "27 Aprel"),
    SwapChatUsers(name: "Sagatov Miras", messageText: "Могу я получить аванс ?", imageURL: "https://avatanplus.com/files/photos/original/590ec8ec7139115be1c0dbb0.jpg", time: "24 Aprel"),
    SwapChatUsers(name: "Abdussattar Kassymbekov", messageText: "Где деньги ? Любовский !😀 😃 🤨", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnlwDwZoELDkLhCciJCWjcMesI08GR-YVPQw&usqp=CAU", time: "21 Mar"),
     ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
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
                      'Сообщения Бухгалтерии',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),


              ],
            ),

          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.grey.shade100
                      )
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return ConversationList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  imageUrl: chatUsers[index].imageURL,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3)?true:false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
