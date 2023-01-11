StringList FileNamesList = new StringList();
//StringList MovieFileNames = new StringList(); 
boolean dumboIndex = false;

public void selectGenre(String selectedGenre) {
 // println(selectedGenre);
  FileNamesList.clear();
  //myMovies.clear();
  for (TableRow row : table.rows()) {
    String genre = row.getString("Genre");
    String name = row.getString("File_Names");
	
    if (genre.equals(selectedGenre) == true) {
   //   println(name);
      FileNamesList.append(name);	  
	    
    }
  }
  drawMovieImg(selectedGenre);
} 


void drawMovieImg(String selectedGenre) {
  if (dumboIndex == false) {
    img.clear();
  } else {
    img2.clear();
  }
  for (int i=0; i<FileNamesList.size(); i++) {
    if (dumboIndex == false) {
       selectedGenrePrint1 = selectedGenre;
      img.add(loadImage(FileNamesList.get(i)+".jpg"));
      myMovies.add(new OurMovie(FileNamesList.get(i),new Movie(this, FileNamesList.get(i)+".mp4"),i,true)); 
    } else {
      selectedGenrePrint2 = selectedGenre;
      img2.add(loadImage(FileNamesList.get(i)+".jpg"));
       myMovies.add(new OurMovie(FileNamesList.get(i),new Movie(this, FileNamesList.get(i)+".mp4"),i,false)); 
    }
  }
  dumboIndex = !dumboIndex;
}
