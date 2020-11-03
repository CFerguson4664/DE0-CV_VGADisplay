module VGADisplay(CLOCK_50,VGA_HS,VGA_VS,VGA_R,VGA_G,VGA_B,SW,KEY,GPIO_0In,GPIO_0Out,LEDR);
input CLOCK_50;
input [3:0] KEY;
input [9:0] SW;
output [3:0] GPIO_0Out;
input [3:0] GPIO_0In;
output[3:0] VGA_R,VGA_G,VGA_B;
output VGA_HS,VGA_VS;
output [9:0] LEDR;
wire[1:0] HState,VState,CState;
wire[9:0] CH,CV,CC;
wire YH,YV,YC,CLK,CCLK;

wire [2:0]HCState,VCState;
wire [3:0]Red,Green,Blue;
wire [1:0]R,G,B;

wire[1:0] H,V;
wire ButtonCLK;

JKFlipFlopAResetComp(1,1,CLOCK_50,CLK,0);

sync800Comp s0(CLK,CH);
HorizontalStateFSM s1(CH,CLK,YH,HState);
HorizontalColorStateFSM s2(CH,CLK,HCState);

sync525Comp s3(YH,CV);
VerticalStateFSM s4(CV,CLK,YV,VState);
VerticalColorStateFSM s5(CV,CLK,VCState);

ButtonMatrixFSM(GPIO_0In,GPIO_0Out,H,V,ButtonCLK,YV);

assign LEDR[0] = ButtonCLK;
assign LEDR[1] = YV;

assign LEDR[5] = V[1];
assign LEDR[4] = V[0];
assign LEDR[3] = H[1];
assign LEDR[2] = H[0];

//assign GPIO_0Out[0] = 0;
//assign GPIO_0Out[1] = 0;
//assign GPIO_0Out[2] = 1;
//assign GPIO_0Out[3] = 0;
//assign LEDR[3] = GPIO_0In[3];
//assign LEDR[2] = GPIO_0In[2];
//assign LEDR[1] = GPIO_0In[1];
//assign LEDR[0] = GPIO_0In[0];

ColorStorage(SW,KEY,HCState,VCState,H,V,ButtonCLK,R,G,B);
//ColorStorage(SW,KEY,HCS,VCS,H,V,ButtonCLK,R,G,B);

assign Red = {R[1],R[0],R[1],R[0]};
assign Green = {G[1],G[0],G[1],G[0]};
assign Blue = {B[1],B[0],B[1],B[0]};

assign VGA_HS = YH;
assign VGA_VS = YV;

assign VGA_R = (HState==2 & VState==2) ? Red : 0;
assign VGA_G = (HState==2 & VState==2) ? Green : 0;
assign VGA_B = (HState==2 & VState==2) ? Blue : 0;

endmodule
