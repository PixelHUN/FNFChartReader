prevNote = undefined;
isSusNote = false;
noteData = 0;
strumTime = 4000;
mustPress = true;
canBeHit = false;
wasGoodHit = false;
tooLate = false;
susActive = false;
hpMiss = 0.2;

s_width = 158*oChartReader.notescale;
s_height = 158*oChartReader.notescale;
alpha = 1;
sprite = arrow_static;
yOffset = 0;

onScreen = false;
_dish = display_get_gui_height();

event_user(0);