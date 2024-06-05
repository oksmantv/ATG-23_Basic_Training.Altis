// [this] execVM "Image\LoopImage.sqf";

Params ["_Object"];

if(!isServer) exitWith { false };

while {alive _Object} do {

	_Object setObjectTextureGlobal [0,"image\breaching_2.jpg"];
	sleep 1.5;
	_Object setObjectTextureGlobal [0,"image\breaching_2_2.jpg"];
	sleep 1.5;
	_Object setObjectTextureGlobal [0,"image\breaching_2_3.jpg"];
	sleep 3;

};