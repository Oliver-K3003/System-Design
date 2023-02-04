`timescale 1ns/10ps

module busEncoder(input wire [31:0] in, /*input en,*/ output reg [4:0] out);
	always @(in /*or en*/)
	/*begin
		if(en==1)*/
			begin
				case(in)
					//all connections past 23 can be used for other things if needed
					32'h00000001 : out <= 5'd0;   
         			32'h00000002 : out <= 5'd1;     
	 				32'h00000004 : out <= 5'd2;      
					32'h00000008 : out <= 5'd3;     
					32'h00000010 : out <= 5'd4;     
					32'h00000020 : out <= 5'd5;      
					32'h00000040 : out <= 5'd6;    
					32'h00000080 : out <= 5'd7;     
					32'h00000100 : out <= 5'd8;     
					32'h00000200 : out <= 5'd9;      
					32'h00000400 : out <= 5'd10;    
					32'h00000800 : out <= 5'd11;   
					32'h00001000 : out <= 5'd12;    
					32'h00002000 : out <= 5'd13;  
					32'h00004000 : out <= 5'd14; 
					32'h00008000 : out <= 5'd15; 
	 				32'h00010000 : out <= 5'd16;     
					32'h00020000 : out <= 5'd17;     
					32'h00040000 : out <= 5'd18;  
					32'h00080000 : out <= 5'd19;   
					32'h00100000 : out <= 5'd20;     
					32'h00200000 : out <= 5'd21;    
					32'h00400000 : out <= 5'd22; 
					32'h00800000 : out <= 5'd23;
					//default value if nothing is selected     
	  				default: out <= 5'd31;
				endcase
			end
			//high impedance fallthrough if the encoder enable is zero
		/*else	out=5'bzzzzz;*/
	//end
endmodule
