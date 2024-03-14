
/***************************************************
*	Module Name		:	xinlv		   
*	Engineer		   :	杨绪刚
*	Target Device	:	EP4CE10F17C8
*	Tool versions	:	Quartus II 13.0
*	Create Date		:	2019-5-28
*	Revision		   :	v1.2
*	Description		:  心率计算
**************************************************/

module xinlv(
	clk,//conve_done采样频率
	rest_n,
	wave_data,
	vnpd,
	ecgstate,
	xinlv0,
	xinlv1,
	xinlv2
);

	input	clk;//cove_done adc转换完成
	input rest_n;
	input [7:0]wave_data;
	reg [15:0]xinlv;
	reg [13:0]xinlvreg[9:0];
	output reg ecgstate;
	output reg[3:0]xinlv0;
	output reg[3:0]xinlv1;
	output reg[3:0]xinlv2;
	output reg vnpd;
	
	parameter vnn = 8'd180;	//波峰阈值
	parameter vnv = 8'd110; 	//波谷阈值
	parameter fs60s = 14'd15750;	//采样频率*60s 250*60 = 15,000 2^14=16,384
	
	reg vn;
	reg btn1;
	reg btn2;

	reg [9:0]count;
	
	always@(posedge clk)
	begin if(wave_data >= vnn)
		vn <= 1;
	else if(wave_data <= vnv)
		vn <= 0;
	else 
		vn <= vn;
	end
	
	always@(posedge clk)
	begin 
		btn1 <= vn;
		btn2 <= btn1;
		vnpd <= btn1 & ~btn2;//vn上升沿
	end
	
	always@(posedge clk)
	if(!rest_n)
	begin
		xinlv<=0;
		xinlvreg[0] <=	85;
		xinlvreg[1] <=	85;
		xinlvreg[2] <=	85;
		xinlvreg[3] <=	85;
		xinlvreg[4] <=	85;
		count <= 0;
		ecgstate <= 0;
	end
	
	else
	begin 
	if(count <= 600)
		begin
			if(vnpd == 1)begin
				xinlvreg[0] <= fs60s/count; 
				xinlvreg[1] <= xinlvreg[0];
				xinlvreg[2] <= xinlvreg[1];
				xinlvreg[3] <= xinlvreg[2];
				xinlvreg[4] <= xinlvreg[3];
				xinlv <= xinlvreg[0] + xinlvreg[1] + xinlvreg[2] + xinlvreg[3] + xinlvreg[4];
				count <= 0;
				if(250 < xinlv < 500)
					ecgstate <= 0;
				else
					ecgstate <= 1;
			end
			else
				begin
				count <= count + 1; //心率 = fs * 60s / count
				end
		end
		
	else
		begin
			xinlv <= 0;
			count <= 0;
			ecgstate <= 1;
		end
	end
	
	
	always@(clk)
	begin

		xinlv0 <= xinlv/5%10;
		xinlv1 <= xinlv/50%10;
		xinlv2 <= xinlv/500;
	end
endmodule	