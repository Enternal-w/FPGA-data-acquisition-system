
/***************************************************
*	Module Name		:	display_ctrl		   
*	Engineer		   :	杨绪刚
*	Target Device	:	EP4CE10F17C8
*	Tool versions	:	Quartus II 13.0
*	Create Date		:	2019-5-20
*	Revision		   :	v1.1
*	Description		:  //屏幕区域显示控制
**************************************************/
module display_ctrl(
	clk,
	hcount,
   vcount,
	
	
	zipoint,//
	zicode,//cs
	zix,//h
	ziy,//l
	
	rgb_data,
	wavepoint,
	
	hour_1_in,
	hour_0_in,
	minute_1_in,
	minute_0_in,
	second_1_in,
	second_0_in,
	
	ecgstate,
	xinlv0,
	xinlv1,
	xinlv2,
	
	init_done,
	req_r,
	req_w
	);	
					input		clk;
					
/*| 屏 |     */
/*| 幕 | --> */input		[9:0]hcount;
/*| 驱 | --> */input		[9:0]vcount;
/*| 动 | <-- */output	reg[15:0]rgb_data;

/*| 波 |     */
/*| 形 | --> */
/*| 显 | --> */input		wavepoint;
/*| 示 | --> */

/*| 心 |     */input		ecgstate;
/*| 率 | --> */input		[3:0]xinlv0;
/*| 显 | --> */input		[3:0]xinlv1;
/*| 示 | --> */input		[3:0]xinlv2;

/*| 时 |     */input		[3:0]hour_1_in;
/*| 间 | --> */input		[3:0]hour_0_in;
/*| 显 | --> */input		[3:0]minute_1_in;
/*| 示 | --> */input		[3:0]minute_0_in;
/*|			 */input		[3:0]second_1_in;
/*|			 */input		[3:0]second_0_in;

					input		init_done;
/*| 读 | --> */input		req_r;
/*| 写 | --> */input		req_w;
					
					input		zipoint; 			/* <-- | 字 |*/
					output	reg[6:0]zicode;	/* --> | 体 |*/
					output	reg[3:0]zix;		/* --> | 模 |*/
					output	reg[3:0]ziy;		/* --> | 块 |*/
	
localparam 
	BLACK		= 16'h0000, //黑色
	BLUE		= 16'h001F, //蓝色
	RED		= 16'hF800, //红色
	PURPPLE	= 16'hF81F, //紫色
	GREEN		= 16'h07E0, //绿色
	CYAN		= 16'h07FF, //青色
	YELLOW	= 16'hFFE0, //黄色
	WHITE		= 16'hFFFF, //白色
	LINE    = 16'b11110_100000_00011,
	LINE1    = 16'b00111_011001_01011,
	RED_G    = 16'b11110_000000_00010,//国旗红
	YELLOW_G   = 16'b11100_110010_00111;//国旗黄

	
