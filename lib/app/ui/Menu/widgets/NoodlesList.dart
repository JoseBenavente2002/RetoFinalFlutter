import 'package:flutter/material.dart';
import 'package:flutter_reto_final/app/ui/Menu/noodels/classicRamen.dart';
import 'package:flutter_reto_final/app/ui/Menu/widgets/BottomModal.dart';

class NoodlesList extends StatefulWidget {
  const NoodlesList({Key? key}) : super(key: key);

  @override
  State<NoodlesList> createState() => _NoodlesListState();
}

class _NoodlesListState extends State<NoodlesList> {
  double _percent = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 340,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/Ramen.jpg"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: icon(Icons.more_horiz),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: icon(Icons.arrow_back_sharp),
          ),
          NotificationListener<DraggableScrollableNotification>(
              onNotification: (notification) {
                setState(() {
                  _percent = 2 * notification.extent - 0.9;
                });
                return true;
              },
              child: BottomModal()),
          Positioned(
            left: 0,
            right: 0,
            top: -95 * (1 - _percent),
            child: SearchDestination(),
          ),
        ],
      ),
    );
  }

  Widget icon(IconData icon) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: CircleAvatar(
        radius: 30.0,
        backgroundColor: Color.fromRGBO(109, 103, 101, 0.5),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}

/**/

/**/
class SearchDestination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: icon(Icons.more_horiz),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: icon(Icons.arrow_back_sharp),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget icon(IconData icon) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: CircleAvatar(
        radius: 30.0,
        backgroundColor: Color.fromRGBO(109, 103, 101, 0.5),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}

/*Lista de item Controller*/
class ListaItems extends StatelessWidget {
  final ScrollController scrollController;

  ListaItems(this.scrollController);
  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: this.scrollController,
      children: [
        Container(
          margin: EdgeInsets.only(left: 15),
          child: Text(
            "Noodles & Ramen",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15),
          child: Text(
            "802 avenum, 153673",
            style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w300),
          ),
        ),
        menu(
            "assets/ramenandpork.jpg",
            "assets/ChikenRamenNoodles.jpg",
            "Classic ramen with \n" "chiken and egg",
            "Chiken Ramen \n" "and Noodles",
            "\$ 4,99",
            "\$ 6,99"),
        menu(
            "assets/GouchujangMisoRamenNoodles.jpg",
            "assets/NoodleSoupwithChoySum.jpg",
            "Gouchujang Miso Ramen \n" "and Noodles",
            "Noodle Soup with \n" "Choy Sum",
            "\$ 3,50",
            "\$ 7,99"),
        menu(
            "assets/RamenNoodleSoup.jpg",
            "assets/VeggieRamenNoodlesSesame.jpg",
            "Ramen Noodle Soup \n" "chiken and egg",
            "Veggie Ramen Noodles \n" "and Sesame",
            "\$ 6,00",
            "\$ 9,99"),
      ],
    );
  }

/*Reultilizacion de widgets*/
  Widget menu(String image1, image2, itemsmenu1, itemsmenu2, price1, price2) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(image1),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: Text(
                    itemsmenu1,
                    style: TextStyle(fontSize: 13.0),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: 220.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.grey,
                ),
                child: Center(child: Text(price1)),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(image2),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: Text(
                    itemsmenu2,
                    style: TextStyle(fontSize: 13.0),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: 220.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.grey,
                ),
                child: Center(child: Text(price2)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
