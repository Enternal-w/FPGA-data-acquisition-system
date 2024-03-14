/***************************************************
*	Module Name		:	ziti		   
*	Engineer		   :	杨绪刚
*	Target Device	:	EP4CE10F17C8
*	Tool versions	:	Quartus II 13.0
*	Create Date		:	2019-5-25
*	Revision		   :	v1.11
*	Description		:  字体调用库
**************************************************/

module ziti(
	clk,
	zicode,
	zix,
	ziy,
	zipoint
);
input	clk;
input [6:0]zicode;
input wire[3:0]zix;
input wire[3:0]ziy;
output reg	zipoint;

reg [15:0]zi_y;

reg[7:0] ling[0:15];//
reg[7:0] yi[0:15];//
reg[7:0] er[0:15];//
reg[7:0] san[0:15];//
reg[7:0] si[0:15];//
reg[7:0] wu[0:15];//
reg[7:0] liu[0:15];//
reg[7:0] qi[0:15];//
reg[7:0] ba[0:15];//
reg[7:0] jiu[0:15];//
reg[7:0] maohao[0:15];// :
reg[7:0] dian[0:15];// .
reg[7:0] kongge[0:15]; //_
reg[15:0]yiwu[0:15];
reg[15:0]lingwu[0:15];
reg[15:0]erliu[0:15];
reg[15:0]linger[0:15];
reg[15:0]wujiu[0:15];

reg[7:0] AA[0:15];
reg[7:0] CC[0:15];
reg[7:0] DD[0:15];
reg[7:0] SS[0:15];
reg[15:0]AD[0:15];
reg[15:0]SD[0:15];
reg[15:0]C_[0:15];

reg[15:0] xin[0:15];//信
reg[15:0] hao[0:15];//号
reg[15:0] xinn[0:15];//心
reg[15:0] lv[0:15];//率
reg[15:0] shun[0:15];//瞬
reg[15:0] shi[0:15];//时
reg[15:0] jian[0:15];//间
reg[15:0] zhuang[0:15];//状
reg[15:0] tai[0:15];//态
reg[15:0] zheng[0:15];//正
reg[15:0] yii[0:15];//异
reg[15:0] chang[0:15];//常
reg[15:0] elc_dian[0:15];//电
reg[15:0] srce_yuan[0:15];//源
reg[15:0] card_ka[0:15];//卡
reg[15:0] read_du[0:15];//读
reg[15:0] write_xie[0:15];//写
reg[15:0] idle_kong[0:15];//空
reg[15:0] idle_xian[0:15];//闲

reg[0:15]lut0 [0:15];//图标
reg[0:15]lut1 [0:15];
reg[0:15]lut2 [0:15];
reg[0:15]lut3 [0:15];
reg[0:15]lut4 [0:15];
reg[0:15]lut5 [0:15];
reg[0:15]lut6 [0:15];
reg[0:15]lut7 [0:15];
reg[0:15]lut8 [0:15];
reg[0:15]lut9 [0:15];
reg[0:15]lut10[0:15];
reg[0:15]lut11[0:15];
reg[0:15]lut12[0:15];
reg[0:15]lut13[0:15];
reg[0:15]lut14[0:15];
reg[0:15]lut15[0:15];



