// Classe frame et ses fonctions pour affichage simplifié de cadres et de textes

class Frame{
    float Top;// haut du cadre
    float Height;//hauteur du cadre
    float Bottom;//bas du cadre
    float Left;//gauche du cadre
    float Width;//largeur du cadre
    float Right;//droite du cadre
    
    color Border;//couleur des bords du cadre
    color Fill;// couleur des lettres ou remplissage des cadre
    boolean filling;//es-que c'est rempli ou pas
                                                                                            //(0;0)
    boolean defineCorners(float TLx, float TLy, float BRx, float BRy){                      //TL(x;y)    //top left
      Top = TLy;//position du haut du cadre                                                 //+------------------.
      Bottom = BRy;//position du bas du cadre                                               //|                  |
      Height = Bottom - Top;// la hauteur du cadre = position_haute - position_bas          //|                  |
      Left = TLx;//position droite du cadre                                                 //|                  |
      Right = BRx;//position haut du cadre                                                  //.------------------+ BR(x;y) //bottom right
      Width = Right - Left;                                                                 //                              (width;height)
      if(Height < 0 || Width < 0){// si soit la hauteur soit la largeur sont inférieur a 0 on refuse
        return false;
      }
      else{// sinon on accepte
        return true;
      }
    }
    
    void defineLength(float TLx, float TLy, float W, float H){ // définir un cadre par rapport a un point, une largeur et une hauteur
      Top = TLy; //coordonnée y du point en haut à gauche                           //(0;0)
      Height = H;//hauteur que l'on veut                                            //TL(x;y) Height  //top left
      Bottom = Top + Height; // le bas                                              //+--------^----------.
      Left = TLx;// coordonnée x du point en haut à gauche                          //|        |          |
      Width = W;// largeur que l'on veut                                            //|<-------|--------->|Width
      Right = Left + Width;// le point de droite                                    //|        |          |
                                                                                    //.--------v----------+ point à définir(Right;Bottom)
    }
    
    
    void display(){

      stroke(Border);//couleur des contours
      if(filling){
        fill(Fill);//on remplis de la couleur choisit
      }
      else{
        noFill();//on enlève le remplissage
      }
      rect(Left, Top, Width, Height);// on trace le rectangle
    }

    
}

void textFrame(String text, Frame frame){ //permet d'afficher un texte dans un cadre de manière à ce qu'il rentre bien dedans à la taille de police maximale
  
  //MUST PUT THIS IN SETUP
  //textAlign(CENTER,CENTER);
  
  int textSize = 0; //on init la taille du texte a 0
  do{
    textSize++;// on incrémente
    textSize(textSize);// la taille du texte prend la valeur demandé
    
  }while(textWidth(text) < frame.Width && textSize < frame.Height );// tant que le texte soit a la limite de sortir du cadre
  textSize *= 0.95;// on le multiplie par 0.95 pour qu'il soit dans le cadre et pas collé aux bord
  textSize(textSize);// la taille du texte prend la valeur demandé
  
  text(text, (frame.Right + frame.Left)/2, (frame.Top + frame.Bottom) /2);//on affiche le texte dans le cadre
  
}


boolean clickFrame(Frame frame){ //permet de savoir si la souris est dans un certain cadre 
  
  if(mouseX > frame.Left && mouseX < frame.Right && mouseY > frame.Top && mouseY < frame.Bottom){ // si les coordonnées de la souris( ou tap du doigt) sont dans le cadre
    return true;
  } 
  else{
    return false;
  }
}


void imgFrame(PImage image, Frame frame){ //permet d'afficher une image dans un cadre mais est pas mit dans le code.
  int marge = 10;
  image(image, frame.Left + marge, frame.Top + marge, frame.Width - 2*marge, frame.Height - 2*marge);
  
}
  
  
  
  
