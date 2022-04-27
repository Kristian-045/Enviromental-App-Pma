

class Article {
  String title="";
  String description="";
  String imgPath="";
  String color="";

}

List<Article> getArticles() {
  List<Article> cards = [];

  Article ar1 = Article();
  Article ar2 = Article();
  Article ar3 = Article();
  Article ar4 = Article();
  ar1.title="1. Elektrické motory";
  ar1.description = "viac informacii ked swipne s hore ... nejaky text aktualne neviem aky";
  ar1.imgPath="assets/images/electric-car.svg";
  cards.add(ar1);

  ar2.title="2. Spaľovacie motory";
  ar2.description = "viac informacii ked swipne s hore ... nejaky text aktualne neviem aky";
  ar2.imgPath="assets/images/blue-car.svg";
  cards.add(ar2);

  ar3.title="3. motory";
  ar3.description = "viac informacii ked swipne s hore ... nejaky text aktualne neviem aky";
  ar3.imgPath="assets/images/boat.svg";
  cards.add(ar3);

  ar4.title="4. motory";
  ar4.description = "viac informacii ked swipne s hore ... nejaky text aktualne neviem aky";
  ar4.imgPath="assets/images/off-road-car.svg";
  cards.add(ar4);


  return cards;
}