initial
begin
	//0
	ling[0] =8'h00;
	ling[1] =8'h00;
	ling[2] =8'h00;
	ling[3] =8'h3C;
	ling[4] =8'h42;
	ling[5] =8'h42;
	ling[6] =8'h42;
	ling[7] =8'h42;
	ling[8] =8'h42;
	ling[9] =8'h42;
	ling[10]=8'h42;
	ling[11]=8'h42;
	ling[12]=8'h3C;
	ling[13]=8'h00;
	ling[14]=8'h00;
	ling[15]=8'h00;
	//1
	yi[0] =8'h00;
	yi[1] =8'h00;
	yi[2] =8'h00;
	yi[3] =8'h18;
	yi[4] =8'h14;
	yi[5] =8'h10;
	yi[6] =8'h10;
	yi[7] =8'h10;
	yi[8] =8'h10;
	yi[9] =8'h10;
	yi[10]=8'h10;
	yi[11]=8'h10;
	yi[12]=8'h7C;
	yi[13]=8'h00;
	yi[14]=8'h00;
	yi[15]=8'h00;
	//2
	er[0]=8'h00;
	er[1]=8'h00;
	er[2]=8'h00;
	er[3]=8'h38;
	er[4]=8'h44;
	er[5]=8'h42;
	er[6]=8'h42;
	er[7]=8'h40;
	er[8]=8'h20;
	er[9]=8'h10;
	er[10]=8'h08;
	er[11]=8'h04;
	er[12]=8'h7E;
	er[13]=8'h00;
	er[14]=8'h00;
	er[15]=8'h00;
	//3
	san[0]=8'h00;
	san[1]=8'h00;
	san[2]=8'h00;
	san[3]=8'h3C;
	san[4]=8'h42;
	san[5]=8'h42;
	san[6]=8'h40;
	san[7]=8'h38;
	san[8]=8'h20;
	san[9]=8'h40;
	san[10]=8'h40;
	san[11]=8'h42;
	san[12]=8'h3C;
	san[13]=8'h00;
	san[14]=8'h00;
	san[15]=8'h00;
	//4
	si[0]=8'h00;
	si[1]=8'h00;
	si[2]=8'h00;
	si[3]=8'h20;
	si[4]=8'h10;
	si[5]=8'h08;
	si[6]=8'h24;
	si[7]=8'h22;
	si[8]=8'h22;
	si[9]=8'h7E;
	si[10]=8'h20;
	si[11]=8'h20;
	si[12]=8'h78;
	si[13]=8'h00;
	si[14]=8'h00;
	si[15]=8'h00;
	//5
	wu[0] =8'h00;
	wu[1] =8'h00;
	wu[2] =8'h00;
	wu[3] =8'h7C;
	wu[4] =8'h04;
	wu[5] =8'h04;
	wu[6] =8'h3C;
	wu[7] =8'h44;
	wu[8] =8'h40;
	wu[9] =8'h40;
	wu[10]=8'h42;
	wu[11]=8'h42;
	wu[12]=8'h3C;
	wu[13]=8'h00;
	wu[14]=8'h00;
	wu[15]=8'h00;
	//6
	liu[0] =8'h00;
	liu[1] =8'h00;
	liu[2] =8'h00;
	liu[3] =8'h3C;
	liu[4] =8'h42;
	liu[5] =8'h02;
	liu[6] =8'h02;
	liu[7] =8'h3E;
	liu[8] =8'h42;
	liu[9] =8'h42;
	liu[10]=8'h42;
	liu[11]=8'h42;
	liu[12]=8'h3C;
	liu[13]=8'h00;
	liu[14]=8'h00;
	liu[15]=8'h00;
	//7
	qi[0]=8'h00;
	qi[1]=8'h00;
	qi[2]=8'h00;
	qi[3]=8'h7E;
	qi[4]=8'h42;
	qi[5]=8'h20;
	qi[6]=8'h20;
	qi[7]=8'h20;
	qi[8]=8'h10;
	qi[9]=8'h10;
	qi[10]=8'h10;
	qi[11]=8'h08;
	qi[12]=8'h08;
	qi[13]=8'h00;
	qi[14]=8'h00;
	qi[15]=8'h00;
	//8
	ba[0]=8'h00;
	ba[1]=8'h00;
	ba[2]=8'h00;
	ba[3]=8'h3C;
	ba[4]=8'h42;
	ba[5]=8'h42;
	ba[6]=8'h42;
	ba[7]=8'h3C;
	ba[8]=8'h42;
	ba[9]=8'h42;
	ba[10]=8'h42;
	ba[11]=8'h42;
	ba[12]=8'h3C;
	ba[13]=8'h00;
	ba[14]=8'h00;
	ba[15]=8'h00;
	//9
	jiu[0]= 8'h00;
	jiu[1]= 8'h00;
	jiu[2]= 8'h00;
	jiu[3]= 8'h3C;
	jiu[4]= 8'h42;
	jiu[5]= 8'h42;
	jiu[6]= 8'h42;
	jiu[7]= 8'h7C;
	jiu[8]= 8'h40;
	jiu[9]= 8'h40;
	jiu[10]=8'h40;
	jiu[11]=8'h20;
	jiu[12]=8'h1C;
	jiu[13]=8'h00;
	jiu[14]=8'h00;
	jiu[15]=8'h00;
	
	//15
	yiwu[0] =16'h0000;
	yiwu[1] =16'h0000;
	yiwu[2] =16'h0000;
	yiwu[3] =16'h7C18;
	yiwu[4] =16'h0414;
	yiwu[5] =16'h0410;
	yiwu[6] =16'h3C10;
	yiwu[7] =16'h4410;
	yiwu[8] =16'h4010;
	yiwu[9] =16'h4010;
	yiwu[10]=16'h4210;
	yiwu[11]=16'h4210;
	yiwu[12]=16'h3C7C;
	yiwu[13]=16'h0000;
	yiwu[14]=16'h0000;
	yiwu[15]=16'h0000;
	//05
	lingwu[0] =16'h0000;
	lingwu[1] =16'h0000;
	lingwu[2] =16'h0000;
	lingwu[3] =16'h7C3C;
	lingwu[4] =16'h0442;
	lingwu[5] =16'h0442;
	lingwu[6] =16'h3C42;
	lingwu[7] =16'h4442;
	lingwu[8] =16'h4042;
	lingwu[9] =16'h4042;
	lingwu[10]=16'h4242;
	lingwu[11]=16'h4242;
	lingwu[12]=16'h3C3C;
	lingwu[13]=16'h0000;
	lingwu[14]=16'h0000;
	lingwu[15]=16'h0000;
	//26
	erliu[0] =16'h0000;
	erliu[1] =16'h0000;
	erliu[2] =16'h0000;
	erliu[3] =16'h3C38;
	erliu[4] =16'h4244;
	erliu[5] =16'h0242;
	erliu[6] =16'h0242;
	erliu[7] =16'h3E40;
	erliu[8] =16'h4220;
	erliu[9] =16'h4210;
	erliu[10]=16'h4208;
	erliu[11]=16'h4204;
	erliu[12]=16'h3C7E;
	erliu[13]=16'h0000;
	erliu[14]=16'h0000;
	erliu[15]=16'h0000;
	//02
	linger[0] =16'h0000;
	linger[1] =16'h0000;
	linger[2] =16'h0000;
	linger[3] =16'h383C;
	linger[4] =16'h4442;
	linger[5] =16'h4242;
	linger[6] =16'h4242;
	linger[7] =16'h4042;
	linger[8] =16'h2042;
	linger[9] =16'h1042;
	linger[10]=16'h0842;
	linger[11]=16'h0442;
	linger[12]=16'h7E3C;
	linger[13]=16'h0000;
	linger[14]=16'h0000;
	linger[15]=16'h0000;
	//59
	wujiu[0] =16'h0000;
	wujiu[1] =16'h0000;
	wujiu[2] =16'h0000;
	wujiu[3] =16'h3C7C;
	wujiu[4] =16'h4204;
	wujiu[5] =16'h4204;
	wujiu[6] =16'h423C;
	wujiu[7] =16'h7C44;
	wujiu[8] =16'h4040;
	wujiu[9] =16'h4040;
	wujiu[10]=16'h4042;
	wujiu[11]=16'h2042;
	wujiu[12]=16'h1C3C;
	wujiu[13]=16'h0000;
	wujiu[14]=16'h0000;
	wujiu[15]=16'h0000;
	//AA
	AA[0]= 8'h00;
	AA[1]= 8'h00;
	AA[2]= 8'h00;
	AA[3]= 8'h00;
	AA[4]= 8'h10;
	AA[5]= 8'h10;
	AA[6]= 8'h28;
	AA[7]= 8'h28;
	AA[8]= 8'h28;
	AA[9]= 8'h38;
	AA[10]=8'h44;
	AA[11]=8'h44;
	AA[12]=8'hee;
	AA[13]=8'h00;
	AA[14]=8'h00;
	AA[15]=8'h00;
	//CC
	CC[0]= 8'h00;
	CC[1]= 8'h00;
	CC[2]= 8'h00;
	CC[3]= 8'h00;
	CC[4]= 8'h3c;
	CC[5]= 8'h22;
	CC[6]= 8'h21;
	CC[7]= 8'h01;
	CC[8]= 8'h01;
	CC[9]= 8'h01;
	CC[10]=8'h01;
	CC[11]=8'h22;
	CC[12]=8'h1c;
	CC[13]=8'h00;
	CC[14]=8'h00;
	CC[15]=8'h00;
	//DD
	DD[0]= 8'h00;
	DD[1]= 8'h00;
	DD[2]= 8'h00;
	DD[3]= 8'h00;
	DD[4]= 8'h0f;
	DD[5]= 8'h12;
	DD[6]= 8'h22;
	DD[7]= 8'h22;
	DD[8]= 8'h22;
	DD[9]= 8'h22;
	DD[10]=8'h22;
	DD[11]=8'h12;
	DD[12]=8'h0f;
	DD[13]=8'h00;
	DD[14]=8'h00;
	DD[15]=8'h00;
	//SS
	SS[0]= 8'h00;
	SS[1]= 8'h00;
	SS[2]= 8'h00;
	SS[3]= 8'h00;
	SS[4]= 8'h78;
	SS[5]= 8'h44;
	SS[6]= 8'h04;
	SS[7]= 8'h08;
	SS[8]= 8'h30;
	SS[9]= 8'h40;
	SS[10]=8'h40;
	SS[11]=8'h44;
	SS[12]=8'h3C;
	SS[13]=8'h00;
	SS[14]=8'h00;
	SS[15]=8'h00;
	//AD
	AD[0]= 16'h0000;
	AD[1]= 16'h0000;
	AD[2]= 16'h0000;
	AD[3]= 16'h0000;
	AD[4]= 16'h0f10;
	AD[5]= 16'h1210;
	AD[6]= 16'h2228;
	AD[7]= 16'h2228;
	AD[8]= 16'h2228;
	AD[9]= 16'h2238;
	AD[10]=16'h2244;
	AD[11]=16'h1244;
	AD[12]=16'h0fee;
	AD[13]=16'h0000;
	AD[14]=16'h0000;
	AD[15]=16'h0000;
	//SD
	SD[0]= 16'h0000;
	SD[1]= 16'h0000;
	SD[2]= 16'h0000;
	SD[3]= 16'h0000;
	SD[4]= 16'h0f78;
	SD[5]= 16'h1244;
	SD[6]= 16'h2204;
	SD[7]= 16'h2208;
	SD[8]= 16'h2230;
	SD[9]= 16'h2240;
	SD[10]=16'h2240;
	SD[11]=16'h1244;
	SD[12]=16'h0f3C;
	SD[13]=16'h0000;
	SD[14]=16'h0000;
	SD[15]=16'h0000;
	//C_
	C_[0]= 16'h0000;
	C_[1]= 16'h0000;
	C_[2]= 16'h0000;
	C_[3]= 16'h0000;
	C_[4]= 16'h003c;
	C_[5]= 16'h0022;
	C_[6]= 16'h0021;
	C_[7]= 16'h0001;
	C_[8]= 16'h0001;
	C_[9]= 16'h0001;
	C_[10]=16'h0001;
	C_[11]=16'h0022;
	C_[12]=16'h001c;
	C_[13]=16'h0000;
	C_[14]=16'h0000;
	C_[15]=16'h0000;
	
	//信
	xin[0]=16'h0000;
	xin[1]=16'h0210;
	xin[2]=16'h0218;
	xin[3]=16'h7FEC;
	xin[4]=16'h000E;
	xin[5]=16'h3FCA;
	xin[6]=16'h0008;
	xin[7]=16'h3FC8;
	xin[8]=16'h0008;
	xin[9]=16'h3FC8;
	xin[10]=16'h2048;
	xin[11]=16'h2048;
	xin[12]=16'h3FC8;
	xin[13]=16'h2048;
	xin[14]=16'h0008;
	xin[15]=16'h0000;
	//号
	hao[0]=16'h0000;
	hao[1]=16'h1FF8;
	hao[2]=16'h1008;
	hao[3]=16'h1008;
	hao[4]=16'h1008;
	hao[5]=16'h1FF8;
	hao[6]=16'h0000;
	hao[7]=16'h7FFE;
	hao[8]=16'h0010;
	hao[9]=16'h0010;
	hao[10]=16'h0FF0;
	hao[11]=16'h0800;
	hao[12]=16'h0800;
	hao[13]=16'h0F80;
	hao[14]=16'h0000;
	hao[15]=16'h0000;
	//心
	xinn[0]=16'h0000;
	xinn[1]=16'h0080;
	xinn[2]=16'h0100;
	xinn[3]=16'h0200;
	xinn[4]=16'h0400;
	xinn[5]=16'h0400;
	xinn[6]=16'h0040;
	xinn[7]=16'h2040;
	xinn[8]=16'h4048;
	xinn[9]=16'h4048;
	xinn[10]=16'h8048;
	xinn[11]=16'h8044;
	xinn[12]=16'h9044;
	xinn[13]=16'h1042;
	xinn[14]=16'h1F80;
	xinn[15]=16'h0000;
	//率
	lv[0]=16'h0080;
	lv[1]=16'h0100;
	lv[2]=16'h7FFC;
	lv[3]=16'h0080;
	lv[4]=16'h4444;
	lv[5]=16'h23E8;
	lv[6]=16'h1110;
	lv[7]=16'h2488;
	lv[8]=16'h4FE4;
	lv[9]=16'h0800;
	lv[10]=16'h0100;
	lv[11]=16'hFFFE;
	lv[12]=16'h0100;
	lv[13]=16'h0100;
	lv[14]=16'h0100;
	lv[15]=16'h0100;
	//瞬
	shun[0]=16'h7800;
	shun[1]=16'h07c0;
	shun[2]=16'h441E;
	shun[3]=16'h4892;
	shun[4]=16'h2112;
	shun[5]=16'hFFDE;
	shun[6]=16'h8052;
	shun[7]=16'h3FC8;
	shun[8]=16'h209E;
	shun[9]=16'hFB92;
	shun[10]=16'h2252;
	shun[11]=16'h2AB2;
	shun[12]=16'hF912;
	shun[13]=16'h209E;
	shun[14]=16'h2052;
	shun[15]=16'h2020;
	//时
	shi[0]=16'h2000;
	shi[1]=16'h2000;
	shi[2]=16'h207C;
	shi[3]=16'h2044;
	shi[4]=16'hFF44;
	shi[5]=16'h2044;
	shi[6]=16'h2044;
	shi[7]=16'h227C;
	shi[8]=16'h2444;
	shi[9]=16'h2444;
	shi[10]=16'h2044;
	shi[11]=16'h2044;
	shi[12]=16'h207C;
	shi[13]=16'h2044;
	shi[14]=16'h2800;
	shi[15]=16'h1000;
	//间
	jian[0]=16'h0000;
	jian[1]=16'h0008;
	jian[2]=16'h3FD0;
	jian[3]=16'h2014;
	jian[4]=16'h2004;
	jian[5]=16'h27E4;
	jian[6]=16'h2424;
	jian[7]=16'h2424;
	jian[8]=16'h27E4;
	jian[9]=16'h2424;
	jian[10]=16'h2424;
	jian[11]=16'h27E4;
	jian[12]=16'h2004;
	jian[13]=16'h2004;
	jian[14]=16'h3804;
	jian[15]=16'h0000;
	//状
	zhuang[0]=16'h0000;
	zhuang[1]=16'h0620;
	zhuang[2]=16'h1620;
	zhuang[3]=16'h2424;
	zhuang[4]=16'h0428;
	zhuang[5]=16'h7FA8;
	zhuang[6]=16'h0420;
	zhuang[7]=16'h0420;
	zhuang[8]=16'h0A30;
	zhuang[9]=16'h0A28;
	zhuang[10]=16'h0A24;
	zhuang[11]=16'h1120;
	zhuang[12]=16'h1120;
	zhuang[13]=16'h20A0;
	zhuang[14]=16'h4060;
	zhuang[15]=16'h0000;
	//态
	tai[0]=16'h0000;
	tai[1]=16'h0100;
	tai[2]=16'h0100;
	tai[3]=16'h7FFC;
	tai[4]=16'h0100;
	tai[5]=16'h0280;
	tai[6]=16'h0440;
	tai[7]=16'h18B0;
	tai[8]=16'h610C;
	tai[9]=16'h0000;
	tai[10]=16'h0100;
	tai[11]=16'h2220;
	tai[12]=16'h4228;
	tai[13]=16'h4828;
	tai[14]=16'h0FC6;
	tai[15]=16'h0000;
	//正
	zheng[0]=16'h0000;
	zheng[1]=16'h3FF8;
	zheng[2]=16'h0100;
	zheng[3]=16'h0100;
	zheng[4]=16'h0100;
	zheng[5]=16'h0110;
	zheng[6]=16'h0110;
	zheng[7]=16'h1F10;
	zheng[8]=16'h0110;
	zheng[9]=16'h0110;
	zheng[10]=16'h0110;
	zheng[11]=16'h0110;
	zheng[12]=16'h0110;
	zheng[13]=16'h0110;
	zheng[14]=16'h7FFC;
	zheng[15]=16'h0000;
	//异
	yii[0]=16'h0000;
	yii[1]=16'h1FF8;
	yii[2]=16'h1008;
	yii[3]=16'h1008;
	yii[4]=16'h1FF8;
	yii[5]=16'h4008;
	yii[6]=16'h4008;
	yii[7]=16'h7FF0;
	yii[8]=16'h0000;
	yii[9]=16'h0820;
	yii[10]=16'h0820;
	yii[11]=16'h7FFC;
	yii[12]=16'h0820;
	yii[13]=16'h0810;
	yii[14]=16'h0808;
	yii[15]=16'h0000;
	//常
	chang[0]=16'h0000;
	chang[1]=16'h0100;
	chang[2]=16'h1110;
	chang[3]=16'h0920;
	chang[4]=16'hFFFE;
	chang[5]=16'h8002;
	chang[6]=16'h0FE0;
	chang[7]=16'h0820;
	chang[8]=16'h0FE0;
	chang[9]=16'h0100;
	chang[10]=16'h3FF8;
	chang[11]=16'h2108;
	chang[12]=16'h2108;
	chang[13]=16'h3908;
	chang[14]=16'h0100;
	chang[15]=16'h0000;
	//:
	maohao[0]=8'h00;
	maohao[1]=8'h00;
	maohao[2]=8'h00;
	maohao[3]=8'h00;
	maohao[4]=8'h18;
	maohao[5]=8'h18;
	maohao[6]=8'h00;
	maohao[7]=8'h00;
	maohao[8]=8'h00;
	maohao[9]=8'h00;
	maohao[10]=8'h18;
	maohao[11]=8'h18;
	maohao[12]=8'h00;
	maohao[13]=8'h00;
	maohao[14]=8'h00;
	maohao[15]=8'h00;
	//.
	dian[0]=8'h00;
	dian[1]=8'h00;
	dian[2]=8'h00;
	dian[3]=8'h00;
	dian[4]=8'h00;
	dian[5]=8'h00;
	dian[6]=8'h00;
	dian[7]=8'h00;
	dian[8]=8'h00;
	dian[9]=8'h00;
	dian[10]=8'h00;
	dian[11]=8'h18;
	dian[12]=8'h18;
	dian[13]=8'h00;
	dian[14]=8'h00;
	dian[15]=8'h00;
	//_空格
	kongge[0] = 8'h00;
	kongge[1] = 8'h00;
	kongge[2] = 8'h00;
	kongge[3] = 8'h00;
	kongge[4] = 8'h00;
	kongge[5] = 8'h00;
	kongge[6] = 8'h00;
	kongge[7] = 8'h00;
	kongge[8] = 8'h00;
	kongge[9] = 8'h00;
	kongge[10]=8'h00;
	kongge[11]=8'h00;
	kongge[12]=8'h00;
	kongge[13]=8'h00;
	kongge[14]=8'h00;
	kongge[15]=8'h00;	
	//电
	elc_dian[0] =16'h0000;
	elc_dian[1] =16'h0100;
	elc_dian[2] =16'h0100;
	elc_dian[3] =16'h0100;
	elc_dian[4] =16'h3ff8;
	elc_dian[5] =16'h2108;
	elc_dian[6] =16'h2108;
	elc_dian[7] =16'h3ff8;
	elc_dian[8] =16'h2108;
	elc_dian[9] =16'h2108;
	elc_dian[10]=16'h3ff8;
	elc_dian[11]=16'h0108;
	elc_dian[12]=16'h4100;
	elc_dian[13]=16'h4100;
	elc_dian[14]=16'h7e00;
	elc_dian[15]=16'h0000;
	//源
	srce_yuan[0] =16'h0000;
	srce_yuan[1] =16'h3fc4;
	srce_yuan[2] =16'h0448;
	srce_yuan[3] =16'h0250;
	srce_yuan[4] =16'h1f40;
	srce_yuan[5] =16'h1142;
	srce_yuan[6] =16'h1f44;
	srce_yuan[7] =16'h1150;
	srce_yuan[8] =16'h1f50;
	srce_yuan[9] =16'h0448;
	srce_yuan[10]=16'h1548;
	srce_yuan[11]=16'h2524;
	srce_yuan[12]=16'h24a4;
	srce_yuan[13]=16'h0610;
	srce_yuan[14]=16'h0000;
	srce_yuan[15]=16'h0000;
	//卡
	card_ka[0] =16'h0000;
	card_ka[1] =16'h0080;
	card_ka[2] =16'h0080;
	card_ka[3] =16'h1f80;
	card_ka[4] =16'h0080;
	card_ka[5] =16'h0080;
	card_ka[6] =16'h0080;
	card_ka[7] =16'h7ffc;
	card_ka[8] =16'h0080;
	card_ka[9] =16'h0280;
	card_ka[10]=16'h0480;
	card_ka[11]=16'h0880;
	card_ka[12]=16'h1080;
	card_ka[13]=16'h0080;
	card_ka[14]=16'h0080;
	card_ka[15]=16'h0000;
	//读
	read_du[0] =16'h0000;
	read_du[1] =16'h0408;
	read_du[2] =16'h0410;
	read_du[3] =16'h3f90;
	read_du[4] =16'h0400;
	read_du[5] =16'h7fc0;
	read_du[6] =16'h411c;
	read_du[7] =16'h2a10;
	read_du[8] =16'h0890;
	read_du[9] =16'h0910;
	read_du[10]=16'h7fd0;
	read_du[11]=16'h0410;
	read_du[12]=16'h1230;
	read_du[13]=16'h2110;
	read_du[14]=16'h2080;
	read_du[15]=16'h0000;
	//写
	write_xie[0] =16'h0000;
	write_xie[1] =16'h0000;
	write_xie[2] =16'h7ffc;
	write_xie[3] =16'h4004;
	write_xie[4] =16'h0020;
	write_xie[5] =16'h1fe0;
	write_xie[6] =16'h0020;
	write_xie[7] =16'h0010;
	write_xie[8] =16'h3ff0;
	write_xie[9] =16'h2000;
	write_xie[10]=16'h2000;
	write_xie[11]=16'h2ffc;
	write_xie[12]=16'h2000;
	write_xie[13]=16'h2000;
	write_xie[14]=16'h1800;
	write_xie[15]=16'h0000;
	//空
	idle_kong[0] =16'h0000;
	idle_kong[1] =16'h0080;
	idle_kong[2] =16'h0100;
	idle_kong[3] =16'h7ffc;
	idle_kong[4] =16'h4444;
	idle_kong[5] =16'h4824;
	idle_kong[6] =16'h1010;
	idle_kong[7] =16'h0000;
	idle_kong[8] =16'h1ff0;
	idle_kong[9] =16'h0100;
	idle_kong[10]=16'h0100;
	idle_kong[11]=16'h0100;
	idle_kong[12]=16'h0100;
	idle_kong[13]=16'h0100;
	idle_kong[14]=16'h7ffc;
	idle_kong[15]=16'h0000;
	//闲
	idle_xian[0] =16'h0000;
	idle_xian[1] =16'h0008;
	idle_xian[2] =16'h7fd0;
	idle_xian[3] =16'h4000;
	idle_xian[4] =16'h4108;
	idle_xian[5] =16'h4108;
	idle_xian[6] =16'h4fe8;
	idle_xian[7] =16'h4108;
	idle_xian[8] =16'h4388;
	idle_xian[9] =16'h4548;
	idle_xian[10]=16'h4928;
	idle_xian[11]=16'h4918;
	idle_xian[12]=16'h4108;
	idle_xian[13]=16'h4108;
	idle_xian[14]=16'h7008;
	idle_xian[15]=16'h0000;
	
	
	
