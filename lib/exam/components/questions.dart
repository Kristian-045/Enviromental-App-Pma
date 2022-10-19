
List getQuesstion(){
  const _questions = [
    {
      'question': 'Ktorý motor je najefektívnejší ?',
      'answers': [
        {'answerText': 'Elektrický', 'score': true},
        {'answerText': 'Vodíkový', 'score': false},
        {'answerText': 'Plynový', 'score': false},
      ],
    },
    {
      'question': 'Ktoré motory škodia prostrediu najmenej?',
      'answers': [
        {'answerText': 'Elektrické', 'score': true},
        {'answerText': 'Vodíkové', 'score': true},
        {'answerText': 'Plynové', 'score': false},
      ],
    },
    {
      'question': 'Ktoré tvrdenie platí pre elektrický motor?',
      'answers': [
        {'answerText': 'Vysoká cena údržby', 'score': false},
        {'answerText': 'Vydržia extrémne teploty', 'score': false},
        {'answerText': 'Nieje potrébné meniť motorový olej', 'score': true},
      ],
    },
    {
      'question': 'Ktoré tvrdenie platí pre plynový motor?',
      'answers': [
        {'answerText': 'Málo miest na tankovanie', 'score': false},
        {'answerText': 'Zákaz parkovania v podzemnej garáži', 'score': true},
        {'answerText': 'Nieje hlučné', 'score': false},
      ],
    },
    {
      'question': 'Ktoré tvrdenie platí pre vodíkový motor?',
      'answers': [
        {'answerText': 'Dostatok miest na tankovanie', 'score': false},
        {'answerText': 'Rýchle tankovanie ', 'score': true},
        {'answerText': 'Neydržia extrémne teploty', 'score': false},
      ],
    },
    {
      'question': 'Ktoré tvrdenie platí pre spaľovací motor?',
      'answers': [
        {'answerText': 'Pre svoj štart vyžadujú cudzí zdroj energie ', 'score': true},
        {'answerText': 'Tento typ motora obsahuje iba jednu pohyblivú súčiastku ', 'score': false},
        {'answerText': 'Vysoká efektivita motora', 'score': false},
      ],
    },
    {
      'question': 'Ktoré tvrdenie patrí ku výhodam spaľovacích motor?',
      'answers': [
        {'answerText': 'Nieje hlučné', 'score': false},
        {'answerText': 'rýchle uvedenie do prevádzky', 'score': true},
        {'answerText': 'Ekologickejší ako plynové motory', 'score': false},

      ],
    },
    {
      'question': 'Na aké kategórie sa môžu deliť plynové motory',
      'answers': [
        {'answerText': 'Podľa druhu spaľovaného paliva', 'score': false},
        {'answerText': 'Podľa pracovného cyklu', 'score': false},
        {'answerText': 'Podľa spôsobu zapálenia zmesi ', 'score': true},
      ],
    }

  ];
  return _questions;
}