

class Article {
  String imgPath="";
  String title="";
  String introduction="";
  List<List<String>> parameters=[] ;
  String description="";
  String color="";

}

List<Article> getArticles() {
  List<Article> cards = [];

  Article ar1 = Article();
  Article ar2 = Article();
  Article ar3 = Article();
  Article ar4 = Article();
  ar1.title="1. Elektrické motory";
  ar1.introduction = "Elektrický motor, alebo elektromotor, je elektrické zariadenie, ktorého hlavnou úlohou je premena elektrickej energie na mechanickú energiu. V prípade motorových vozidiel ide predovšetkým o premenu elektrickej energie z batérií na mechanickú energiu kolies. Batérie v tomto prípade slúžia ako zdroj energie a kolesá ako poháňaný prvok.";
  //parametre mozu byt aj ine ako som ja dal ale davajte len 3
  ar1.parameters=[["Efektivita","90","%"],["Ekologickosť","100","%"],["Výdrž","A",""]];
  ar1.description= "# Základné typy elektromotorov: \n"
      "motory na jednosmerný prúd, trojfázové motory, synchrónne a asynchrónne motory.\n"
      "# Výhody:\n"
      "* Elektromotor dokáže absorbovať a následne opätovne využívať získanú energiu z brzdenia. Vďaka tomu sa môžu spätne nabíjať batérie elektromobilu.\n"
      "* Tichá prevádzka.\n"
      "* Emisie sú nulové, čo prispieva k ochrane životného prostredia pred výfukovými plynmi a hromadením oxidu uhličitého.\n"
      "* Ekologická a úsporná jazda.\n"
      "* Veľkou výhodou je, že tento typ motora obsahuje iba jednu pohyblivú súčiastku – rotor.\n"
      "* V elektromotore sa nestretneš s potrebou výmeny motorového oleja, vzduchového filtra, atď.\n"
      "# Ochrana životného prostredia \n"
      "Vzhľadom na to, že elektromotory nevypúšťajú žiadne emisie, aspoň na miestnej úrovni, sú považované za ekologickejšie ako spaľovacie motory. Samotná výroba elektrickej energie však môže produkovať škodlivé látky. Najekologickejšie riešenie je, keď sa na výrobu energie používajú 100% obnoviteľné zdroje energie.\n"
      "# Budúcnosť vozidiel s elektrickými motormi\n"
      "Elektrické motory dokážu efektívnejšie využívať energiu v porovnaní so spaľovacími motormi.Budú sa aj naďalej zdokonaľovať a možno sa o niekoľko rokov dočkáme revolučných motorov novej generácie, po ktorých si na staré spaľováky už nikto nespomenie.\n"
      "\n";

  ar1.imgPath="assets/images/electric-car.svg";
  cards.add(ar1);

  ar2.title="2. Vodíkové motory";
  ar2.introduction = "Sú to motory, ktoré sa považujú za nulové emisie. ";
  ar2.parameters=[["Efektivita","35","%"],["Ekologickosť","100","%"],["Výdrž","A",""]];
  ar2.description= "Pracujú prostredníctvom palivového článku, v ktorom sa oxiduje vodík, aby sa vytvorila elektrická energia na vedenie. Pri tomto procese sa uvoľňuje iba vodná para. V závislosti od modelu je za pohyb vozidla zodpovedný jeden alebo viac elektromotorov. Prepojený je batériou a palivovým článkom. Táto časť je doplnená o zásobník, ktorý skladuje vodík.\n"
      "# Výhody vodíkových áut:\n"
      "* Neznečisťuje.\n"
      "* Rýchle tankovanie - Natankovanie vodíka do auta trvá len 3-5 minút, čo je podobne ako čas potrebný na benzín alebo naftu. Priemerné náklady na natankovanie vodíkového vozidla sú 8,5 eura na 100 kilometrov, čo je obdoba nákladov na vodiča naftového alebo benzínového vozidla.\n"
      "* Spĺňajú ciele EÚ v oblasti znižovania emisií.\n"
      "* Minimálna údržba.\n"
      "* Nie sú hlučné.\n"
      "* Parkovať môžete bez platenia- Keďže sa považujú za čisté autá, autá na vodíkový pohon sú tiež označované DGT ako „nulové emisie\".\n "
      "* Vydržia extrémne teploty.\n"
      "# Nevýhody vodíkových áut: \n"
      "* Vyššia obstarávacia cena - Musia odolávať veľmi vysokým tlakom, čo sú hlavné dôvody ich vysokých výrobných nákladov.\n"
      "* Málo miest na tankovanie\n"
      "* Malá rozmanitosť modelov - Problém tejto technológie je dnes v tom, že výrobcovia si netrúfajú na masovú výrobu modelov.  Keďže je málo čerpacích staníc a ceny áut sú vysoké, dopyt je stále príliš nízky. To všetko znamená, že výrobcovia sa neodvážia naplno vstúpiť do distribučného biznisu.\n"
      "* Zaberie viac miesta - Elektrické vozidlá s palivovými článkami majú značnú technickú zložitosť. Vo väčšine prípadov všetky komponenty, ktoré vozidlo obsahuje (motor, riadiaca jednotka a menič, prevodovka, palivový článok), najmä priestor, ktorý zaberá nádrž na vodík, robia doteraz vyrobené modely veľkými."
      "\n";
  ar2.imgPath="assets/images/blue-car.svg";
  cards.add(ar2);

  ar3.title="3. Plynové motory";
  ar3.introduction = "Tieto motory môžu používať stlačený alebo skvapalnený plyn. Takéto plyny sa získavajú premenou dreva, uhlia alebo rašeliny na plynné palivo.";
  ar3.parameters=[["Efektivita","35","%"],["Ekologickosť","80","%"],["Výdrž","A",""]];
  ar3.description= "# Podľa spôsobu zapálenia zmesi sa rozdeľujú na:\n"
      "* zážihový plynový motor \n"
      "* vznetový plynový motor \n"
      "* plynový motor so zapaľovacím vstrekom\n"
      "# Výhody:\n"
      "* Veľmi nízka cena za liter paliva	\n"
      "* Nízke prevádzkové náklady\n"
      "* Dostatočné množstvo čerpacích staníc\n"
      "* Ekologickejší ako nafta/benzín\n"
      "# Nevýhody:\n"
      "* Nižší dojazd \n"
      "* Vyššia spotreba voči benzínu v prepočte na litre\n"
      "* Vstupná investícia do prestavby vozidla na LPG\n"
      "* Zákaz parkovania v podzemnej garáži\n"
      "* Tlaková nádrž zaberá miesto\n";
  ar3.imgPath="assets/images/town.svg";
  cards.add(ar3);

  ar4.title="4. Spaľovacie motory";
  ar4.introduction = "Spaľovacie motory sú tepelné stroje, ktoré vytvárajú tepelnú energiu spaľovaním paliva. Túto tepelnú energiu premieňajú spaľovacie motory na mechanickú prácu alebo reakčný účinok.";
  ar4.parameters=[["Efektivita","20","%"],["Ekologickosť","30","%"],["Výdrž","A",""]];
  ar4.description= "# Rozdelenie spaľovacích motorov:\n"
      "Keďže existuje nespočetne veľké množstvo rôznych typov spaľovacích motorov, ktoré sú odlišne skonštruované a taktiež pracujú podľa odlišných kritérií, je potrebné ich rozdeliť do niekoľkých bodov: \n"
      "## 1. Podľa pracovného cyklu:\n"
      "* motory s prerušovaným pracovným cyklom (dvojtaktný a štvortaktný motor)\n"
      "* motory s kontinuálnym pracovným cyklom (napríklad spaľovacia turbína)\n"
      "## 2. Podľa pracovného princípu:\n"
      "* piestové spaľovacie motory, a to presnejšie motory s priamočiarym vratným pohybom piesta (väčšina piestových spaľovacích motorov) a motory s krúživým pohybom piesta (Wankelov motor)\n"
      "* reaktívne motory (raketové, alebo prúdové motory)\n"
      "* lopatkové motory (turbíny)\n"
      "# 3.	Podľa spôsobu vyvolania spaľovania:\n"
      "* zážihové motory (spaľovanie sa vyvolá pomocou iskry zo zapaľovacej sviečky)\n"
      "* vznetové motory (spaľovanie sa vyvolá vysokou teplotou a stlačením pracovnej zmesi)\n"
      "* žiarové motory (obsahuje žiarovú komôrku umiestnenú tak, aby mohla byť ohrievaná vonkajším zdrojom tepla)\n"
      "* motory s kombinovaným zapaľovaním\n"
      "# 4. Podľa druhu spaľovaného paliva:\n"
      "* plynové (spaľujúce plynné palivá, napríklad CNG a teda zemný plyn)\n"
      "* kvapalné (spaľujúce benzín, naftu či iné látky)\n"
      "* pevné (práškové uhlie)\n"
      "* rôznopalivové (môžu prejsť na spaľovanie niekoľkých typov paliva)"
      "* dvojpalivové (spaľujú viac druhov paliva súčasne)\n"
      "# Výhody spaľovacích motorov:\n"
      "* rýchle uvedenie do prevádzky\n"
      "* je možné skonštruovať ich pre spaľovanie rôznych palív, ale aj v rôznych veľkostiach a pre rôzne účely\n"
      "* motory s kvapalnými palivami umožňujú dosahovať veľmi nízku spotrebu paliva\n"
      "* piestové spaľovacie motory dosahujú vysokú účinnosť premeny energi\n"
      "# Nevýhody spaľovacích motorov:\n"
      "* nepriaznivý vplyv na životné prostredie a zdravie ľudí a iných organizmov\n"
      "* piestové spaľovacie motory majú nevýhodný priebeh výkonových charakteristík\n"
      "* obmedzená životnosť\n"
      "*pre svoj štart vyžadujú cudzí zdroj energie (s výnimkou raketových motorov)";
  ar4.imgPath="assets/images/off-road-car.svg";
  cards.add(ar4);


  return cards;
}