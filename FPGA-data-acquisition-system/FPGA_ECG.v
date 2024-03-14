/***************************************************
*	Module Name		:	FPGA_ECG		   
*	Engineer		   :	杨绪刚
*	Target Device	:	EP4CE10F17C8
*	Tool versions	:	Quartus II 13.0
*	Create Date		:	2019-4-18
*	Revision		   :	v1.1
*	Description		:  //ECG监测系统顶层程序
**************************************************/
module FPGA_ECG(
	Clk, 	     //50MHZ时钟
	Rst_n,
	
	ADC_DOUT,  //ADC
	ADC_SCLK,  //ADC
	ADC_CS_N,  //ADC
	ADC_DIN,   //ADC
	
	bell,
	
	TFT_RGB,   //TFT数据输出
	TFT_HS,	  //TFT行同步信号
	TFT_VS,	  //TFT场同步信号
	TFT_CLK,
	TFT_DE,
	TFT_PWM,
	
																	//	SD_dataout,
																	//	SD_clk,    
																	//	SD_cs,     
																	//	SD_datain, 
//	sys_clk     ,  //系统时钟
//   sys_rst_n   ,  //系统复位，低电平有效


   sd_miso     ,  //SD卡SPI串行输入数据信号
   sd_clk      ,  //SD卡SPI时钟信号
   sd_cs       ,  //SD卡SPI片选信号
   sd_mosi     ,  //SD卡SPI串行输出数据信号


   led,            //LED灯
	
	
	key_w,
	key_r,
	
	Rs232_Tx  //Rs232输出信号
	
	);

	input Clk;
	input Rst_n;
	input key_w;
	input key_r;
	input   ADC_DOUT;       //ADC
	output  ADC_SCLK;
	output  ADC_CS_N;
	output  ADC_DIN;
	
																//	input  SD_dataout;	//sd
																//	output SD_clk;
																//	output SD_cs;
																//	output SD_datain;
	
//	 input               sys_clk     ;  //系统时钟
//    input               sys_rst_n   ;  //系统复位，低电平有效
    
    //SD卡接口
    input               sd_miso     ;  //SD卡SPI串行输入数据信号
    output              sd_clk      ;  //SD卡SPI时钟信号
    output              sd_cs       ;  //SD卡SPI片选信号
    output              sd_mosi     ;  //SD卡SPI串行输出数据信号
   
    //LED
    output      [3:0]   led   ;         //LED灯
	
	output Rs232_Tx;
	wire Tx_Done;	
	
	output [15:0]TFT_RGB;     //TFT
	output TFT_HS;
	output TFT_VS;
	output TFT_CLK;
	output TFT_DE;
	output TFT_PWM;

	output bell;//蜂鸣器
	
	wire Clk9M;
	wire adc_clk;
	wire Clk2M;
	
	wire [15:0]DATA;        //ADC输出数据
	wire start;             //ADC 触发
	wire [2:0]channel;      //ADC 通道选择
	
	wire [15:0]disp_data;   //显示数据
	wire [9:0]hcount;
	wire [9:0]vcount;
   wire wavepoint;         //显示触发
	wire conv_done;         //ADC转换完成标志
	
	wire [5:0]zicode;			//字选 
	wire [4:0]zix; 			//字库 
	wire [4:0]ziy; 			//字库 
	wire zipoint;   			//字 触发
	
	wire [3:0]xinlv0;       //参数计算
	wire [3:0]xinlv1;
	wire [3:0]xinlv2;
	wire [9:0]wavem5;
	
	wire [3:0]hour_1;
	wire [3:0]hour_0;
	wire [3:0]minute_1;
	wire [3:0]minute_0;
	wire [3:0]second_1;
	wire [3:0]second_0;
	
	wire [21:0]filter_data;  //滤波输出
	wire [0:7]mid_data_out;
	wire vnpd;//心率方波上升沿

					wire             clk_ref        ;
					wire             clk_ref_180deg ;
					wire             rst_n          ;
					wire             locked         ;
					wire             wr_start_en    ;      //开始写SD卡数据信号
