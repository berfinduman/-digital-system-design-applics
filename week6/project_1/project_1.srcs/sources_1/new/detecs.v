module detect(
 input x, clk,
 output reg z
 );
 reg [3:0] state ;
 reg [3:0] next_state ;
 
 initial begin
 state = 4'b0000;
 next_state = 4'b0000;
 end
 
 always @(posedge clk) begin
 state <= next_state;
 end
 
 always @(state, x) begin
 case(state)
 4'b0000 : begin
 if (x == 1)begin
 z <= 1'b0;
 next_state <= 4'b0001;
 end
else begin
z <= 1'b0;
 next_state <= 4'b0000;
 end
 end
 4'b0001 : begin
 if (x == 1) begin
 z <= 1'b0;
 next_state <= 4'b0000;
 end
 else begin
 z <= 1'b0;
 next_state <= 4'b0010;
 end
 end
 4'b0010 : begin
 if (x == 1) begin
 z <= 1'b0;
 next_state <= 4'b0111;
 end
else begin
 z <= 1'b0;
 next_state <= 4'b0011;
 end
 end
 4'b0011 : begin
 if (x == 1) begin
 z <= 1'b0;
 next_state <= 4'b0100;
 end
else begin
 z <= 1'b0;
 next_state <= 4'b0000;
 end
 end
 4'b0100 : begin
 if (x == 1) begin
 z <= 1'b0;
 next_state <= 4'b0000;
 end
else begin
 z <= 1'b0;
 next_state <= 4'b0101;
 end
 end
 4'b0101 : begin
 if (x == 1) begin
 z <= 1'b0;
 next_state <= 4'b0111;
 end
else begin
 z <= 1'b1;
 next_state <= 4'b0011;
 end
 end
 4'b0111 : begin
 if (x == 1) begin
z <= 1'b0;
 next_state <= 4'b1000;
 end
else begin
 z <= 1'b0;
 next_state <= 4'b0010;
 end
 end
 4'b1000 : begin
 if (x == 1) begin
 z <= 1'b0;
 next_state <= 4'b0000;
 end
else begin
 z <= 1'b0;
 next_state <= 4'b1001;
 end
 end
 4'b1001 : begin
 if (x == 1)begin
 z <= 1'b1;
 next_state <= 4'b0111;
 end
 else begin
 z <= 1'b0;
 next_state <= 4'b0011;
 end
 end 
 endcase
 end
endmodule