lut0[0] =16'h0000;   lut1[0] =16'h0000;/*0000*/	lut2[0] =16'h0000; lut3[0] =16'h0000;
lut0[1] =16'h0000; 	lut1[1] =16'h0000;/*0000*/	lut2[1] =16'h0000; lut3[1] =16'h0000;
lut0[2] =16'h0000; 	lut1[2] =16'h0000;/*0000*/	lut2[2] =16'h0000; lut3[2] =16'h0000;
lut0[3] =16'h0000; 	lut1[3] =16'h0000;/*0000*/	lut2[3] =16'h0000; lut3[3] =16'h0000;
lut0[4] =16'h0000; 	lut1[4] =16'h0000;/*0000*/	lut2[4] =16'h0000; lut3[4] =16'h0000;
lut0[5] =16'h0000; 	lut1[5] =16'h0004;/*0004*/	lut2[5] =16'h0000; lut3[5] =16'h0000;
lut0[6] =16'h0000; 	lut1[6] =16'h000c;/*0006*/	lut2[6] =16'h0000; lut3[6] =16'h0000;
lut0[7] =16'h0000; 	lut1[7] =16'h001c;/*000e*/	lut2[7] =16'h0000; lut3[7] =16'h0000;
lut0[8] =16'h0000; 	lut1[8] =16'h003c;/*001e*/	lut2[8] =16'h0000; lut3[8] =16'h0000;
lut0[9] =16'h0000; 	lut1[9] =16'h007c;/*003e*/	lut2[9] =16'h0000; lut3[9] =16'h0000;
lut0[10]=16'h0000; 	lut1[10]=16'h00fc;/*007e*/	lut2[10]=16'h0000; lut3[10]=16'h0000;
lut0[11]=16'h0000; 	lut1[11]=16'h01fc;/*00fe*/	lut2[11]=16'h0000; lut3[11]=16'h0000;
lut0[12]=16'h0000; 	lut1[12]=16'h03fc;/*01fe*/	lut2[12]=16'h0000; lut3[12]=16'h0000;
lut0[13]=16'h0000; 	lut1[13]=16'h07fc;/*03fe*/	lut2[13]=16'h0000; lut3[13]=16'h0000;
lut0[14]=16'h0000; 	lut1[14]=16'h0ffc;/*07fe*/	lut2[14]=16'h0000; lut3[14]=16'h0000;
lut0[15]=16'h0000; 	lut1[15]=16'h1ffc;/*0ffe*/	lut2[15]=16'h0000; lut3[15]=16'h0000;

