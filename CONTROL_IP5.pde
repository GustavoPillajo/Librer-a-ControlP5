import processing.serial.*;
import controlP5.*;

ControlP5 cp5;
int R=150;
int G=150;
int B=150;

int i=0;
int end = 10; // fin de linea (usado en strings)
int val = 0; // 
Serial port; // objeto puerto serial
String serial; // variable tipo string
String portn = "COM5"; 

void setup() {
  size(400, 400);
  port = new Serial(this, portn, 9600);
  background(0);

  cp5 = new ControlP5(this);
  cp5.addSlider("Slider")
    .setPosition(50, 150)
    .setSize(50, 250)
    .setRange(0, 400)
    ;
    
    cp5.addSlider("Slider2")   //añadir el nuevo boton -- Nombre del boton
    .setPosition(200, 150)        //posicion del boton
    .setSize(50, 250)            //tamaño del boton
    .setRange(0, 400)        //rango de valores que adquiere
    .setNumberOfTickMarks(4)
    .setValue(0);              //valor inicial
    
  cp5.addButton("CONECTAR")
    .setValue(0)
    .setPosition(300, 50)
    .setSize(50, 50);

}

void draw() {
  background(0);
  while (port.available() > 0) {
    serial = port.readStringUntil(end);
  }
  if (serial != null) {
    int dato=Integer.parseInt(serial.trim());
    println(dato);

    cp5.getController("Slider").setValue(dato);
    cp5.getController("Slider2").setValue(dato);
  }
}
void Slider(float colores) {
if(colores>=100){
  println(colores);
  B=int(colores);
  cp5.getController("Slider")
  .setColorActive(color(036,231,017)) 
  //.setColorForeground(color(036,231,017))
  ;
  cp5.getController("Slider").setColorForeground(color(036,231,017));
}
    if(colores>200){
      println(colores);
  B=int(colores);
  cp5.getController("Slider").setColorActive(color(255,255,000)); 
  cp5.getController("Slider").setColorForeground(color(255,255,000));    
}
    if(colores>=300){
      println(colores);
      B=int(colores);
      cp5.getController("Slider").setColorActive(color(254,000,000)); 
  cp5.getController("Slider").setColorForeground(color(254,000,000));

  
  }
}

void Slider2(float colores) {
if(colores>=100){
  println(colores);
  B=int(colores);
  cp5.getController("Slider2")
  .setColorActive(color(036,231,017)) 
  //.setColorForeground(color(036,231,017))
  ;
  cp5.getController("Slider2").setColorForeground(color(036,231,017));
}
    if(colores>200){
      println(colores);
  B=int(colores);
  cp5.getController("Slider2").setColorActive(color(255,255,000)); 
  cp5.getController("Slider2").setColorForeground(color(255,255,000));    
}
    if(colores>=300){
      println(colores);
      B=int(colores);
      cp5.getController("Slider2").setColorActive(color(254,000,000)); 
  cp5.getController("Slider2").setColorForeground(color(254,000,000));

  
  }
}

void CONECTAR (int on) {
  i=1-i;
  if (i==0) {
    port = new Serial(this, portn, 9600);
  } else {
    port.stop();
  }
}
