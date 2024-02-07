
module detect_machine(
input x,
input clk,
input rst, 
output reg y);
reg [3:0] q;
wire [3:0] Q;
wire Y;
reg [1:0] lock_a, lock_b; 
initial 
begin 
    q= 4'b0; lock_a = 0; lock_b= 0; 
end
assign Q[3] = (~x & q[2] & ~q[1] & ~q[0]) | (~x & q[2] & q[1] & q[0]) | (~x & q[3]);
assign Q[2] = (~x & ~q[3] & ~q[2] & ~q[1] & ~q[0]) | (~x & ~q[2] & q[1] & q[0]) | (~x & q[2] & ~q[1] & q[0]) | (~x & q[2] & q[1] & ~q[0]);
assign Q[1] = (~x & ~q[1] & q[0]) | (~x & q[1] & ~q[0]);
assign Q[0] = (~q[3] & ~q[2] & ~q[0]) | (q[1] & ~q[0]) | (x);
assign Y = (~x & q[1] & q[0]) | (~x & q[2] & ~q[1] & ~q[0]) | (~x & q[3]);
 
always @(posedge clk or posedge rst)
 begin
    if (rst)
        begin 
        lock_a=0;
        lock_b=0;
        q= 4'b0;
        end 
    else
    begin 
        if (lock_a ==2 || lock_b ==2)
            begin 
                y=1'b1;
            end 
        else 
            begin 
             q[3] <= Q[3];
             q[2] <= Q[2];
             q[1] <= Q[1];
             q[0] <= Q[0];
             y <= Y;
            
            if (Q==4'b0011 && x==0)
             begin 
                lock_a=lock_a+1;
             end 
            if (Q==4'b0100 && x==0)
             begin 
                lock_b=lock_b+1;
             end 
            if (Q==4'b0111 && x==0)
             begin 
                lock_b=lock_b+1;
             end 
            if (Q==4'b1000 && x==0)
             begin 
                lock_b=lock_b+1;
             end 
         end 
     end
 end
endmodule