lut4[0] =16'h0000; lut5[0] =16'h1ffe; lut6[0] =16'h0000; lut7[0] =16'h0000;    
lut4[1] =16'h2000; lut5[1] =16'h3ffe; lut6[1] =16'h0000; lut7[1] =16'h0000;
lut4[2] =16'h3000; lut5[2] =16'h03fe; lut6[2] =16'h0000; lut7[2] =16'h0000;
lut4[3] =16'h3800; lut5[3] =16'h00fe; lut6[3] =16'hc000; lut7[3] =16'h00ff;
lut4[4] =16'h3c00; lut5[4] =16'h00fe; lut6[4] =16'hf000; lut7[4] =16'h03ff;
lut4[5] =16'h3e00; lut5[5] =16'h007e; lut6[5] =16'hf800; lut7[5] =16'h07ff;
lut4[6] =16'h3f00; lut5[6] =16'hf07e; lut6[6] =16'hf803; lut7[6] =16'h07c0;
lut4[7] =16'h3f80; lut5[7] =16'hf87e; lut6[7] =16'h7807; lut7[7] =16'h0780;
lut4[8] =16'h3fc0; lut5[8] =16'hfc7e; lut6[8] =16'h380f; lut7[8] =16'h0700;
lut4[9] =16'h3fe0; lut5[9] =16'hfc7e; lut6[9] =16'h380f; lut7[9] =16'h0700;
lut4[10]=16'h3ff0; lut5[10]=16'hfc7e; lut6[10]=16'h380f; lut7[10]=16'h0700;
lut4[11]=16'h3ff0; lut5[11]=16'hfc7e; lut6[11]=16'h380f; lut7[11]=16'h0700;
lut4[12]=16'h3ff0; lut5[12]=16'hfc7e; lut6[12]=16'h380f; lut7[12]=16'h0700;
lut4[13]=16'h3ff0; lut5[13]=16'hfc7e; lut6[13]=16'h380f; lut7[13]=16'h0700;
lut4[14]=16'h3ff0; lut5[14]=16'hfc7e; lut6[14]=16'h380f; lut7[14]=16'h0700;
lut4[15]=16'h3ff0; lut5[15]=16'hfc7e; lut6[15]=16'h380f; lut7[15]=16'h0700;

