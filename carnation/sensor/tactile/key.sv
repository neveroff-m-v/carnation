module key
(
input				CLK,
input				RST,
input				EN,

input				SIG,

output bit	 		press,
output bit			click_down,
output bit			click_up
);

always_ff @ (posedge CLK)
begin
	// init
	if (RST)
	begin
		press <= '0;
		click_down <= '0;
		click_up <= '0;
	end
	
	// tick
	if (~RST & EN)
	begin
		press <= ~SIG;
		click_down <= ~press & ~SIG;
		click_up <= press & SIG;
	end
end

endmodule
