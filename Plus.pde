//Plus screen code

String ssid = ""; //nom du ssid
String password = "";// mot de passe du ssid


boolean writingSSID = false;
boolean writingPassword = false;



Frame SSIDframe = new Frame(); //on fait un cadre SSID
Frame Passwordframe = new Frame();// on fait un cadre mot de passe

Frame SSIDtext = new Frame(); // on fait un cadre pour écrire le ssid
Frame Passwordtext = new Frame(); //on fait un cadre pour écrire le mot de passe

Frame SaveBtn = new Frame(); // on fait un cadre pour un bouton sauvegarde
Frame ConnectBtn = new Frame();// on fait un cadre pour connecter le télephone à l'esp

Frame LocalIPtext = new Frame(); //on fait un cadre pour mettre l'ip local

void PlusSetup(){
  background(34,34,34);
  
  ssid = loadString("ssid"); //on marque ssid dans ssid
  password = loadString("password");// on marque password dans password
  
  
  LocalIPtext.defineLength(width/4, height/32, width/2, height/16);//position du text LocalIP
  LocalIPtext.Border = color(255);//couleur du cadre : blanc
  LocalIPtext.Fill = color(255,64);//remplissage blanc transparent
  LocalIPtext.filling = false;// pas rempli pas défaut
  
  SSIDtext.defineLength(width/8, height/8, 3*width/4, height/8);//position du text ssid
  SSIDtext.Border = color(255);//couleur du cadre : blanc
  SSIDtext.Fill = color(255,64);//remplissage blanc transparent
  SSIDtext.filling = false;
  
  SSIDframe.defineLength(width/8, height/4, 3*width/4, height/8);
  SSIDframe.Border = color(255);//couleur du cadre : blanc
  SSIDframe.Fill = color(255,64);//remplissage blanc transparent
  SSIDframe.filling = false;
  
  Passwordtext.defineLength(width/8, 3*height/8, 3*width/4, height/8);
  Passwordtext.Border = color(255);//couleur du cadre : blanc
  Passwordtext.Fill = color(255,64);//remplissage blanc transparent
  Passwordtext.filling = false;
  
  Passwordframe.defineLength(width/8, height/2, 3*width/4, height/8);
  Passwordframe.Border = color(255);//couleur du cadre : blanc
  Passwordframe.Fill = color(255,64);//remplissage blanc transparent
  Passwordframe.filling = false;

  SaveBtn.defineLength(width/8, 3*height/4, 3*width/4, height/8);
  SaveBtn.Border = color(0, 0, 255);//couleur du cadre : bleu
  SaveBtn.Fill = color(0, 0, 255, 64);//remplissage bleu transparent
  SaveBtn.filling = false;
  
  ConnectBtn.defineLength(width/4, 29*height/32, width/2, height/16);
  ConnectBtn.Border = color(0, 255, 0);//couleur du cadre : vert
  ConnectBtn.Fill = color(0, 255, 0, 64);//remplissage vert transparent
  ConnectBtn.filling = false;
  
  }


void PlusScreen(){
  background(34);
  
  BackBtn.display();//fait apparaitre le cadre BackBtn
  
  fill(255);// défini la couleur du texte blanc
  textFrame("<", BackBtn);// écrit < dans le cadre BackBtn
  
  SSIDframe.display();
  Passwordframe.display();
  SaveBtn.display();
  ConnectBtn.display();
  
  
  fill(255);
  textFrame("Save", SaveBtn);// écrit dans le cadre
  textFrame("Connect", ConnectBtn);// écrit dans le cadre
  
  
  textFrame(ssid, SSIDframe);// écrit dans le cadre
  textFrame(password, Passwordframe);// écrit dans le cadre
  
  textFrame(LocalIP, LocalIPtext);// écrit dans le cadre
  textFrame("SSID", SSIDtext);// écrit dans le cadre
  textFrame("Password", Passwordtext);// écrit dans le cadre
  
}

void PlusLoop(){
  
  //if (c.available() > 0) {    // If there's incoming data from the client...
  //  data = c.readString();  // data prend la valeur de ce que l'on reçois
  //  println("-" + data + "-"); //on écrit la donné dans la console processing
  //  LocalIP=data; //l'esp nous envoie son adresse IP
  //}
  
  
}