lut8[0] =16'h3ff0; lut9[0] =16'hfc7e; lut10[0] =16'h380f; lut11[0] =16'h0700;
lut8[1] =16'h3ff0; lut9[1] =16'hfc7e; lut10[1] =16'h380f; lut11[1] =16'h0700;	
lut8[2] =16'h3ff0; lut9[2] =16'hfc7e; lut10[2] =16'h380f; lut11[2] =16'h0700;	
lut8[3] =16'h3ff0; lut9[3] =16'hfc7e; lut10[3] =16'h380f; lut11[3] =16'h0700;	
lut8[4] =16'h3ff0; lut9[4] =16'hfc7e; lut10[4] =16'h380f; lut11[4] =16'h0700;	
lut8[5] =16'h3ff0; lut9[5] =16'hfc7e; lut10[5] =16'h380f; lut11[5] =16'h0700;	
lut8[6] =16'h3ff0; lut9[6] =16'hfc7e; lut10[6] =16'h380f; lut11[6] =16'h0700;	
lut8[7] =16'h3ff0; lut9[7] =16'hfc7e; lut10[7] =16'h380f; lut11[7] =16'h0700;	
lut8[8] =16'h3ff0; lut9[8] =16'hfc7e; lut10[8] =16'h380f; lut11[8] =16'h0700;	
lut8[9] =16'h3ff0; lut9[9] =16'hfc7e; lut10[9] =16'h380f; lut11[9] =16'h0700;	
lut8[10]=16'h3ff0; lut9[10]=16'hfc7e; lut10[10]=16'h780f; lut11[10]=16'h0780;	
lut8[11]=16'h3ff0; lut9[11]=16'hf87e; lut10[11]=16'hf807; lut11[11]=16'h07c0;	
lut8[12]=16'h3ff0; lut9[12]=16'hf07e; lut10[12]=16'hf803; lut11[12]=16'h07ff;	
lut8[13]=16'h3ff0; lut9[13]=16'h00fe; lut10[13]=16'hf000; lut11[13]=16'h03ff;	
lut8[14]=16'h3ff0; lut9[14]=16'h00fe; lut10[14]=16'hc000; lut11[14]=16'h00ff;	
lut8[15]=16'h3ff0; lut9[15]=16'h01fe; lut10[15]=16'h0000; lut11[15]=16'h0000;	

