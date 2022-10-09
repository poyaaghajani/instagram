import 'package:instagram_ui/Constants/class.dart';

List<Class> getClassList() {
  var storyText = Class();
  storyText.storys = [
    'David',
    'Mark',
    'Rose',
    'Amanda',
    'Jack',
    'Selena',
    'Jenifer',
    'Karen',
    'Margo',
    'Kim',
    'Drake',
    'Jhon',
    'Emma',
    'Alison',
    'Lauren',
    'Mark',
    'Billi'
  ];

  var categoryText = Class();
  categoryText.categorys = [
    'Nature',
    'Sport',
    'Make up',
    'Car',
    'Hashtag',
    'Technologi',
    'Animal',
  ];

  var thisWeekText = Class();
  thisWeekText.thisWeekText = [
    'Ema',
    'Mikel',
    'Rose',
    'Jason',
    'Billi',
  ];

  var username = Class();
  username.username = [
    '_darkness',
    'Mark Anderson',
    '^.Rosita.^',
    'Amanda Celareck',
    'Jack_sparrow',
    '_Seliiii',
    'Jenifer <3',
    'KRN',
    'Margo~~',
    'Kim Kardashian',
    'Happyness',
    'Jhon_borber',
    '~EMA..!',
    'Alisonnn',
    '^ call me Louren ^',
    'Mark',
    'Billi'
  ];

  var highlight = Class();
  highlight.highlight = [
    'Hobbies',
    'At work',
    'Road',
    'Nights',
    'Friends',
  ];
  return [storyText, categoryText, thisWeekText, username, highlight];
}
