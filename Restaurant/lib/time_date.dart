
  String DateMonth(DateTime now){



    String Dm= "";
    String weekday = "";
    int day = now.day;
    int month = now.month;

    if (month == 1){
      Dm = "Jan";
    }
    else if (month == 2){
      Dm  = "Feb";
    }
    else if (month == 3){
      Dm  = "Mar";
    }
    else if (month == 4){
      Dm  = "Apr";
    }
    else if (month == 5){
      Dm  = "May";
    }
    else if (month == 6){
      Dm  = "Jun";
    }
    else if (month == 7){
      Dm  = "Jul";
    }
    else if (month == 8){
      Dm  = "Aug";
    }
    else if (month == 9){
      Dm  = "Sep";
    }
    else if (month == 10){
      Dm  = "Oct";
    }
    else if (month == 11){
      Dm  = "Nov";
    }
    else {

    Dm  = "Dec";

    }

    Dm = Dm + " $day";

    if (now.weekday == 1){
      weekday = "Monday";
    }

    else if (now.weekday == 2){
      weekday = "Tuesday";
    }
    else if (now.weekday == 3){
      weekday = "Wednesday";
    }
    else if (now.weekday == 4){
      weekday = "Thursday";
    }

    else if (now.weekday == 5){
      weekday = "Friday";
    }
    else if (now.weekday == 6){
      weekday = "Saturday";
    }
    else if (now.weekday == 7){
      weekday = "Sunday";
    }

    return weekday +", " +  Dm;





  }

  String DateMonthYear(DateTime now){


    String Dm= "";
    String weekday = "";
    int day = now.day;
    int month = now.month;

    if (month == 1){
      Dm = "Jan";
    }
    else if (month == 2){
      Dm  = "Feb";
    }
    else if (month == 3){
      Dm  = "Mar";
    }
    else if (month == 4){
      Dm  = "Apr";
    }
    else if (month == 5){
      Dm  = "May";
    }
    else if (month == 6){
      Dm  = "Jun";
    }
    else if (month == 7){
      Dm  = "Jul";
    }
    else if (month == 8){
      Dm  = "Aug";
    }
    else if (month == 9){
      Dm  = "Sep";
    }
    else if (month == 10){
      Dm  = "Oct";
    }
    else if (month == 11){
      Dm  = "Nov";
    }
    else {

      Dm  = "Dec";

    }

    Dm = Dm + " $day" + ", " +  now.year.toString();

    return Dm;


  }