
//Direct connection SCREEN Code

void DirectSetup(){
  println("DIRECT SCREEN"); // on écrit sur la console processing
  
  c = new Client(this, cst_DirectIP, PORT); //"192.168.4.1", 574
  println(c); // on écrit le numéro de c sur la console
  println("Here");
  while(c == null){ // tant que c n'est pas connecté (quand c renvois null c'est qu'il n'a pas pu se connecter)
     println("ERROR IN CONNECTION");// on renvoit une érreur sur la console
     if(mousePressed){ // quand on appuis sur l'écran( au doigt ou a la souris) on essaye a nouveau de se connecter.
       c = new Client(this, cst_DirectIP, PORT); //"192.168.4.1", 574
     }
  }
  c.write("CONNECTION \r\n"); // quand on a réussi on envoit "connection" sur le wifi vers l'esp8266 
  
  
}



void DirectScreen(){
  background(34,34,34);

 strokeWeight(4); // largeur des trait (4 pixels)
 noFill();
 
 ToggleBtn.display();
 ExitBtn.display();// affiche le cadre pour le bouton pour fermer l'app
 PingBtn.display();// affiche le cadre pour le bouton pour ping
 BackBtn.display();// affiche le cadre pour le bouton pour retour arrière
 PlusBtn.display();// affiche le cadre pour le bouton pour parametrer
 
 fill(255);
 textFrame("Toggle", ToggleBtn); //on écrit dans les cadres
 textFrame("EXIT", ExitBtn);
 textFrame("PING", PingBtn);
 textFrame("<", BackBtn);
 textFrame("+", PlusBtn);
 
 //switch (montre l'état d'un bouton)
 line(0, height/10, width/10, height/10); // coordonnée de 2 points entre lesquels on va tracer une droite (x1,y1,x2,y2)
 line(2*width/10, height/10, 3*width/10, height/10);
 line(2*width/10, height/10, 2*width/10, height/10-15);
 if(pressed){
   line(width/10, height/10, 2*width/10, height/10);
 }
 else{
   
   line(width/10, height/10, 2*width/10, height/10 - 30);
 }
  //fin switch
  
}


void DirectLoop(){
  //NON TERMINE
  
  if( c.active() == false){ // si on est plus connecté
    //c.stop(); // on arrete la connexion
    //println("Direct.Loop");exit(); // on fait crash l'app
  }
  if (c.available() > 0) {    // If there's incoming data from the client...
    data = c.readString();  // la chaine de caractère data prends la valeur de ce que l'on reçois
    println("-" + data + "-"); // on écrit sur la console "-data-"
    if(data.equals("BPON")){ // si la donnée reçu est BPON
      pressed = true; //on passe l'état connu du bouton a 1
    }
    else if(data.equals("BPOFF")){ // sinon on reçois BPOFF
      pressed = false; // etat à 0
    }
    else if(data.equals("PONG")){ // si on reçois PONG (le retour du PING)
      ping = millis() - millis; //on soustrait l'heure actuel en ms par l'ancienne heure capturé a l'envois du PING
      print("ping = "); // on écrit sans sauter la ligne dans la console
      println(ping);// le ping est écrit dans la console
    }
    else{
      println("Unknown CMD");// on écrit dans la console qu'on ne connait pas la commande. 
    }
  }
  
}

void DirectPressed(){
  
  

  if(clickFrame(ToggleBtn)){// si on detecte que l'on clique ou que l'on appuit sur le cadre ToggleBtn
    ToggleBtn.filling = true; // on rempli le cadre
  }
  
  if(clickFrame(ExitBtn)){ //pareil pour ExitBtn
    ExitBtn.filling = true;
  }
  
  if(clickFrame(PingBtn)){ //pareil pour PingBtn
    PingBtn.filling = true;
  }
  
  if(clickFrame(BackBtn)){ // pareil pour le BackBtn
    BackBtn.filling = true;
    
  }
}


void DirectReleased(){
  
  
  
  if(clickFrame(ToggleBtn) && ToggleBtn.filling ){// si on n'appuis plus sur le Togglebtn mais qu'on est dans le cadre et que le cadre était rempli
    ToggleBtn.filling = false;// on annule le remplissage
   c.write("TOGGLE\r\n"); // on envois un message a l'esp
  }
  
  if(clickFrame(ExitBtn) && ExitBtn.filling){
    ExitBtn.filling = false;
   c.stop(); 
   println("Direct.released");exit();
  }
  
  if(clickFrame(PingBtn) && PingBtn.filling){// si on n'appuis plus sur le PingBtn mais qu'on est dans le cadre et que le cadre était rempli
    PingBtn.filling = false;// on annule le remplissage
    println("Ping Send !");// en écrit "Ping Send !" sur la console
    millis = millis();// on enregistre l'heure actuel en ms
    c.write("PING\r\n");// on envois un message a l'esp8266
  }
  
  if(clickFrame(BackBtn) && BackBtn.filling){// si on n'appuis plus sur le BackBtn mais qu'on est dans le cadre et que le cadre était rempli
    BackBtn.filling = false; // on annule le remplissage
   c.stop(); // on éteint la connexion
   screen = "Menu"; // on retourne dans l'écran Menu
  }
  // on annule les remplissage
  ToggleBtn.filling = false;
  ExitBtn.filling = false;
  PingBtn.filling = false;
  BackBtn.filling = false;

  
}
