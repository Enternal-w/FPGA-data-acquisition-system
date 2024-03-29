
/***************************************************
*	Module Name		:	wave		   
*	Engineer		   :	杨绪刚
*	Target Device	:	EP4CE10F17C8
*	Tool versions	:	Quartus II 13.0
*	Create Date		:	2019-3-31
*	Revision		   :	v1.0
*	Description		:  波形寄存
**************************************************/

module wave(
	Clk,
	Rst_n,
	hcount,
	vcount,
	wave_data,
	wavepoint
 );
	input Clk;
	input Rst_n;
	input [9:0]vcount; //场计数
	input [9:0]hcount; //行计数
	input [7:0]wave_data; //数据传入
	output reg wavepoint; //是否存在显示传出
	
	reg [7:0]wave[0:398];//波形寄存器
	reg [7:0]wavehleft;
	reg [7:0]wavehright;
	reg [7:0]waveh;
	reg [9:0]midleft;
	reg [9:0]midright;

	
	reg [8:0]count;
	reg [9:0]sum;
	reg [9:0]div;
	reg [25:0]delay;

	
	always@(posedge Clk)begin 
	if(hcount <= 398 && vcount <= 255)begin
		if(delay >= 50000)//150000
			delay = 0;
		else
			delay = delay + 1;	//控制波形平移速度
	end end
	
	always@(posedge Clk)begin 
	if(hcount <= 398 && vcount <= 255)begin
		if(delay == 50000 )begin//150000
			if(count >= 398)
				count = 0;
			else
				count = count + 1;
		end else
			count = count;	
	end end
	
	always@(posedge Clk)begin
		wave[count] <=  wave_data;//波形上下翻转255 -
	end

	always@(posedge Clk)
	begin 
		if(hcount <= 398 && vcount <= 255)begin
			sum = hcount+count;
			if(sum > 398)
				div = sum - 398;
			else	div = sum;	
		end else
			div = sum;
	end
	
	always@(posedge Clk)
	begin 
		if(div !=0 || div!=398)begin
		wavehleft = wave[div-1];
		wavehright = wave[div+1];
		end
		waveh = wave[div];
		midleft  = (waveh + wavehleft)/2;
		midright = (waveh + wavehright)/2;
		
	end
	
		always@(*)
	begin 	
		if((midleft >= vcount && vcount >= midright)//连续波形
			||(midleft <= vcount && vcount <= midright)
			||(midleft <= vcount && vcount >= midright && vcount <= waveh)
			||(midleft >= vcount && vcount >= midright && vcount >= waveh))
			wavepoint = 0;		
		else
			wavepoint = 1;
	end

endmodule