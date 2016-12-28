/* Teal Rain*/
Drop[] drops = new Drop[300];
void setup(){

   size(460,800);
   for(int i = 0; i < drops.length; i++){
   drops[i] = new Drop();
   }

}


void draw(){
 background(0);
 for(int i = 0; i < drops.length; i++){
   drops[i].fall();
   drops[i].show();
 }
  
  
}