//Base module that interfaces with all other modules and links them to the inputs and outputs of the DE0.
module VGADisplay(CLOCK_50,VGA_HS,VGA_VS,VGA_R,VGA_G,VGA_B,SW,KEY,GPIO_0In,GPIO_0Out,LEDR);
input CLOCK_50;
input [3:0] KEY;
input [9:0] SW;
input [3:0] GPIO_0In;

output [3:0] GPIO_0Out;
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

//Generate a 25Mhz clock
JKFlipFlopAResetComp(1,1,CLOCK_50,CLK,0);

//Count what horizontal column we are in
sync800Comp s0(CLK,CH);
//Generate horizontal sync signal
HorizontalStateFSM s1(CH,CLK,YH,HState);
//Control which color is being displayed
HorizontalColorStateFSM s2(CH,CLK,HCState);

//Count what vertical row we are in
sync525Comp s3(YH,CV);
//Generate vertical sync signal
VerticalStateFSM s4(CV,CLK,YV,VState);
//Control which color is being displayed
VerticalColorStateFSM s5(CV,CLK,VCState);

//Get input from the button matrix
ButtonMatrixFSM(GPIO_0In,GPIO_0Out,H,V,ButtonCLK,YV);

//Debug LEDS
assign LEDR[0] = ButtonCLK;
assign LEDR[1] = YV;
assign LEDR[5] = V[1];
assign LEDR[4] = V[0];
assign LEDR[3] = H[1];
assign LEDR[2] = H[0];

//Access the stored colors for the pixels
ColorStorage(SW,KEY,HCState,VCState,H,V,ButtonCLK,R,G,B);

//Set  the color components based on the stored data
assign Red = {R[1],R[0],R[1],R[0]};
assign Green = {G[1],G[0],G[1],G[0]};
assign Blue = {B[1],B[0],B[1],B[0]};

//Output the vertical and horizontal sync signals
assign VGA_HS = YH;
assign VGA_VS = YV;

//Output the color signals at the correct time
assign VGA_R = (HState==2 & VState==2) ? Red : 0;
assign VGA_G = (HState==2 & VState==2) ? Green : 0;
assign VGA_B = (HState==2 & VState==2) ? Blue : 0;

endmodule
