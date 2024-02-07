`timescale 1ns / 1ps

module HA(input X, Y, output  C_o,S); 
    (* dont_touch="true" *) wire x_wires=X;
    (* dont_touch="true" *) wire y_wires=Y;
    (* dont_touch="true" *) wire Co_wires=C_o;
    (* dont_touch="true" *) wire S_wires=S;
    assign S=X^Y ;
    assign C_o=X&Y;
endmodule

module FA(  input X, Y, C_i, output  C_o, S);
    (* dont_touch="true" *) wire x_wires=X;
    (* dont_touch="true" *) wire y_wires=Y;
    (* dont_touch="true" *) wire Ci_wires=C_i;
    (* dont_touch="true" *) wire Co_wires=C_o;
    (* dont_touch="true" *) wire S_wires=S;
    (* dont_touch="true" *)  wire [2:0] wires;
    HA h_ad1(.X(X), .Y(Y), .C_o(wires[1]), .S(wires[0]));
    HA h_ad2(.X(wires[0]), .Y(C_i), .C_o(wires[2]), .S(S));
    or or1(C_o, wires[1], wires[2]);
endmodule
module RCA(  input C_i,[3:0] X, [3:0] Y,  output  C_o, [3:0] S);
    (* dont_touch="true" *) wire x_wires=X;
    (* dont_touch="true" *) wire y_wires=Y;
    (* dont_touch="true" *) wire Ci_wires=C_i;
    (* dont_touch="true" *) wire Co_wires=C_o;
    (* dont_touch="true" *) wire S_wires=S;
    (* dont_touch="true" *) wire [2:0] wires;
    FA fa1(X[0],Y[0],C_i,wires[0], S[0]);
    FA fa2(X[1],Y[1],wires[0],wires[1], S[1]);
    FA fa3(X[2],Y[2],wires[1],wires[2], S[2]);
    FA fa4(X[3],Y[3],wires[2],C_o, S[3]);

    // assign C_o = wires[0] & wires[2];
endmodule


module parametric_RCA #( parameter size = 8)( input C_i,[size-1:0] X, [size-1:0] Y,   output C_o, [size-1:0] S);
(* dont_touch="true" *) wire x_wires=X;
(* dont_touch="true" *) wire y_wires=Y;
(* dont_touch="true" *) wire Ci_wires=C_i;
(* dont_touch="true" *) wire Co_wires=C_o;
(* dont_touch="true" *) wire S_wires=S;
(* dont_touch="true" *) wire [size:0] wires;
assign wires[0]=C_i;
assign C_o=wires[size];
genvar j; // temp loop variable, used only
 // in the evaluation of the generate blocks
generate
for( j=0; j<size; j=j+1 )
 begin : FA_loop
 FA fa1(X[j],Y[j],wires[j], wires[j+1], S[j]);
 end
endgenerate
endmodule 

module CLA (input C_i,[3:0] X,Y,
  output C_o,[3:0] S);
(* dont_touch="true" *) wire x_wires=X;
(* dont_touch="true" *) wire y_wires=Y;
(* dont_touch="true" *) wire Ci_wires=C_i;
(* dont_touch="true" *) wire Co_wires=C_o;
(* dont_touch="true" *) wire S_wires=S;
(* dont_touch="true" *)   wire [3:0] g_wires;
(* dont_touch="true" *)   wire [3:0] p_wires;
(* dont_touch="true" *)   wire [4:0] c_wires;

  assign c_wires[0] = C_i;
  assign C_o = c_wires[4];

  genvar j;
  generate
    for (j = 0; j < 4; j = j + 1) begin : GandP_loop
      assign g_wires[j] = X[j] & Y[j];
      assign p_wires[j] = X[j] ^ Y[j];
      assign S[j] = p_wires[j] ^ c_wires[j];
      assign c_wires[j + 1] = g_wires[j] | (p_wires[j] & c_wires[j]);
    end
  endgenerate
endmodule
module Add_Sub(input C_i, [3:0] X, [3:0] Y, output C_o, V, [3:0] S);
(* dont_touch="true" *) wire x2_wires=X;
(* dont_touch="true" *) wire y_wires=Y;
(* dont_touch="true" *) wire v_wires=V;
(* dont_touch="true" *) wire Ci_wires=C_i;
(* dont_touch="true" *) wire Co_wires=C_o;
(* dont_touch="true" *) wire S_wires=S;
(* dont_touch="true" *) wire [3:0] x_wires; 
(* dont_touch="true" *) wire [4:0] c_wires; 
assign c_wires[0]=C_i; 
genvar j; // temp loop variable, used only
 // in the evaluation of the generate blocks
generate
for( j=0; j<4; j=j+1 )
 begin : ASCwO
 //and and1(g_wires[j], X[j], Y[j]);
 assign x_wires[j]= Y[j]^ C_i ;
 FA fa1(x_wires[j],X[j],c_wires[j],c_wires[j+1], S[j]); 
 end
endgenerate
assign C_o=c_wires[4];
assign V= c_wires[3]^c_wires[4];
endmodule
