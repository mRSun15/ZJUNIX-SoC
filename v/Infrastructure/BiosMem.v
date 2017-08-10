`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/01/26 21:47:51
// Design Name: 
// Module Name: BiosMem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: A UART-reprogrammable memory, size = 16KiB(4096 words)
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module BiosMem(
	input clka, input [11:0] addra, input [31:0] dina,
	input [3:0] wea, input ena, output reg [31:0] douta,
	input clkb, input [11:0] addrb, input [31:0] dinb,
	input [3:0] web, input enb, output reg [31:0] doutb,
	input clkProg, input uartRx, input progEN
);
	
	reg [31:0] data[0:4095];
	
	wire _enb;
	wire [3:0] _web;
	wire [11:0] _addrb;
	wire [31:0] _dinb;
	wire [7:0] uartData;
	wire uartReady;
	
	always @ (posedge clka)
	if(ena)
	begin
		if(wea[0]) data[addra][ 7: 0] = dina[ 7: 0];
		if(wea[1]) data[addra][15: 8] = dina[15: 8];
		if(wea[2]) data[addra][23:16] = dina[23:16];
		if(wea[3]) data[addra][31:24] = dina[31:24];
		douta <= data[addra];
	end
	
	always @ (posedge clkb)
	if(_enb)
	begin
		if(_web[0]) data[_addrb][ 7: 0] = _dinb[ 7: 0];
		if(_web[1]) data[_addrb][15: 8] = _dinb[15: 8];
		if(_web[2]) data[_addrb][23:16] = _dinb[23:16];
		if(_web[3]) data[_addrb][31:24] = _dinb[31:24];
		doutb <= data[_addrb];
	end
	
	initial
		$readmemh("../../coe/bootstrap.hex", data);

	UART_R U0(.clk(clkProg), .Rx(uartRx), .dout(uartData), .ready(uartReady), .busy());
	ReprogInterface #(.ADDR_WIDTH(12)) U1(.clkMem(clkb),
		.progData(uartData), .progClk(uartReady), .progEn(progEN),
		.addrIn(addrb), .dataIn(dinb), .weIn(web), .enIn(enb),
		.addrOut(_addrb), .dataOut(_dinb), .weOut(_web), .enOut(_enb));

endmodule
