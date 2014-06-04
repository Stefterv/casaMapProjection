import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;

UnfoldingMap map;
PVector offset = new PVector(-44,-36);
float scale = 0.97;

void setupMap(){
	map = new UnfoldingMap(this);
	map.rotate(radians(-32));
  Location arnhem = new Location(51.982, 5.907);
	map.zoomAndPanTo(arnhem, 17);
}
void setMatrix(){
	translate(offset.x,offset.y);
	translate(width/2,height/2);
	scale(scale);
	translate(-width/2,-height/2);
}
void drawMap(){
	pushMatrix();
	setMatrix();
	map.draw();
	popMatrix();
}
// get coordinates for a screen location
PVector getLocation(float x, float y){
	pushMatrix();
	translate(width/2,height/2);
	scale(1/scale);
	translate(-width/2,-height/2);
	translate(-offset.x,-offset.y);
	Location loc = map.getLocation(screenX(x,y),screenY(x,y));
	PVector result = new PVector(loc.getLat(),loc.getLon());

	popMatrix();
	return result;
}
PVector getScreenPosition(float lat,float lon){
	pushMatrix();
	Location loc = new Location(lat,lon);
	ScreenPosition pos = map.getScreenPosition(loc);
	setMatrix();
	PVector result = new PVector(screenX(pos.x,pos.y),screenY(pos.x,pos.y));
	popMatrix();
	return result;
}
float getScreenPositionX(float lat, float lon){
	return getScreenPosition(lat,lon).x;
}
float getScreenPositionY(float lat, float lon){
	return getScreenPosition(lat,lon).y;
}
float getLatitude(float x, float y){
	return getLocation(x,y).x;
}
float getLongitude(float x, float y){
	return getLocation(x,y).y;
}