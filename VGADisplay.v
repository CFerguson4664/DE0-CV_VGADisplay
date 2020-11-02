module VGADisplay(CLOCK_50,VGA_HS,VGA_VS,VGA_R,VGA_G,VGA_B,SW,KEY);
input CLOCK_50;
input [3:0] KEY;
input [9:0] SW;
output[3:0] VGA_R,VGA_G,VGA_B;
output VGA_HS,VGA_VS;
wire[1:0] HState,VState,CState;
wire[9:0] CH,CV,CC;
wire YH,YV,YC,CLK,CCLK;

wire [2:0]HCState,VCState;
wire [3:0]Red,Green,Blue;
wire R,G,B;

JKFlipFlopAResetComp(1,1,CLOCK_50,CLK,0);

sync800Comp s0(CLK,CH);
HorizontalStateFSM s1(CH,CLK,YH,HState);
HorizontalColorStateFSM s2(CH,CLK,HCState);

sync525Comp s3(YH,CV);
VerticalStateFSM s4(CV,CLK,YV,VState);
VerticalColorStateFSM s5(CV,CLK,VCState);

//assign Red = {SW[2],SW[2],SW[2],SW[2]};
//assign Green = {SW[1],SW[1],SW[1],SW[1]};
//assign Blue = {SW[0],SW[0],SW[0],SW[0]};

ColorStorage(SW,KEY,HCState,VCState,R,G,B);

assign Red = {R,R,R,R};
assign Green = {G,G,G,G};
assign Blue = {B,B,B,B};

assign VGA_HS = YH;
assign VGA_VS = YV;

assign VGA_R = (HState==2 & VState==2) ? Red : 0;
assign VGA_G = (HState==2 & VState==2) ? Green : 0;
assign VGA_B = (HState==2 & VState==2) ? Blue : 0;

endmodule
