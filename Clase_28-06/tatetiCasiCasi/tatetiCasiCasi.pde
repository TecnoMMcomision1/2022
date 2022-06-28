int cant = 3;
int tam;
int turno;
boolean [][] juga1 = new boolean [cant][cant];
boolean [][] juga2 = new boolean [cant][cant];
void setup() {
  size(600, 600);
  tam = width/cant;
  for (int i=0; i<cant; i++) {
    for (int j=0; j<cant; j++) {
      juga1[i][j] = false;
      juga2[i][j] = false;
    }
  }
}
void draw() {
  background(255);
  println(turno);
  for (int i=0; i<cant; i++) {
    for (int j=0; j<cant; j++) {
      strokeWeight(2); 
      stroke(100);
      fill(255);
      rect(i*tam, j*tam, tam, tam); // tablero
      if (juga1[i][j]) {
        cruz(i*tam, j*tam, tam, tam);
      }
      if (juga2[i][j]) {
        circulo(i*tam+tam/2, j*tam+tam/2, tam/2, tam/2);
      }
      if (juga1[0][0]&&juga1[1][0]&&juga1[2][0]) {
        /* completar el resto de las columnas, filas y diagonales*/
        textSize(40);
        fill(0, 0, 255);
        textAlign(CENTER);
        text("GANA JUGADOR 1", width/2, height/2);
      }
    }
  }
  // falta determinar condiciones para ganar jugador 2
}

void mousePressed() { // ESTO HAY QUE COMPLETARLO
  for (int i=0; i<cant; i++) {
    for (int j=0; j<cant; j++) {
      // el condicional debería cambiarse por una función 
      if (mouseX>i*tam && mouseX<i*tam+tam && mouseY>j*tam && mouseY<j*tam+tam 
        && juga1[i][j]==false && !juga2[i][j]) {
        if (turno%2==0) {
          juga1[i][j] = true;
        } else {
          juga2[i][j] = true;
        }
        turno++;
      }
    }
  }
}

// funciones para las fichas de cada jugador
void circulo(int px, int py, int ancho, int alto) {
  strokeWeight(5); 
  stroke(0);
  fill(255, 0, 0);
  ellipse(px, py, ancho, alto);
}
void cruz (int px, int py, int ancho, int alto) {
  strokeWeight(5); 
  stroke(0, 0, 255);
  line(px, py, px+ancho, py+alto);
  line(px, py+alto, px+ancho, py);
}
