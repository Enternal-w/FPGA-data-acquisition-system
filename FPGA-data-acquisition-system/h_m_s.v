
/***************************************************
*	Module Name		:	 h_m_s		   
*	Target Device	:	EP4CE10F17C8
*	Tool versions	:	Quartus II 13.0
*	Create Date		:	2019-5-15
*	Revision		   :	v1.1
*	Description		:  //数字时钟 时分秒
**************************************************/

module h_m_s(
	clk_1hz,
	hour_1_out,
	hour_0_out,
	minute_1_out,
	minute_0_out,
	second_1_out,
	second_0_out,

);

input  clk_1hz;

output reg[3:0]hour_1_out;
output reg[3:0]hour_0_out;
output reg[3:0]minute_1_out;
output reg[3:0]minute_0_out;
output reg[3:0]second_1_out;
output reg[3:0]second_0_out;

reg [4:0]hour;
reg [5:0]minute;
reg [5:0]second;
wire [25:0]threshold;
wire clk1hz;

parameter hi = 16;
parameter mi = 32;


fenpin fenpin(
	.clk(clk_1hz),
	.clk2(clk1hz),
	.threshold(threshold)
);


initial hour = hi;
initial minute = mi;
initial second = 0;
assign threshold = 4_500_000;

always@(posedge clk1hz)begin
	if(second == 59)
		second <= 0;
	else
		second <= second + 1;
end
always@(posedge clk1hz)begin
	if( second == 59)begin
		if(minute == 59)
		minute <= 0;
		else
		minute <= minute + 1;
		end
	else
		minute <= minute;
end
always@(posedge clk1hz)begin
	if(minute == 59 && second == 59)begin
		if(hour == 23)
		hour = 0;
		else
		hour <= hour + 1;
	end
	else
		hour <= hour;
end



always@(clk1hz)begin
	hour_1_out <= hour/10;
	hour_0_out <= hour%10;
	minute_1_out <= minute/10;
	minute_0_out <= minute%10;
	second_1_out <= second/10;
	second_0_out <= second%10;
end

endmodule
