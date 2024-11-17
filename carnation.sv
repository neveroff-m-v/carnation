`include "carnation\.sv"

module carnation
(
input				CLK,
input				RST,

input				KEY,

output bit		LED
);

wire click_down;

key key_0 (
.CLK(CLK),
.RST(RST),
.EN('1),
.SIG(KEY),
.click_down(click_down)
);

always_ff @ (posedge CLK)
begin
	// init
	if (RST)
	begin
		LED <= '0;
	end
	
	// tick
	if (~RST)
	begin
		if(click_down)
		begin
			LED <= ~LED;
		end
	end
end

endmodule