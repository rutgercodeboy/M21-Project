import processing.serial.*; //Library for serial communication
import controlP5.*; //library for creating GUI
import processing.video.*; //Needed for playing video files

PFont myFont;


Boolean VotingNotActive = false; //Make TRUE to let ONE PERSON vote
Boolean genrevoting=true; 


ControlP5 cp5; //initiate here

Serial myPort;  // Serial class object
String val;     // Creating a string with the number and letter code from the remote signal

PGraphics pg;
ArrayList<PImage> img = new ArrayList();
ArrayList<PImage> img2 = new ArrayList();

Table table; //Create a table object
boolean Isshowmovie=false; 
int coverW = 200; //Widhth of movie covers
int coverH = 300; //Height of movie covers
int coverSW = 30; //Space between movie covers, Width
int offsetC = 25;  //offset to center movies, needed after adjusting previous variables
int Row1loc = 150; //height of row 1 starting point
int Row2loc = 620; //height of row 2 starting point
int count = 0;

//Location in movie grid for the three users
int hoverMovieU1 = 0;
int hoverMovieU2 = 0;
int hoverMovieU3 = 0;

//Lists for storing the numbers of the movies that are being voted on
IntList votedMoviesU1;
IntList votedMoviesU2;
IntList votedMoviesU3;

ArrayList<OurMovie> myMovies;
ArrayList<Voting> Votes1; 
ArrayList<Voting> Votes2; 
Movie showMOVIE;
String selectedGenrePrint1;
String selectedGenrePrint2;


//Three checkmarks to show the selected movies
PImage C1;
PImage C2;
PImage C3; 

//Count variables
int Horror_c=0; 
int Action_c=0; 
int Adventure_c=0; 
int Comedy_c=0; 
int Drama_c=0; 


void setup() {
  //Todo remove movie list once new genres get selected or match with names
  //todo remove / clear voting list with new selection
  myFont=createFont("Montserrat", 100, true); 
  textFont(myFont); 
  size (3000, 1080);
  frameRate(30); 
  //fullScreen(2); //Number inserted changes what screen to use
  Votes1 = new ArrayList<Voting>();
  Votes2 = new ArrayList<Voting>();
  myMovies = new ArrayList<OurMovie>(); 
  table = loadTable("MoviesList.csv", "header"); //Show file path. header tells Processing there is a row with headers inside this file
  //myMovies.add(new Movie(this, "Psycho.mp4")); 

  C1 = loadImage("CheckmarkU1.png");
  C2 = loadImage("CheckmarkU2.png");
  C3 = loadImage("CheckmarkU3.png");

  //  printArray(Serial.list()); First we used the serial.list function to find the correct comm port number
  String portName = Serial.list()[4]; //Here we select the port number the Arduino is connected with
  myPort = new Serial(this, portName, 115200); //115200 is the baud rate setting used for communication


  //Now we create lists to store the movies participants select
  votedMoviesU1 = new IntList();
  votedMoviesU2 = new IntList();
  votedMoviesU3 = new IntList();

  //

  cp5 = new ControlP5(this);
  cp5.addBang("Horror+", 2000, 300, 70, 70);
  cp5.addBang("Horror-", 2000, 400, 70, 70);
  cp5.addBang("Comedy+", 2100, 300, 70, 70);
  cp5.addBang("Comedy-", 2100, 400, 70, 70);
  cp5.addBang("Action+", 2200, 300, 70, 70);
  cp5.addBang("Action-", 2200, 400, 70, 70);
  cp5.addBang("Drama+", 2300, 300, 70, 70);
  cp5.addBang("Drama-", 2300, 400, 70, 70);
  cp5.addBang("Adventure+", 2400, 300, 70, 70);
  cp5.addBang("Adventure-", 2400, 400, 70, 70);

  cp5.addBang("Close genre voting", 2500, 300, 170, 170);
}

class Voting {
  boolean votedUser1; 
  boolean votedUser2; 
  boolean votedUser3; 

  int MovieIndex; 


  public Voting(int index) {
    this.MovieIndex = index;
  }

  public void SetAndResetVotingUser1() {
    votedUser1 = !votedUser1;
  }

  public void SetAndResetVotingUser2() {
    votedUser2 = !votedUser2;
  }

  public void SetAndResetVotingUser3() {
    votedUser3 = !votedUser3;
  }

  public boolean VotedByAllThree() {
    return votedUser1 & votedUser2 & votedUser3;
  }
}

class OurMovie {
  public Movie movie;
  public String movieName;
  public PImage image;
  public int index;
  public boolean isFirstrow;
  public OurMovie(String name, Movie m, int index, boolean isFirstrow) {
    this.movieName = name;
    this.movie = m;
    this.index =index;
    this.isFirstrow=isFirstrow;
  }
}
