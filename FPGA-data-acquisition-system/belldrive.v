
/***************************************************
*	Module Name		:	belldrive		   
*	Engineer		   :	杨绪刚
*	Target Device	:	EP4CE10F17C8
*	Tool versions	:	Quartus II 13.0
*	Create Date		:	2019-4-31
*	Revision		   :	v1.0
*	Description		:  //蜂鸣器-触发
**************************************************/
module belldrive(clk, req_r, trigger, bell);
input clk;
input req_r;
input trigger;
output reg bell;

reg [6:0] count;

always@(posedge clk)
begin
	if(req_r)
		bell <= bell;
	else
		begin
			if(trigger == 1) begin
				count <= 70;//鸣响时间
			end
			else begin
				if(count > 0)begin
					count <= count -1;
					bell <= ~bell;
				end
			end
		end
end

endmodule