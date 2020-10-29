module VGADisplay(CLOCK_50,VGA_HS,VGA_VS,VGA_R,VGA_G,VGA_B);
input CLOCK_50;
output[3:0] VGA_R,VGA_G,VGA_B;
output VGA_HS,VGA_VS;
wire[1:0] HState,VState,CState;
wire[9:0] CH,CV,CC;
wire YH,YV,YC,CLK,CCLK;
wire [3:0]Red,Green,Blue;

JKFlipFlopAResetComp(1,1,CLOCK_50,CLK,0);

sync800Comp s0(CLK,CH);
HorizontalStateFSM s1(CH,CLK,YH,HState);

sync525Comp s2(YH,CV);
VerticalStateFSM s3(CV,CLK,YV,VState);

sync420Comp s4(YV,CC);
ColorFSM s5(CC,CLK,Red,Green,Blue);


assign VGA_HS = YH;
assign VGA_VS = YV;

assign VGA_R = (HState==2 & VState==2) ? Red : 0;
assign VGA_G = (HState==2 & VState==2) ? Green : 0;
assign VGA_B = (HState==2 & VState==2) ? Blue : 0;

endmodule
