import 'package:flutter/material.dart';
import 'package:she_hacks/pages/Plantas/Info_plantas.dart';
import 'package:she_hacks/pages/Plantas/contantes.dart';
import 'Animacao_plantas_page.dart';

class Plantas_page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: null,
        title: Text("Plantas", style: TextStyle(color: Colors.black, fontSize: 25),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black,), onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 2.2/1,
                      child: Animacao_plantas_page(1, Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Text("All", style: TextStyle(fontSize: 20),),
                        ),
                      )
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2/1,
                      child: Animacao_plantas_page(1.1, Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Center(
                          child: Text("Sessao 1", style: TextStyle(fontSize: 17),),
                        ),
                      )),  
                    ),
                    AspectRatio(
                      aspectRatio: 2.2/1,
                      child: Animacao_plantas_page(1.2, Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Center(
                          child: Text("Sessao 2", style: TextStyle(fontSize: 17),),
                        ),
                      )),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2/1,
                      child: Animacao_plantas_page(1.3, Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Center(
                          child: Text("Sessao 3", style: TextStyle(fontSize: 17),),
                        ),
                      )),
                    ),
                    AspectRatio(
                      aspectRatio: 2.2/1,
                      child: Animacao_plantas_page(1.4, Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Center(
                          child: Text("Sessao 4", style: TextStyle(fontSize: 17),),
                        ),
                      )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Animacao_plantas_page(1.5, criaItem(image: 'assets/imagens/alface.jpg', tag: 'red', context: context)),
              Animacao_plantas_page(1.6, criaItem(image: 'assets/imagens/cenoura.jpg', tag: 'blue', context: context)),
              Animacao_plantas_page(1.7, criaItem(image: 'assets/imagens/tomate.jpg', tag: 'white', context: context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget criaItem({image, tag, context}) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Plantas(image: image, infoPlanta: null,)));
        },
        child: Container(
          height: 250,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400]!,
                blurRadius: 10,
                offset: Offset(0, 10)
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Animacao_plantas_page(1, Text("Titulo 1", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),
                        SizedBox(height: 10,),
                        Animacao_plantas_page(1.1, Text("Subtitulo", style: TextStyle(color: Colors.white, fontSize: 20),)),
                      ],
                    ),
                  ),
                  Animacao_plantas_page(1.2, Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),
                    child: Center(
                      child: Icon(Icons.favorite_border, size: 20,),
                    ),
                  ))
                ],
              ),
              Animacao_plantas_page(1.2, Text("Titulo 2", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),              
            ],
          ),
        ),
      ),
    );
  }
}

class Plantas extends StatelessWidget  {
  final Info_planta infoPlanta;

  const Plantas({required Key key, required this.infoPlanta}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 300),
                        Text(
                          infoPlanta.name,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 56,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          'Solar System',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 31,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Divider(color: Colors.black38),
                        SizedBox(height: 32),
                        Text(
                          infoPlanta.description ?? '',
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 32),
                        Divider(color: Colors.black38),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 25,
                        color: const Color(0xff47455f),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 250,
                    padding: const EdgeInsets.only(left: 32.0),
                    child: ListView.builder(
                        itemCount: infoPlanta.images.length,
                        scrollDirection:
                            Axis.horizontal, // make list scroll horizontal
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  infoPlanta.images[index],
                                  fit: BoxFit.cover,
                                )),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Positioned(
              right: -64,
              child: Hero(
                  tag: infoPlanta.position,
                  child: Image.asset(infoPlanta.iconImage)),
            ),
            Positioned(
              top: 60,
              left: 32,
              child: Text(
                infoPlanta.position.toString(),
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 247,
                  color: primaryTextColor.withOpacity(0.08),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}