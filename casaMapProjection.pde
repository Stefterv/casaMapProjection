// ---INSTRUCTIONS---
// Drop CasaMap.pde in your Sketch folder
// Download Unfolding Processing Library
// http://unfoldingmaps.org/


void setup(){
	size(1920, 1200,P2D);
	// add this to your sketch
	// REQUIRED!
	setupMap();
}

void draw(){
	background(0);
	// show the underlying map for development purposes.
	drawMap();

	// Convert screen position to latitude and longitude.
	PVector mouseMap = getLocation(mouseX,mouseY);
	// Convert latitude and longitude back to screen position.
	PVector mouseScreen = getScreenPosition(mouseMap.x,mouseMap.y);


	fill(255,0,0);
	noStroke();
	ellipse(mouseScreen.x,mouseScreen.y,25,25);
	text(mouseMap.toString(),mouseScreen.x-50,mouseScreen.y-25);
}
/*

---extra functions---
float getScreenPositionX(float lat, float lon)
	returns screen position X coordinate

float getScreenPositionY(float lat, float lon)
	returns screen position Y coordinate

float getLatitude(float x, float y){
	returns location latitude

float getLongitude(float x, float y){
	returns location longitude

*/