lut12[0] =16'hfff0; lut13[0] =16'hffff; lut14[0] =16'h007f; lut15[0] =16'h0000;
lut12[1] =16'hfff0; lut13[1] =16'hffff; lut14[1] =16'h007f; lut15[1] =16'h0000;
lut12[2] =16'hfff0; lut13[2] =16'hffff; lut14[2] =16'h007f; lut15[2] =16'h0000;
lut12[3] =16'hfff0; lut13[3] =16'hffff; lut14[3] =16'h007f; lut15[3] =16'h0000;
lut12[4] =16'hfff0; lut13[4] =16'hffff; lut14[4] =16'h007f; lut15[4] =16'h0000;
lut12[5] =16'hfff0; lut13[5] =16'hffff; lut14[5] =16'h007f; lut15[5] =16'h0000;
lut12[6] =16'hfff0; lut13[6] =16'hffff; lut14[6] =16'h007f; lut15[6] =16'h0000;
lut12[7] =16'hfff0; lut13[7] =16'hffff; lut14[7] =16'h007f; lut15[7] =16'h0000;
lut12[8] =16'hfff0; lut13[8] =16'hffff; lut14[8] =16'h007f; lut15[8] =16'h0000;
lut12[9] =16'hfff0; lut13[9] =16'hffff; lut14[9] =16'h007f; lut15[9] =16'h0000;
lut12[10]=16'h3ff0; lut13[10]=16'hfffe; lut14[10]=16'h007f; lut15[10]=16'h0000;
lut12[11]=16'h3ff0; lut13[11]=16'hfffe; lut14[11]=16'h007f; lut15[11]=16'h0000;
lut12[12]=16'h3ff0; lut13[12]=16'hfffe; lut14[12]=16'h007f; lut15[12]=16'h0000;
lut12[13]=16'h3ff0; lut13[13]=16'hfffe; lut14[13]=16'h007f; lut15[13]=16'h0000;
lut12[14]=16'h0000; lut13[14]=16'h0000; lut14[14]=16'h0000; lut15[14]=16'h0000;
lut12[15]=16'h0000; lut13[15]=16'h0000; lut14[15]=16'h0000; lut15[15]=16'h0000;


	
	end
