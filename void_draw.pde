void draw() {
  int indexVotingMovie = 0; 
  background(164, 165, 174);
  pg = createGraphics(coverW, coverH);
  pg.beginDraw();
  pg.fill(255);
  pg.smooth();
  pg.rect(0, 0, coverW, coverH); 
  pg.endDraw();

  if (genrevoting==true) {
    pushStyle(); 
    fill(204, 102, 0); 
    rect(300, 900, 100, (Horror_c*-80)); 
    textSize(35);

    fill(165, 225, 222); 
    rect(500, 900, 100, (Comedy_c*-80)); 
    textSize(35);

    fill(245, 227, 65); 
    rect(700, 900, 100, (Action_c*-80)); 
    textSize(35);

    fill(30, 65, 222); 
    rect(900, 900, 100, (Drama_c*-80)); 
    textSize(35);

    fill(0, 207, 138); 
    rect(1100, 900, 100, (Adventure_c*-80)); 
    textSize(35);
    popStyle();

    textSize(35);
    text("Horror", 290, 950);
    text("Drama", 890, 950);
    text("Comedy", 490, 950);
    text("Action", 690, 950);
    text("Adventure", 1090, 950);
  } else {

    //Code for printing row 1 of movies with genre
    if (selectedGenrePrint1 != null) {
      textSize(65);
      text("Genre:" + selectedGenrePrint1, 550, 120);
    }

    //Add code for showing genre names


    for (int i=0; i<img.size(); i++) {
      //img.add ( loadImage("img"+i+".jpg") );
      if (img.get(i) != null) {
        img.get(i).resize(coverW, coverH);
        img.get(i).mask(pg.get() );
        image( img.get(i), (offsetC+ i*coverW+ (i+1)*coverSW), Row1loc ); //Now give each cover equal spacing

        //TODO fill votes list
        Votes1.add(new Voting(indexVotingMovie));
        indexVotingMovie++;
      }
    }

    //Code for printing row 2 of movies with genre
    if (selectedGenrePrint2 != null) {
      textSize(65);
      text("Genre:" + selectedGenrePrint2, 550, 600);
    }

    indexVotingMovie =0;
    //Add code for showing genre names
    for (int i=0; i<img2.size(); i++) {
      if (img2.get(i) != null) {
        img2.get(i).resize(coverW, coverH);
        img2.get(i).mask(pg.get() );
        image( img2.get(i), (offsetC+ i*coverW+ (i+1)*coverSW), Row2loc ); //Now give each cover equal spacing

        //TODO fill votes list
        Votes2.add(new Voting(indexVotingMovie));
        indexVotingMovie++;
      }
    }

    //ARDUINO SERIAL COMMUNICATION
    if (myPort.available() > 0) 
    {  // If data is available,
      val = myPort.readStringUntil('\n');         // read it and store it in val

      if (val != null) {
        String data = trim(val);
        //USER one
        println(data); 
        
        //if((data.length()>6 && data.equals("FFFFFFFF") == false) || data.equals("0")){
        //    println("new port init");
        //    myPort.stop();
        //    String portName = Serial.list()[4]; //Here we select the port number the Arduino is connected with
        //    myPort = new Serial(this, portName, 9600);
        //}
        
        
        if (data.equals("F708FF00")==true) {
          if (hoverMovieU1 > 0) {
            hoverMovieU1-=1;
          }
        } else if (data.equals("E718FF00")==true) {
          if ((hoverMovieU1>7) && (hoverMovieU1 < 16)) {
            hoverMovieU1-=8;
          }
        } else if (data.equals("A55AFF00")==true) {
          if (hoverMovieU1 < 15) {
            hoverMovieU1+=1;
          }
        } else if (data.equals("AD52FF00")==true) {
          if ((hoverMovieU1>-1) && (hoverMovieU1 < 8)) {
            hoverMovieU1+=8;
          }
          movieVote(hoverMovieU1);
        } else if (data.equals("E31CFF00")==true) {
          println("Okay remote");
          boolean isFirstrow=false;
          if ((hoverMovieU1>-1) && (hoverMovieU1 < 8)) {
            isFirstrow=true;
          }
          confirmSelectedMovieU1(hoverMovieU1, isFirstrow);
          if (VotingNotActive==true) {
            playMovie(hoverMovieU1, isFirstrow);
          } else if (CheckIfAllVoted(hoverMovieU1, isFirstrow)) {
            playMovie(hoverMovieU1, isFirstrow);
          }
        }
        //USER TWO
        if (data.equals("BC43FF00")==true) {
          if (hoverMovieU2 > 0) {
            hoverMovieU2-=1;
          }
        } else if (data.equals("EA15FF00")==true) {
          if ((hoverMovieU2>7) && (hoverMovieU2 < 16)) {
            hoverMovieU2-=8;
          }
        } else if (data.equals("BB44FF00")==true) {
          if (hoverMovieU2 < 15) {
            hoverMovieU2+=1;
          }
        } else if (data.equals("B946FF00")==true) {
          if ((hoverMovieU2>-1) && (hoverMovieU2 < 8)) {
            hoverMovieU2+=8;
          }
          movieVote(hoverMovieU2);
        } else if (data.equals("BF40FF00")==true) {
          boolean isFirstrow=false;
          if ((hoverMovieU2>-1) && (hoverMovieU2 < 8)) {
            isFirstrow=true;
          }
          confirmSelectedMovieU2(hoverMovieU2, isFirstrow);
          if (VotingNotActive==true) {
            playMovie(hoverMovieU2, isFirstrow);
          } else if (CheckIfAllVoted(hoverMovieU2, isFirstrow)) {
            playMovie(hoverMovieU2, isFirstrow);
          }
        }
        //USER THREE
        if (data.equals("EF10EF00")==true) {
          if (hoverMovieU3 > 0) {
            hoverMovieU3-=1;
          }
        } else if (data.equals("F20DEF00")==true) {
          if ((hoverMovieU3>7) && (hoverMovieU3 < 16)) {
            hoverMovieU3-=8;
          }
        } else if (data.equals("ED12EF00")==true) {
          if (hoverMovieU3 < 15) {
            hoverMovieU3+=1;
          }
        } else if (data.equals("EA15EF00")==true) {
          if ((hoverMovieU3>-1) && (hoverMovieU3 < 8)) {
            hoverMovieU3+=8;
          }
          movieVote(hoverMovieU3);
        } else if (data.equals("EE11EF00")==true) {
          boolean isFirstrow=false;
          if ((hoverMovieU3>-1) && (hoverMovieU3 < 8)) {
            isFirstrow=true;
          }
          confirmSelectedMovieU3(hoverMovieU3, isFirstrow);
          if (VotingNotActive==true) {
            playMovie(hoverMovieU3, isFirstrow);
          } else if (CheckIfAllVoted(hoverMovieU3, isFirstrow)) {
            playMovie(hoverMovieU3, isFirstrow);
          }
        }
      }
    }


    //println(val); //print it out in the console

    //USER ICONS THAT MOVE:



    //User 2 icon 

    pushStyle(); 
    fill(80, 200, 90);
    if ((hoverMovieU2 > -1) && (hoverMovieU2 <8) ) {
      circle((offsetC+ coverSW + (hoverMovieU2*(coverW+coverSW))+100), (Row1loc + coverH), 40);
    } else if ((hoverMovieU2 > 7) && (hoverMovieU2 <16) ) {
      circle((offsetC+ coverSW + ((hoverMovieU2-8)*(coverW+coverSW))+100), (Row2loc + coverH), 40);
    }
    popStyle(); 

    if (VotingNotActive==false) {
      if ((selectedGenrePrint1 != null) && (selectedGenrePrint2!=null)) {
        //User 1 icon following movie number. If selectedmovie between 0-7 do row this, if between 8-15 use different coordinates etc
        if ((hoverMovieU1 > -1) && (hoverMovieU1 <8) ) {
          circle((20+offsetC+ coverSW + (hoverMovieU1*(coverW+coverSW))), (Row1loc + coverH), 40);
        } else if ((hoverMovieU1 > 7) && (hoverMovieU1 <16) ) {
          circle((20+offsetC+ coverSW + ((hoverMovieU1-8)*(coverW+coverSW))), (Row2loc + coverH), 40);
        }

        //User 3 icon
        pushStyle();
        fill(204, 102, 0);
        if ((hoverMovieU3 > -1) && (hoverMovieU3 <8) ) {
          circle((offsetC+ coverSW + (hoverMovieU3*(coverW+coverSW))+180), (Row1loc + coverH), 40);
        } else if ((hoverMovieU3 > 7) && (hoverMovieU3 <16) ) {
          circle((offsetC+ coverSW + ((hoverMovieU3-8)*(coverW+coverSW))+180), (Row2loc + coverH), 40);
        }
        popStyle();
      }
    }
    //Draw checkmarks for user 1
    //for (int i=0; i<votedMoviesU1.size(); i++) {
    //if ((votedMoviesU1.get(i) > -1) && (votedMoviesU1.get(i) <8) ) {
    //image(C1, (offsetC+ coverSW + (votedMoviesU1.get(i)*(coverW+coverSW))), 350, width/40, height/40);
    //} else if ((votedMoviesU1.get(i) > 7) && (votedMoviesU1.get(i) <16) ) {
    // image(C1, (offsetC+ coverSW + ((votedMoviesU1.get(i)-8)*(coverW+coverSW))), (Row2loc + coverH), width/40, height/40);
    // }
    //}




    for (int i=0; i<Votes1.size(); i++) {
      if ((Votes1.get(i).votedUser1) ) {
        image(C1, (offsetC+ coverSW + (Votes1.get(i).MovieIndex*(coverW+coverSW))), (Row1loc + coverH), width/40, height/40);
      } else {
        //todo / remove the image again
      }

      if ((Votes1.get(i).votedUser2) ) {
        image(C2, (offsetC+ coverSW + (Votes1.get(i).MovieIndex*(coverW+coverSW))+35), (Row1loc + coverH), width/40, height/40);
      } else {
        //todo / remove the image again
      }

      if ((Votes1.get(i).votedUser3) ) {
        image(C3, (offsetC+ coverSW + (Votes1.get(i).MovieIndex*(coverW+coverSW))+70), (Row1loc + coverH), width/40, height/40);
      } else {
        //todo / remove the image again
      }
    }


    for (int i=0; i<Votes2.size(); i++) {
      if ((Votes2.get(i).votedUser1) ) {
        image(C1, (offsetC+ coverSW + (Votes2.get(i).MovieIndex*(coverW+coverSW))), (Row2loc + coverH), width/40, height/40);
      } else {
        //todo / remove the image again
      }

      if ((Votes2.get(i).votedUser2) ) {
        image(C2, (offsetC+ coverSW + (Votes2.get(i).MovieIndex*(coverW+coverSW))+35), (Row2loc + coverH), width/40, height/40);
      } else {
        //todo / remove the image again
      }

      if ((Votes2.get(i).votedUser3) ) {
        image(C3, (offsetC+ coverSW + (Votes2.get(i).MovieIndex*(coverW+coverSW))+70), (Row2loc + coverH), width/40, height/40);
      } else {
        //todo / remove the image again
      }
    }

    //Replicate for u2 and u3

    if (Isshowmovie) {
      image(showMOVIE, 0, 0, 1920, 1080); //Draws the movie on the screen
    }

    //Used to find mappings to keys
    // println(keyCode);
  }
}
