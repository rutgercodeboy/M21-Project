void keyPressed() {

  //KEY PRESSES USER 1:

  //Going to the left

  if (keyCode == 37) {

    if (hoverMovieU1 > 0) {
      hoverMovieU1-=1;
    }
    movieVote(hoverMovieU1);
    //Going to the right
  } else if (keyCode == 39) {
    if (hoverMovieU1 < 15) {
      hoverMovieU1+=1;
    }
    //Going up
    movieVote(hoverMovieU1);
  } else if (keyCode == 38) {
    if ((hoverMovieU1>7) && (hoverMovieU1 < 16)) {
      hoverMovieU1-=8;
    }
    //Going down
  } else if (keyCode == 40) {
    if ((hoverMovieU1>-1) && (hoverMovieU1 < 8)) {
      hoverMovieU1+=8;
    }
    movieVote(hoverMovieU1);
  } else if (keyCode == ENTER) {
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

  //KEY PRESSES USER 2:
  //Going to the left
  if (keyCode == 65) {
    if (hoverMovieU2 > 0) {
      hoverMovieU2-=1;
    }
    movieVote(hoverMovieU2);
    //Going to the right
  } else if (keyCode == 68) {
    if (hoverMovieU2 < 15) {
      hoverMovieU2+=1;
    }
    //Going up
    movieVote(hoverMovieU2);
  } else if (keyCode == 87) {
    if ((hoverMovieU2>7) && (hoverMovieU2 < 16)) {
      hoverMovieU2-=8;
    }
    //Going down
  } else if (keyCode == 83) {
    if ((hoverMovieU2>-1) && (hoverMovieU2 < 8)) {
      hoverMovieU2+=8;
    }
    movieVote(hoverMovieU2);
  } else if (keyCode == ALT) {

    boolean isFirstrow=false;
    if ((hoverMovieU2>-1) && (hoverMovieU2 < 8)) {
      isFirstrow=true;
    }

    confirmSelectedMovieU2(hoverMovieU2, isFirstrow);
    if (CheckIfAllVoted(hoverMovieU2, isFirstrow)) {
      playMovie(hoverMovieU2, isFirstrow);
    }
  }





  //KEY PRESSES USER 3:
  //Going to the left
  if (keyCode == 70) {
    if (hoverMovieU3 > 0) {
      hoverMovieU3-=1;
    }
    movieVote(hoverMovieU3);
    //Going to the right
  } else if (keyCode == 72) {
    if (hoverMovieU3 < 15) {
      hoverMovieU3+=1;
    }
    //Going up
    movieVote(hoverMovieU3);
  } else if (keyCode == 84) {
    if ((hoverMovieU3>7) && (hoverMovieU3 < 16)) {
      hoverMovieU3-=8;
    }
    //Going down
  } else if (keyCode == 71) {
    if ((hoverMovieU3>-1) && (hoverMovieU3 < 8)) {
      hoverMovieU3+=8;
    }
    movieVote(hoverMovieU3);
  } else if (keyCode == TAB) {

    boolean isFirstrow=false;
    if ((hoverMovieU3>-1) && (hoverMovieU3 < 8)) {
      isFirstrow=true;
    }

    confirmSelectedMovieU3(hoverMovieU3, isFirstrow);
    if (CheckIfAllVoted(hoverMovieU3, isFirstrow)) {
      playMovie(hoverMovieU3, isFirstrow);
    }
  }


  int timesKeyboardPressed =0;
  if (keyCode == 49) {
    timesKeyboardPressed++;
    selectGenre("Comedy");
  } else if (keyCode == 50) {
    timesKeyboardPressed++;
    selectGenre("Adventure");
  } else if (keyCode == 51) {
    timesKeyboardPressed++;
    selectGenre("Action");
  } else if (keyCode == 52) {
    timesKeyboardPressed++;
    selectGenre("Drama");
  } else if (keyCode == 53) {
    timesKeyboardPressed++;
    selectGenre("Horror");
  } else if (keyCode == 54) {
    timesKeyboardPressed++;
    selectGenre("Mixed");
  } else if (keyCode == 55) {
    timesKeyboardPressed++;
    selectGenre("Mixed ");
  }

  if (timesKeyboardPressed==2) {
    timesKeyboardPressed=0;
    myMovies.clear();
  }
}
