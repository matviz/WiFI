//Menu screen code

Frame DirectCoBtn = new Frame(); // on défini DirectCoBtn comme cadre
Frame LocalCoBtn = new Frame(); // on défini DirectCoBtn comme cadre


void MenuSetup(){
  background(34,34,34); // on fait un backgroud gris foncé (on pourrait juste marque background(34))
  
  
  textAlign(CENTER,CENTER); // on alligne le texte avec son point central
  
  DirectCoBtn.defineLength(width/4,height/8,width/2,height/4); // on défini la taille du cadre de DirectCoBtn
  DirectCoBtn.Border = color(255); // on défini la couleur de ses bord (une entrée donne forcément du gris mais avec 255 on a du blanc)
  DirectCoBtn.Fill = color(255, 64);// on défini la couleur de remplissage (2 entrée donne la couleur en nuance de gris (255 = blanc) et le alpha (transparence))
  DirectCoBtn.filling = false;// on ne rempli pas le cadre par défault
  
  LocalCoBtn.defineLength(width/4,height/2,width/2,height/4);
  LocalCoBtn.Border = color(255);
  LocalCoBtn.Fill = color(255, 64);
  LocalCoBtn.filling = false;
  
  }


void MenuScreen(){
  background(34,34,34); // nuance de gris foncé
  
  DirectCoBtn.display(); // fait apparaitre le cadre et son remplissage si filling == 1
  LocalCoBtn.display(); // fait apparaitre le cadre et son remplissage si filling == 1
  
  fill(255); // couleur de remplissage est le blanc, donc on écrit aussi en blanc
  textFrame("Direct Connection", DirectCoBtn); // on écrit dans le DirectCoBtn 
  textFrame("Connect Through Local Network", LocalCoBtn); // on écrit dans le LocalCoBtn
  
  
  
}

void MenuLoop(){
  // on fait rien mais on pourrait faire quelque chose si on avait quelque chose a faire ici
  
  
}



void MenuPressed(){
  
  if(clickFrame(DirectCoBtn)){ // si on detecte que l'on clique ou que l'on appuit sur le cadre DirectCoBtn 
    DirectCoBtn.filling = true; // on remplit le cadre de DirectCoBtn
  }
  
  else if(clickFrame(LocalCoBtn)){// pareil avec LocalCoBtn
    LocalCoBtn.filling = true;
  }
  
  
  
}

void MenuReleased(){
  
  
  
  if(clickFrame(DirectCoBtn) && DirectCoBtn.filling ){// si on n'appuis plus sur le DirectCoBtn mais qu'on était dans le cadre et que le cadre était rempli
    DirectCoBtn.filling = false;// on enlève le remplissage
    screen = "Direct";//on donne la valeur "Direct" a screen pour pouvoir rentrer dans l'écran Direct
  }
  
  else if(clickFrame(LocalCoBtn) && LocalCoBtn.filling ){
    LocalCoBtn.filling = false;
    screen = "Local"; // on donne la valeur "Local" a screen
  }
  DirectCoBtn.filling = false;
  LocalCoBtn.filling = false;
  // on annule forcément le remplissage.
 
  
}
