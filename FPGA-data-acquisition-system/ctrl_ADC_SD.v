/***************************************************
*	Module Name		:	ctrl_ADC_SD		   
*	Target Device	:	EP4CE10F17C8
*	Tool versions	:	Quartus II 13.0
*	Revision		   :	v1.1
*	Description		:  //ADC_SD信源选择
**************************************************/
module ctrl_ADC_SD(
	clk,
	rest_n,
	key_w,
	key_r,
	adc_data,
	sd_data,
	
	wave_data,
	req_w,
	req_r
);

input clk;
input rest_n;
input key_w;
input key_r;
input [7:0]adc_data;
input [7:0]sd_data;

output reg [7:0]wave_data;
output reg req_r;
output reg req_w;


always @(posedge clk)
begin
	if(!rest_n)
		begin
			wave_data <= adc_data;
			req_r <= 0; req_w <= 0;
		end
	else
		begin
	
			if(!key_w)
				begin
					req_w <= ~req_w; req_r <= 0;
					
				end
			else if(!key_r)
				begin
					req_r <= ~req_r; req_w <= 0; 
					
				end
				
			if(req_r)
				wave_data <= sd_data;
			else
				wave_data <= adc_data;

		end

end

endmodule