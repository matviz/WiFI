 import processing.net.*; 


//11:FD:35:DB:32:98:01:9F:F2:A7:29:30:27:ED:5F:D4:07:43:7D:48
//clé de signature du apk

Client c; //création de l'objet client pour les connexions wifi

int PORT = 574; // port de communication
String cst_DirectIP = "192.168.4.1"; // IP de connexion direct

String screen, previousScreen; // screen est la configuration d'affichage actuel ; previousScreen est la configuration d'affichage précédente ; elle sont toutes deux caractérisé par une chaine de caractère
String data = "";

String LocalIP = "192.168.1.25";

int size;

int millis; // temps en ms
int ping; //temps du ping en ms

boolean pressed;




Frame ToggleBtn = new Frame(); //permet de définir un cadre pour faciliter l'affichage
Frame ExitBtn = new Frame(); // défini le cadre pour le bouton pour fermer l'app
Frame PingBtn = new Frame(); // défini le cadre du bouton pour envoyer un ping

Frame BackBtn = new Frame(); // défini le cadre du bouton pour revenir en arrière
Frame PlusBtn = new Frame(); // défini le cadre du bouton option dans le menu local connect

void setup() { //EQUIVALENT à la partie du main avant le while(1), n'est executé qu'un fois au lancement
  background(255, 0 ,0); // 
  size(displayWidth, displayHeight); // défini la taille de l'écran
  textAlign(CENTER,CENTER);// le texte est défini par rapport au centre cad le milieu de la phrase ou du mot sera toujours au meme endroit.
  //size(400,800); //taille de l'écran pour les test sur ordi.
  orientation(PORTRAIT); // se mettra sur le téléphone en mode portrait.
  
  screen = "Menu"; // on se trouve sur la configuration d'affichage "Menu"
  
  //define BTN

  
  //initialisation des cadres définitions de position, bordures, couleurs et remplissage
  
  ToggleBtn.defineLength(width/4,height/4,width/2,height/4); // on vient lancer la fonction defineLength de la class ToggleBtn pour définir les dimensions de la case toggleBtn (voir FRAME.pde)
  ToggleBtn.Border = color(0,0,255); // défini la couleur des bordures ( avec 3 entrée color fonctionne en R , G , B ) les bordures sont bleu
  ToggleBtn.Fill = color(0,0,255, 64); // défini la couleur a l'intérieur du bouton ( 4 entrée avec color() donc R, G , B ,alpha(qui défini la transparence avec 0 transparent et 100 opaque)) bleu un peut transparant)
  ToggleBtn.filling = false; // on ne rempli pas le bouton
  
  ExitBtn.defineLength(width/4,5*height/8,width/2,height/4);
  ExitBtn.Border = color(255,0,0);
  ExitBtn.Fill = color(255,0,0, 64);
  ExitBtn.filling = false;
  
  PingBtn.defineLength(3*width/8, 0, width/4, height/16);
  PingBtn.Border = color(0,255,0);
  PingBtn.Fill = color(0,255,0, 64);
  ExitBtn.filling = false;
  
  BackBtn.defineLength(5,5,width/15,width/15);
  BackBtn.Border = color(255);
  BackBtn.Fill = color(255, 64);
  BackBtn.filling = false;
  
  PlusBtn.defineLength(width-5-width/15,5,width/15,width/15);
  PlusBtn.Border = color(255);
  PlusBtn.Fill = color(255,64);
  PlusBtn.filling = false;
  
  
  //END define BTN
} 

void draw() { //equivalent au while(1) dans un main, est executé en boucle et l'affichage est mis à jour à chaque fin de boucle
//L'affichage fonctionne par couches donc un élement placé au même endroit qu'un autre mais plus loin dans le code sera affiché par dessus
  
  if( !screen.equals(previousScreen) ){//si il y a un changement d'écran alors il faut lancer la fonction d'initialisation de l'écran et mettre à jour la variable qui enregistre l'écran actuel
    
    previousScreen = screen; // on prends en compte que l'on a changer d'écran en mettant previousScreen égale à Screen  
    switch(screen){ //par rapport a la chaine de caractère dans screen
    
      case "Menu" :   MenuSetup(); // si la chaine de caractere est "menu" on rentre dans MenuSetup
      break;
      
      case "Local" :  LocalSetup();
      break;
      
      case "Direct" : DirectSetup();
      break;
      
      case "Plus" : PlusSetup();
      break;
      
      default : println("NETWORK.draw");exit();
      break;
    
    }
    
  }
  
  switch(screen){ //lance le code d'affichage et de fonction de l'écran actuel
    
    case "Menu" :   MenuScreen();
                    MenuLoop();
    break;
    
    case "Local" :  LocalScreen();
                    LocalLoop();
    break;
    
    case "Direct" : DirectScreen();
                    DirectLoop();
    break;
    
    case "Plus" :   PlusScreen();
                    PlusLoop();
    break;
    
    default : println("NETWORK.draw2");exit();
    break;
    
  }

  
}





void mousePressed(){ //cette fonction est appelée automatiquement dès que l'évenement de la souris cliqué (ou écran touché sur smartphone) est enclenché
  
  switch(screen){ //on lance alors la fonction correspondante à l'écran actuel
    
    case "Menu" : MenuPressed();
    break;
    
    case "Local" : LocalPressed();
    break;
    
    case "Direct" : DirectPressed();
    break;
    
    case "Plus" : PlusPressed();
    break;
    
    default : println("NETWORK.mousePressed");exit();
    break;
    
  }  
  
}

void mouseReleased(){ //cette fonction est appelée automatiquement dès que l'évenement de la souris relachée (ou écran relaché sur smartphone) est enclenché
  
  
  switch(screen){//on lance alors la fonction correspondante à l'écran actuel
    
    case "Menu" : MenuReleased();
    break;
    
    case "Local" : LocalReleased();
    break;
    
    case "Direct" : DirectReleased();
    break;
    
    case "Plus" : PlusReleased();
    break;
    
    default : println("NETWORK.mouseReleased");exit();
    break;
    
  }
  
}

void keyPressed(){ //cette fonction est appelée automatiquement dès que l'évenement de touche du clavier enfoncé (ou clavier virtuel sur smartphone) est enclenché
  
  switch(screen){
      
    case "Plus" : PlusKeyPressed();
    break;
    
    default : println("NETWORK.keyPressed");exit();
    break;
    
  }  
  
}