//					wire     [31:0]  wr_sec_addr    ;      //写数据扇区地址    
					wire     [15:0]  wr_data        ;      //写数据            
					wire             rd_start_en    ;      //开始写SD卡数据信号
					wire     [31:0]  rd_sec_addr    ;      //读数据扇区地址    
					wire             error_flag     ;      //SD卡读写错误的标志
					wire             wr_busy        ;      //写数据忙信号
					wire             wr_req         ;      //写数据请求信号
					wire             rd_busy        ;      //读忙信号
					wire             rd_val_en      ;      //数据读取有效使能信号
					wire     [15:0]  rd_val_data    ;      //读数据
					wire             sd_init_done   ;      //SD卡初始化完成信号
	
	
	
	reg [2:0] cnt;	
	
					assign  rst_n = Rst_n & locked;
	
	
	always@(posedge Clk or negedge Rst_n)
	if(!Rst_n)
		cnt <= 1'b0;
	else if(Tx_Done)
		cnt <= cnt + 1'b1;	
	
	uart_byte_tx uart_byte_tx(
		.Clk(Clk),
		.Rst_n(Rst_n),
		.data_byte(DATA),
		.send_en(1'b1),
		.baud_set(3'd0),		
		.Rs232_Tx(Rs232_Tx),
		.Tx_Done(Tx_Done),
		.uart_state()
	);

	
	belldrive belldrive(
		.clk(Clk2M), 
		.req_r(req_r),
		.trigger(vnpd), 
		.bell(bell)
	);
	

	//锁相环分频
	TFT_test_pl TFT_test_pll(
		.inclk0(Clk),   //50M输入
		.c0(Clk9M),     //9MTFT
		.c1(adc_clk),   //2500Hz ADC
		.c2(Clk2M)
	);
	
	pll_clk	pll_clk_inst (
	.areset     (1'b0),
	.inclk0     (Clk),
	.c0         (clk_ref),
	.c1         (clk_ref_180deg),
	.locked     (locked)
	);
	
	//TFT驱动
	TFT_CTRL TFT_CTRL(
		.Clk9M(Clk9M),    	//系统输入时钟9MHZ
		.Rst_n(Rst_n),
		.data_in(disp_data),	//待显示数据
		.hcount(hcount),		//TFT行扫描计数器
		.vcount(vcount),		//TFT场扫描计数器
		.TFT_RGB(TFT_RGB),	//TFT数据输出
		.TFT_HS(TFT_HS),		//TFT行同步信号
		.TFT_VS(TFT_VS),		//TFT场同步信号
		.TFT_CLK(TFT_CLK),
		.TFT_DE(TFT_DE),
		.TFT_PWM(TFT_PWM)
	);
	//波形处理
	wave wave(
		.Clk(Clk9M),
		.Rst_n(Rst_n),
		.vcount(vcount),
		.hcount(hcount),
		.wave_data(wave_data),//(mid_data_out filter_data[21:14]),
		.wavepoint(wavepoint)
	);
	
	wire ecgstate;
	//心率
//	xinlv xinlv(
//	.rest_n(Rst_n),
//	.clk(conv_done),
//	.wave_data(wave_data),//mid_data_out(filter_data[21:14]),
//	.vnpd(vnpd),
//	.ecgstate(ecgstate),
//	.xinlv0(xinlv0),
//	.xinlv1(xinlv1),
//	.xinlv2(xinlv2)
//);



//时分秒
	h_m_s h_m_s(
	.clk_1hz(Clk9M),
	.hour_1_out(hour_1),
	.hour_0_out(hour_0),
	.minute_1_out(minute_1),
	.minute_0_out(minute_0),
	.second_1_out(second_1),
	.second_0_out(second_0)
);
   //显示控制	
	display_ctrl display_ctrl(
	.clk(Clk),
	.hcount(hcount),
   .vcount(vcount),
	.rgb_data(disp_data),
	.zipoint(zipoint),
	.zicode(zicode),
	.zix(zix),
	.ziy(ziy),
	
//	.ecgstate(ecgstate),
//	.xinlv0(xinlv0),
//	.xinlv1(xinlv1),
//	.xinlv2(xinlv2),
	
	.init_done(init_done),
	.req_r(req_r),
	.req_w(req_w),
	
	.hour_1_in(hour_1),
	.hour_0_in(hour_0),
	.minute_1_in(minute_1),
	.minute_0_in(minute_0),
	.second_1_in(second_1),
	.second_0_in(second_0),
	
	.wavepoint(wavepoint)	
);
	

	
	//ADC采集
	adc128s022 adc128s022(
		.Clk(adc_clk),
		.Rst_n(Rst_n),
		.Channel(3'b0),//(channel),
		.Data(DATA),
		.En_Conv(1'b1),//(start),
		.Conv_Done(conv_done),  //conv_done频率为sclk的1/17，采样频率=conv_done
		.ADC_State(),
		.DIV_PARAM(4'd10),      //分频计数10 2sclk=adc_clk/10
		.ADC_SCLK(ADC_SCLK),    
		.ADC_DOUT(ADC_DOUT),
		.ADC_DIN(ADC_DIN),
		.ADC_CS_N(ADC_CS_N)	
	);

	//字库
	ziti ziti(
		.clk(Clk),
		.zicode(zicode),
		.zix(zix),
		.ziy(ziy),
		.zipoint(zipoint)
	);
	//低通滤波器
	//filter_32 filter_32(
	//	.clk(adc_clk),
	//	.rest_n(Rst_n),
	//	.adc_data(DATA),
	//	.filter_data(filter_data)
	//);
	//中值滤波
	//mid_filter mid_filter(
	//	.clk(Clk),
	//	.rest_n(Rst_n),
	//	.data_clk(conv_done),
	//	.data(DATA[11:4]),
	//	.mid_data_out(mid_data_out)//输出中值
	//);
	
																			//	//存储
																			//	sd_test sd_test(
																			//		 .clk(Clk),          //50Mhz input clock 
																			//		 .rst_n(Rst_n),
																			//		 .adc_data(DATA[11:0]),//mid_data_out
																			//		 .SD_dataout(SD_dataout), //SD SPI 数据输出
																			//		 .init_done(init_done),
																			//		 .SD_clk(SD_clk),       //25Mhz SD SPI 时钟
																			//		 .SD_cs(SD_cs),        //SD SPI 片选
																			//		 .SD_datain(SD_datain),    //SD SPI 数据输入
																			//		 .sddata_o(sd_data),
																			//		 .req_r(req_r),
																			//		 .req_w(req_w)
																			//		 
																			// );
	data_gen u_data_gen(
    .clk             (clk_ref),
    .rst_n           (Rst_n),
    .sd_init_done    (sd_init_done),
    .wr_busy         (wr_busy),
    .wr_req          (wr_req),
    .wr_start_en     (wr_start_en),
//    .wr_sec_addr     (wr_sec_addr),
    .wr_data         (wr_data),
    .rd_val_en       (rd_val_en),
    .rd_val_data     (rd_val_data),
    .rd_start_en     (rd_start_en),
    .rd_sec_addr     (rd_sec_addr),
    .error_flag      (error_flag)
    );
 
 //SD卡顶层控制模块
	sd_ctrl_top u_sd_ctrl_top(
    .clk_ref           (clk_ref),
    .clk_ref_180deg    (clk_ref_180deg),
    .rst_n             (Rst_n),
    //SD卡接口
    .sd_miso           (sd_miso),
    .sd_clk            (sd_clk),
    .sd_cs             (sd_cs),
    .sd_mosi           (sd_mosi),
    //用户写SD卡接口
    .wr_start_en       (wr_start_en),
//    .wr_sec_addr       (wr_sec_addr),
    .wr_data           (DATA[11:4]),
    .wr_busy           (wr_busy),
    .wr_req            (wr_req),
    //用户读SD卡接口
    .rd_start_en       (rd_start_en),
    .rd_sec_addr       (rd_sec_addr),
    .rd_busy           (rd_busy),
    .rd_val_en         (rd_val_en),
    .rd_val_data       (rd_val_data),    
    
    .sd_init_done      (sd_init_done)
    );
 
	wire init_done;
	wire [7:0]sd_data;
	wire [7:0]wave_data;
											wire req_r;
											wire req_w;
	ctrl_ADC_SD ctrl_ADC_SD(
		.clk(Clk),
		.rest_n(Rst_n),
		.key_w(key_w),
		.key_r(key_r),
		.adc_data(DATA[11:4]),//mid_data_out
		.sd_data(sd_data),
		.wave_data(wave_data),
		.req_w(req_w),
		.req_r(req_r)
	);
	
//	//led警示 
//	led_alarm #(
//    .L_TIME      (25'd25_000_000)
//    )  
//   u_led_alarm(
//    .clk            (clk_ref),
//    .rst_n          (rst_n),
//    .led            (led),
//    .error_flag     (error_flag)
//    ); 
	
endmodule
