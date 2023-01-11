public void movieVote(int selectedMovie) {
}


public void confirmSelectedMovieU1(int hoverMovieU1, boolean isFirstrow) {
  votedMoviesU1.appendUnique(hoverMovieU1);
  //compareSelectedMovies();
  if (isFirstrow) {
    Voting voteU1 = Votes1.get(hoverMovieU1); 
    if (voteU1 != null)
      Votes1.get(hoverMovieU1).SetAndResetVotingUser1();
    return;
  }

  Voting voteU2 = Votes2.get(hoverMovieU1); 
  if (voteU2 != null)
    Votes2.get(hoverMovieU1).SetAndResetVotingUser1();
}


public void confirmSelectedMovieU2(int hoverMovieU2, boolean isFirstrow) {
  votedMoviesU2.appendUnique(hoverMovieU2);
  //compareSelectedMovies();
  if (isFirstrow) {
    Voting voteU1 = Votes1.get(hoverMovieU2); 
    if (voteU1 != null)
      Votes1.get(hoverMovieU2).SetAndResetVotingUser2();
    return;
  }

  Voting voteU2 = Votes2.get(hoverMovieU2); 
  if (voteU2 != null)
    Votes2.get(hoverMovieU2).SetAndResetVotingUser2();
}

public void confirmSelectedMovieU3(int hoverMovieU3, boolean isFirstrow) {
  votedMoviesU1.appendUnique(hoverMovieU3);
  //compareSelectedMovies();
  if (isFirstrow) {
    Voting voteU1 = Votes1.get(hoverMovieU3); 
    if (voteU1 != null)
      Votes1.get(hoverMovieU3).SetAndResetVotingUser3();
    return;
  }

  Voting voteU2 = Votes2.get(hoverMovieU3); 
  if (voteU2 != null)
    Votes2.get(hoverMovieU3).SetAndResetVotingUser3();
}

public void compareSelectedMovies() {  
  for (int i=0; i<votedMoviesU1.size(); i++) {
    if (votedMoviesU2.hasValue(votedMoviesU1.get(i))== true) {
      if (votedMoviesU3.hasValue(votedMoviesU1.get(i))== true) {
        //playMovie();
      }
    }
  }
}

public boolean CheckIfAllVoted(int movieIndex, boolean isFirstrow) {
  if (isFirstrow) {
    Voting vote = Votes1.get(movieIndex);
    if (vote != null) {
      return vote.VotedByAllThree();
    }
    println("Error: Vote is not available for movie with index "+movieIndex);
    return false;
  }



  Voting vote = Votes2.get(movieIndex);
  if (vote != null) {
    return vote.VotedByAllThree();
  }
  println("Error: Vote is not available for movie with index "+movieIndex);
  return false;
}

public void playMovie(int index, boolean isFirstrow) {
  println("play movie with index "+index);
  //TODO get movie out of list
  if(!isFirstrow){
    index = index-8;
  }

  Movie movieToShow = null; 

  for (OurMovie m : myMovies) {

    if (m.index == index && m.isFirstrow == isFirstrow) {
      movieToShow = m.movie;
      break;
    }
  }
  if (movieToShow!= null) {
    println("movie found "+index);
    showMOVIE = movieToShow;
    Isshowmovie=true;
    //image(movieToShow, 0, 0); //Draws the movie on the screen
    movieToShow.play();
  } else {
    println("movie not found "+index);
  }
}

void movieEvent(Movie m) {
  m.read();
}
