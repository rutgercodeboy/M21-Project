void controlEvent(ControlEvent theEvent) {


  if (theEvent.getController().getName()=="Horror+") {
    if (Horror_c<8) {
      Horror_c++;
    }
  }

  if (theEvent.getController().getName()=="Horror-") {
    if (Horror_c>0) {
      Horror_c--;
    }
  }
  if (theEvent.getController().getName()=="Action+") {
    if (Action_c<8) {
      Action_c++;
    }
  }

  if (theEvent.getController().getName()=="Action-") {
    if (Action_c>0) {
      Action_c--;
    }
  }
  if (theEvent.getController().getName()=="Comedy+") {
    if (Comedy_c<8) {
      Comedy_c++;
    }
  }

  if (theEvent.getController().getName()=="Comedy-") {
    if (Comedy_c>0) {
      Comedy_c--;
    }
  }
  if (theEvent.getController().getName()=="Drama+") {
    if (Drama_c<8) {
      Drama_c++;
    }
  }

  if (theEvent.getController().getName()=="Drama-") {
    if (Drama_c>0) {
      Drama_c--;
    }
  }
  if (theEvent.getController().getName()=="Adventure+") {
    if (Adventure_c<8) {
      Adventure_c++;
    }
  }

  if (theEvent.getController().getName()=="Adventure-") {
    if (Adventure_c>0) {
      Adventure_c--;
    }
  }
  if (theEvent.getController().getName()=="Close genre voting") {
    genrevoting=false;
  }
}