always@(*) 
	case(zicode)
		0:	begin
				zi_y = ling[ziy];//0
				zipoint = zi_y[zix];
			end
		1:	begin
				zi_y = yi[ziy];//1
				zipoint = zi_y[zix];
			end
		2:	begin 
				zi_y = er[ziy];//2
				zipoint = zi_y[zix];
			end
		3:	begin
				zi_y = san[ziy];//3
				zipoint = zi_y[zix];
			end
		4:	begin
				zi_y = si[ziy];//4
				zipoint = zi_y[zix];
			end
		5:	begin
				zi_y = wu[ziy];//5
				zipoint = zi_y[zix];
			end
		6:	begin
				zi_y = liu[ziy];//6
				zipoint = zi_y[zix];
			end
		7:	begin
				zi_y = qi[ziy];//7
				zipoint = zi_y[zix];
			end
		8:	begin
				zi_y = ba[ziy];//8
				zipoint = zi_y[zix];
			end
		9:	begin
				zi_y = jiu[ziy];//9
				zipoint = zi_y[zix];
			end
		10:begin
				zi_y = xin[ziy];//信
				zipoint = zi_y[zix];
			end
		11:begin
				zi_y = hao[ziy];//号
				zipoint = zi_y[zix];
			end
		12:begin
				zi_y = shun[ziy];//瞬
				zipoint = zi_y[zix];
			end
		13:begin
				zi_y = shi[ziy];//时
				zipoint = zi_y[zix];
			end
		14:begin
				zi_y = jian[ziy];//间
				zipoint = zi_y[zix];
			end
		15:begin
				zi_y = zhuang[ziy];//状
				zipoint = zi_y[zix];
			end
		16:begin
				zi_y = tai[ziy];//态
				zipoint = zi_y[zix];
			end
		17:begin
				zi_y = zheng[ziy];//正
				zipoint = zi_y[zix];
			end
		18:begin
				zi_y = yii[ziy];//异
				zipoint = zi_y[zix];
			end
		19:begin
				zi_y = chang[ziy];//常
				zipoint = zi_y[zix];
			end
		20:begin
				zi_y = maohao[ziy];//:
				zipoint = zi_y[zix];
			end
		21:begin
				zi_y = xinn[ziy];//心
				zipoint = zi_y[zix];
			end
		22:begin
				zi_y = lv[ziy];//率
				zipoint = zi_y[zix];
			end
		23:begin
				zi_y = dian[ziy];//.
				zipoint = zi_y[zix];
			end
		24:begin
				zi_y = kongge[ziy];//_ _
				zipoint = zi_y[zix];
			end
		25:begin
				zi_y = elc_dian[ziy];//电
				zipoint = zi_y[zix];
			end
		26:begin
				zi_y = srce_yuan[ziy];//源
				zipoint = zi_y[zix];
			end
		
			