//***********************************************	
	always@(*)
	//*************************波形
	if(vcount <= 254)begin
		if(hcount <= 3)
		rgb_data =BLACK;
		//***************************************波形显示
		else if(hcount<=398)
		begin 
			if(wavepoint == 0)
				rgb_data = CYAN;
			else
				rgb_data =BLACK;
		end

		//***************************************竖线
		else if(hcount == 399)
			rgb_data =LINE;	
		
		else if(hcount<=415)begin//**************1
			if(vcount<=111)//1,1-7
						rgb_data = BLACK;
			else if(vcount<=127)//1,8
				begin
				zicode = 10;//信
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=143)//1,9
						rgb_data = BLACK;
			else if(vcount<=159)//1,10
				begin
				zicode = 56;//SD
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=223)//1,11-14
						rgb_data = BLACK;
			else if(vcount<=239)//1,15
				begin
				zicode = 58;//15
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else
				rgb_data = BLACK;
		end
		
		else if( hcount<=431)//**************2
			if(vcount <= 15)//2,1
				begin
				zicode = 30;
				zix = -(401-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=31)//2,2
				begin
				zicode = 34;
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=47)//2,3
				begin
				zicode = 38;
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=63)//2,4
				begin
				zicode = 42;
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=79)//2,5
						rgb_data = BLACK;
			else if(vcount<=95)//2,6
				begin
				zicode = 21;//心
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=111)//2,7
						rgb_data = BLACK;	
			else if(vcount<=127)//2,8
				begin
				zicode = 26;//源
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=143)//2,9
						rgb_data = BLACK;
			else if(vcount<=159)//2,10
				begin
				zicode = 50;//卡
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=223)//2,11-14
						rgb_data = BLACK;
			else if(vcount<=239)//2,15
				begin
				zicode = 59;//05
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else
				rgb_data = BLACK;
		else if(hcount<=447)//**************3
			if(vcount <= 15)//3,1
				begin
				zicode = 31;
				zix = -(415-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=31)//3,2
				begin
				zicode = 35;
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=47)//3,3
				begin
				zicode = 39;
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=63)//3,4
				begin
				zicode = 43;
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=79)//3,5
						rgb_data = BLACK;
			else if(vcount<=95)//3,6
				begin
				zicode = 25;//电
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end	
			else if(vcount<=111)//3,7
						rgb_data = BLACK;
			else if(vcount<=127)//3,8
				begin
				zicode = 20;//：
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=143)//3,9
						rgb_data = BLACK;
			else if(vcount<=159)//3,10
				begin
				zicode = 20;//：
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=223)//3,11-14
						rgb_data = BLACK;
			else if(vcount<=239)//3,15
				begin
				zicode = 60;//26
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else
				rgb_data = BLACK;
		
		else if(hcount<=463)//**************4
			if(vcount <= 15)//4,1
				begin
				zicode = 32;
				zix = -(415-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=31)//4,2
				begin
				zicode = 36;
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=47)//4,3
				begin
				zicode = 40;
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=63)//4,4
				begin
				zicode = 44;
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end	
			else if(vcount<=79)//4,5
						rgb_data = BLACK;
			else if(vcount<=95)//4,6
				begin
				zicode = 10;//信
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=111)//4,7
						rgb_data = BLACK;
			else if(vcount<=127)//4,8
				begin
				if(req_r)
					zicode = 56;//SD
				else
					zicode = 55;//AD
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=143)//4,9
						rgb_data = BLACK;
			else if(vcount<=159)//4,10
				begin
				if(init_done)
					if(req_r)
						zicode = 51;//读
					else if(req_w)
						zicode = 52;//写
					else
						zicode = 53;//空
				else
					zicode = 18;//异
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=223)//4,11-14
						rgb_data = BLACK;
			else if(vcount<=239)//4,15
				begin
				zicode = 61;//02
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else
				rgb_data = BLACK;
		
		else if(hcount<=479)//**************5
			if(vcount <= 15)//5,1
				begin
				zicode = 33;
				zix = -(415-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=31)//5,2
				begin
				zicode = 37;
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=47)//5,3
				begin
				zicode = 41;
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=63)//5,4
				begin
				zicode = 45;
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end	
			else if(vcount<=79)//5,5
						rgb_data = BLACK;
			else if(vcount<=95)//5,6
				begin
				zicode = 11;//号
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=111)//5,7
						rgb_data = BLACK;
			else if(vcount<=127)//5,8
				begin
				if(req_r)
					zicode = 50;//卡
				else
					zicode = 57;//C_
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=143)//5,9
						rgb_data = BLACK;
			else if(vcount<=159)//5,10
				begin
				if(init_done)
					if(req_r)
						zicode = 24;//  
					else if(req_w)
						zicode = 24;// 
					else
						zicode = 54;//闲
				else
					zicode = 19;//常
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else if(vcount<=223)//5,11-14
							rgb_data =BLACK;
			else if(vcount<=239)//5,15
				begin
				zicode = 62;//59
				zix = -(400-hcount);
				ziy = -(256-vcount);
						if(zipoint == 1)
						rgb_data = CYAN;
						else
						rgb_data = BLACK;
				end
			else
				rgb_data = BLACK;		
	end
	
	//*************************横线
	else if(vcount == 255)begin 
		rgb_data = LINE;
	end

	
	
	
	//*************************心率
	else if(vcount > 255)begin
		if(hcount <= 15)
		begin
		zicode = 12;	 //瞬
		zix = -(0-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else if(hcount <= 31)
		begin
		zicode = 13; //时
		zix = -(15-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else if(hcount <= 47)
		begin
		zicode = 21; // 心
		zix = -(31-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else if(hcount <= 63)
		begin
		zicode = 22;// 率
		zix = -(47-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else if(hcount <= 71)
		begin
		zicode = 20;// :
		zix = -(63-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		
		else if(hcount <= 79)
		begin
		case (xinlv2)
		0:zicode = 24;
		1:zicode = 1;
		2:zicode = 2;
		3:zicode = 3;
		4:zicode = 4;
		5:zicode = 5;
		6:zicode = 6;
		7:zicode = 7;
		8:zicode = 8;
		9:zicode = 9;
		default:zicode = 0;
		endcase
		zix = -(71-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		
		else if(hcount <= 87)
		begin
		case (xinlv1)
		0:zicode = 0;
		1:zicode = 1;
		2:zicode = 2;
		3:zicode = 3;
		4:zicode = 4;
		5:zicode = 5;
		6:zicode = 6;
		7:zicode = 7;
		8:zicode = 8;
		9:zicode = 9;
		default:zicode = 0;
		endcase
		zix = -(79-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		
		else if(hcount <= 95)
		begin
		case (xinlv0)
		0:zicode = 0;
		1:zicode = 1;
		2:zicode = 2;
		3:zicode = 3;
		4:zicode = 4;
		5:zicode = 5;
		6:zicode = 6;
		7:zicode = 7;
		8:zicode = 8;
		9:zicode = 9;
		default:zicode = 0;
		endcase
		zix = -(87-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		//*************************
		
		
		
		//*************************空格
		else if(hcount <= 111)
		begin
				rgb_data = BLACK;
		end
		//*************************
		
		
		
		//*************************状态
		else if(hcount <= 127)
		begin
		zicode = 15;//状
		zix = -(111-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else if(hcount <= 143)
		begin
		zicode = 16;//态
		zix = -(111-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else if(hcount <= 151)
		begin
		zicode = 20;//：
		zix = -(143-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else if(hcount <= 167)
		begin
			if(ecgstate == 1)//异
				zicode <= 18;
			else//正
				zicode <= 17;
				zix = -(151-hcount);
				ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else if(hcount <= 183)
		begin
		zicode = 19;
		zix = -(167-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		//**************************
		
		
		
		//**************************
		else if(hcount <= 327)
		begin
				rgb_data = BLACK;
		end
		//**************************
		
		
		
		//**************************时分秒
		else if(hcount <= 335)
		begin
		zicode = hour_1_in;//时1
		zix = -(327-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else if(hcount <= 343)
		begin
		zicode = hour_0_in;//时0
		zix = -(335-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else if(hcount <= 351)
		begin
		zicode = 20;//:
		zix = -(343-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else if(hcount <= 359)
		begin
		zicode = minute_1_in;//分1
		zix = -(351-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else if(hcount <= 367)
		begin
		zicode = minute_0_in;//分0
		zix = -(359-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else if(hcount <= 375)
		begin
		zicode = 20;//：
		zix = -(367-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else if(hcount <= 383)
		begin
		zicode = second_1_in;//秒1
		zix = -(375-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else if(hcount <= 391)
		begin
		zicode = second_0_in;//
		zix = -(383-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else if(hcount <= 399)
		begin
		zicode = 24;//_
		zix = -(391-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		
		//**************************
		
		
		
		//**************************年月日
		else if(hcount <= 407)
		begin
		zicode = 2;
		zix = -(399-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else if(hcount <= 415)
		begin
		zicode = 0;
		zix = -(407-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else if(hcount <= 423)
		begin
		zicode = 1;
		zix = -(415-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else if(hcount <= 431)
		begin
		zicode = 9;
		zix = -(423-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else if(hcount <= 439)
		begin
		zicode = 23;
		zix = -(431-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else if(hcount <= 447)
		begin
		zicode = 0;
		zix = -(439-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else if(hcount <= 455)
		begin
		zicode = 4;
		zix = -(447-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else if(hcount <= 463)
		begin
		zicode = 23;
		zix = -(455-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else if(hcount <= 471)
		begin
		zicode = 1;
		zix = -(463-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
		else //if(hcount <= 479)
		begin
		zicode = 6;
		zix = -(471-hcount);
		ziy = -(256-vcount);
				if(zipoint == 1)
				rgb_data = CYAN;
				else
				rgb_data = BLACK;
		end
			


	end		

	

	endmodule