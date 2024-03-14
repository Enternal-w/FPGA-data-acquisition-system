module fenpin(
	clk,
	clk2,
	threshold
);

input	clk;
input	 [25:0]threshold;
output	reg clk2;

reg [25:0]count; //67,108,864

always@(posedge clk)begin
	if(count == threshold)
		count <= 0;
	else
		count <= count + 1;
end

always@(posedge clk)begin
	if(count == threshold)
		clk2 <= ~clk2;
	else 
		clk2 <= clk2;
end

endmodule