///////////////lut
		30:begin
				zi_y = lut0[ziy];
				zipoint = zi_y[zix];
			end
		31:begin
				zi_y = lut1[ziy];
				zipoint = zi_y[zix];
			end
		32:begin
				zi_y = lut2[ziy];
				zipoint = zi_y[zix];
			end
		33:begin
				zi_y = lut3[ziy];
				zipoint = zi_y[zix];
			end
		34:begin
				zi_y = lut4[ziy];
				zipoint = zi_y[zix];
			end
		35:begin
				zi_y = lut5[ziy];
				zipoint = zi_y[zix];
			end
		36:begin
				zi_y = lut6[ziy];
				zipoint = zi_y[zix];
			end
		37:begin
				zi_y = lut7[ziy];
				zipoint = zi_y[zix];
			end
		38:begin
				zi_y = lut8[ziy];
				zipoint = zi_y[zix];
			end
		39:begin
				zi_y = lut9[ziy];
				zipoint = zi_y[zix];
			end
		40:begin
				zi_y = lut10[ziy];
				zipoint = zi_y[zix];
			end
		41:begin
				zi_y = lut11[ziy];
				zipoint = zi_y[zix];
			end
		42:begin
				zi_y = lut12[ziy];
				zipoint = zi_y[zix];
			end
		43:begin
				zi_y = lut13[ziy];
				zipoint = zi_y[zix];
			end
		44:begin
				zi_y = lut14[ziy];
				zipoint = zi_y[zix];
			end
		45:begin
				zi_y = lut15[ziy];
				zipoint = zi_y[zix];
			end
		////////////////////////////////////////
		46:begin
				zi_y = AA[ziy];//A
				zipoint = zi_y[zix];
			end
		47:begin
				zi_y = CC[ziy];//C
				zipoint = zi_y[zix];
			end
		48:begin
				zi_y = DD[ziy];//D
				zipoint = zi_y[zix];
			end
		49:begin
				zi_y = SS[ziy];//S
				zipoint = zi_y[zix];
			end
		50:begin
				zi_y = card_ka[ziy];//卡
				zipoint = zi_y[zix];
			end
		51:begin
				zi_y = read_du[ziy];//读
				zipoint = zi_y[zix];
			end
		52:begin
				zi_y = write_xie[ziy];//写
				zipoint = zi_y[zix];
			end
		53:begin
				zi_y = idle_kong[ziy];//空
				zipoint = zi_y[zix];
			end
		54:begin
				zi_y = idle_xian[ziy];//闲
				zipoint = zi_y[zix];
			end
		55:begin
				zi_y = AD[ziy];//AD
				zipoint = zi_y[zix];
			end
		56:begin
				zi_y = SD[ziy];//SD
				zipoint = zi_y[zix];
			end
		57:begin
				zi_y = C_[ziy];//C_
				zipoint = zi_y[zix];
			end
		58:begin
				zi_y = yiwu[ziy];//15
				zipoint = zi_y[zix];
			end
		59:begin
				zi_y = lingwu[ziy];//05
				zipoint = zi_y[zix];
			end
		60:begin
				zi_y = erliu[ziy];//26
				zipoint = zi_y[zix];
			end
		61:begin
				zi_y = linger[ziy];//02
				zipoint = zi_y[zix];
			end
		62:begin
				zi_y = wujiu[ziy];//59
				zipoint = zi_y[zix];
			end
		default:zipoint = 0;

	endcase
endmodule

	