void PlusPressed(){
  
    println(height);
    
  if(clickFrame(BackBtn)){// si on appuie sur BackBtn
    writingSSID = false;//on ne peut plus écrire dans le SSID
    writingPassword = false;//on ne peut plus écrire dans le Password
    
    BackBtn.filling = true;//le cadre se remplit
    
   
      closeKeyboard();// on ferme le clavier numérique
    
  }
  else if(clickFrame(SSIDframe)){//si on appuie sur le cadre SSID
    writingSSID = true;// on peut écrire dans le SSID
    writingPassword = false;//on ne peut pas écrire dans Password
    

    
      openKeyboard();//on ouvre le clavier numérique
    
  }
  else if(clickFrame(Passwordframe)){// si on appuie sur le cadre Password
    writingSSID = false;// on ne peut pas écrire dans le cadre SSID
    writingPassword = true;// on peut écrire dans le cadre password

   
      openKeyboard(); // on ouvre le clavier
    
  }
  else if(clickFrame(SaveBtn)){// si on appuie sur SaveBtn
    writingSSID = false;// on peut plus écrire
    writingPassword = false;
    
    SaveBtn.filling = true;//on remplit le cadre
    
    
      closeKeyboard();//on ferme le clavier numérique
    
  }
  else if(clickFrame(ConnectBtn)){//si on appuie sur ConnectBtn
    writingSSID = false; // on peut plus écrire
    writingPassword = false;
    
    ConnectBtn.filling = true;//on remplit le cadre
    
    
      closeKeyboard();// on ferme le clavier numérique
    
  }
  else{// si on appuis sur aucun cadre

    writingSSID = false; // on peut pas écrire
    writingPassword = false;
    
      closeKeyboard();//on ferme le clavier numérique
    
  }
  
  
  SSIDframe.filling = writingSSID;// on remplit le cadre SSID avec la valeur de writingSSID
  Passwordframe.filling = writingPassword;
}
    
    


void PlusReleased(){
  
  
  
  if(clickFrame(BackBtn) && BackBtn.filling){// si on arrete d'appuyer sur le backbtn et qu'on a appuyer avant
    BackBtn.filling = false; // on enlève le remplissage
    screen = "Direct"; //on retourne sur l'écran connexion direct
  }
  
  if(clickFrame(SaveBtn) && SaveBtn.filling){//si on relache le clic sur le saveBtn et qu'on à appuyer dessus avant
    SaveBtn.filling = false;// on enlève le remplissage
    saveVar(ssid, "ssid");// on sauvegarde la valeur du ssid
    saveVar(password, "password");// on sauvegarde la valeur du mot de passe
  }
  
  if(clickFrame(ConnectBtn) && ConnectBtn.filling){// si on arrête d'appuyer sur ConnectBtn et qu'on a appuyer avant
    ConnectBtn.filling = false;// on enlève le remplissage
    c.write("ssid="+ssid+"passwd="+password+"\r\n"); //send to esp
  }
 
  
}



void PlusKeyPressed(){
  
 
  if(keyCode != 59 && keyCode != 66){ //MAJ & ENTER (si on appuie sur autre chose que maj ou enter pour pouvoir mettre des majuscules ou envoyer)
    if(writingSSID){// si on écrit dans le SSID
      if(keyCode == 67){ //backspace
        if(ssid.length() > 0){ // si le nombre de lettre dans le ssid est supérieur a 0
          ssid = ssid.substring(0, ssid.length()-1); // on supprime la lettre précédente
        }
      }
      else{  // sinon on écrit la lettre
        ssid += key; //ssid = ssid + key
      }
      
    }
    if(writingPassword){//si on écrit dans mot de passe
      if(keyCode == 67){ //backspace
        if(password.length() > 0){// si le nombre de lettre dans le ssid est supérieur a 0
          password = password.substring(0, password.length()-1);// on supprime la lettre précédente
        }
      }
      else{
        password += key;//ssid = ssid + key
      }
      
    }
  }
  
  
  
  
  
}
