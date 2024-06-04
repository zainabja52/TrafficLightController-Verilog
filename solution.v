module traffic_light_controller (
  input clk,
  input reset,
  input go,
  output reg [1:0] highway_signal_1,
  output reg [1:0] highway_signal_2,
  output reg [1:0] farm_signal_1,
  output reg [1:0] farm_signal_2
);

typedef enum { S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17 } all_states;

// Create a state machine that defines the transitions between these states
all_states state, next_state;

// Create a counter to track the elapsed time in each state
reg [4:0] counter;

always @(posedge clk or negedge reset) begin
if (~reset) begin
    state <= S0;
    counter <= 0;
  end 
else if (go && reset) 
	begin
    // Update the state and counter based on the current state and elapsed time
    case (state)
		
      S0: begin
        if (counter == 5'd1) begin
          next_state = S1;
          counter <= 1;
        end 
		else begin
          next_state = S0;
          counter <= counter + 1;
        end
      end
	  
      S1: begin
        if (counter == 5'd2) begin
          next_state = S2;
          counter <= 1;
        end 
	  else begin
          next_state = S1;
          counter <= counter + 1;
        end
      end
	  
	  S2: begin
        if (counter == 5'd30) begin
          next_state = S3;
          counter <= 1;
        end 
	  else begin
          next_state = S2;
          counter <= counter + 1;
        end
      end 
	  
	  S3: begin
        if (counter == 5'd2) begin
          next_state = S4;
          counter <= 1;
        end 
	  else begin
          next_state = S3;
          counter <= counter + 1;
        end
      end  
	  
	  S4: begin
        if (counter == 5'd10) begin
          next_state = S5;
          counter <= 1;
        end 
	  else begin
          next_state = S4;
          counter <= counter + 1;
        end
      end
	  
	  S5: begin
        if (counter == 5'd2) begin
          next_state = S6;
          counter <= 1;
        end 
	  else begin
          next_state = S5;
          counter <= counter + 1;
        end
      end
	  
	  S6: begin
        if (counter == 5'd1) begin
          next_state = S7;
          counter <= 1;
        end 
	  else begin
          next_state = S6;
          counter <= counter + 1;
        end
      end
	  
	  S7: begin
        if (counter == 5'd2) begin
          next_state = S8;
          counter <= 1;
        end 
	  else begin
          next_state = S7;
          counter <= counter + 1;
        end
      end 
	  
	  S8: begin
        if (counter == 5'd15) begin
          next_state = S9;
          counter <= 1;
        end 
	  else begin
          next_state = S8;
          counter <= counter + 1;
        end
      end
	  
	  S9: begin
        if (counter == 5'd2) begin
          next_state = S10;
          counter <= 1;
        end 
	  else begin
          next_state = S9;
          counter <= counter + 1;
        end
      end
	  
	   S10: begin
        if (counter == 5'd5) begin
          next_state = S11;
          counter <= 1;
        end 		  
	  else begin
          next_state = S10;
          counter <= counter + 1;
        end
      end
	  
	   S11: begin
        if (counter == 5'd2) begin
          next_state = S12;
          counter <= 1;
        end 
	  else begin
          next_state = S11;
          counter <= counter + 1;
        end
      end 
	  
	   S12: begin
        if (counter == 5'd10) begin
          next_state = S13;
          counter <= 1;
        end 
	  else begin
          next_state = S12;
          counter <= counter + 1;
        end
      end
	  
	  S13: begin
        if (counter == 5'd2) begin
          next_state = S14;
          counter <= 1;
        end 
	  else begin
          next_state = S13;
          counter <= counter + 1;
        end
      end 
	  
	  S14: begin
        if (counter == 5'd1) begin
          next_state = S15;
          counter <=1;
        end 		  
	  else begin
          next_state = S14;
          counter <= counter + 1;
        end
      end
	  
	  S15: begin
        if (counter == 5'd2) begin
          next_state = S16;
          counter <= 1;
        end 
	  else begin
          next_state = S15;
          counter <= counter + 1;
        end
      end
	  
	  S16: begin
        if (counter == 5'd15) begin
          next_state = S17;
          counter <= 1;
        end 
	  else begin
          next_state = S16;
          counter <= counter + 1;
        end
      end
	  
	  S17: begin
  		if (counter == 5'd3) begin
    		next_state = S0;
    		counter <= 1;
  		end
	  else begin
    		next_state = S17;
    		counter <= counter + 1;
  		end
	  end

    endcase
end 
else 
	begin  // If go is forced to 0, freeze the state and counter
    
    next_state = state;
    counter <= counter;
	
    end
  state <= next_state;
end	 


// Write code to set the outputs of the state machine based on the current state
always_comb begin
  case (state)
S0: begin
    highway_signal_1 = 2'b10;
    highway_signal_2 = 2'b10;
    farm_signal_1 = 2'b10;
    farm_signal_2 = 2'b10;
end
	
S1: begin
      highway_signal_1 = 2'b11;
      highway_signal_2 = 2'b11;
      farm_signal_1 = 2'b10;
      farm_signal_2 = 2'b10;
end	

S2: begin
	highway_signal_1 = 2'b00;
	highway_signal_2 = 2'b00;
	farm_signal_1 = 2'b10;
	farm_signal_2 = 2'b10;
end	 
	
S3: begin
      highway_signal_1 = 2'b00;
      highway_signal_2 = 2'b01;
      farm_signal_1 = 2'b10;
      farm_signal_2 = 2'b10;
end
	
S4: begin
	highway_signal_1 = 2'b00;
	highway_signal_2 = 2'b10;
	farm_signal_1 = 2'b10;
	farm_signal_2 = 2'b10;
end
	
S5: begin
  highway_signal_1 = 2'b01;
  highway_signal_2 = 2'b10;
  farm_signal_1 = 2'b10;
  farm_signal_2 = 2'b10;
end

S6: begin
  highway_signal_1 = 2'b10;
  highway_signal_2 = 2'b10;
  farm_signal_1 = 2'b10;
  farm_signal_2 = 2'b10;
end

S7: begin
  highway_signal_1 = 2'b10;
  highway_signal_2 = 2'b10;
  farm_signal_1 = 2'b11;
  farm_signal_2 = 2'b11;
end

S8: begin
  highway_signal_1 = 2'b10;
  highway_signal_2 = 2'b10;
  farm_signal_1 = 2'b00;
  farm_signal_2 = 2'b00;
end

S9: begin
  highway_signal_1 = 2'b10;
  highway_signal_2 = 2'b10;
  farm_signal_1 = 2'b00;
  farm_signal_2 = 2'b01;
end

S10: begin
  highway_signal_1 = 2'b10;
  highway_signal_2 = 2'b10;
  farm_signal_1 = 2'b00;
  farm_signal_2 = 2'b10;
end

S11: begin
  highway_signal_1 = 2'b10;
  highway_signal_2 = 2'b10;
  farm_signal_1 = 2'b01;
  farm_signal_2 = 2'b11;
end

S12: begin
  highway_signal_1 = 2'b10;
  highway_signal_2 = 2'b10;
  farm_signal_1 = 2'b10;
  farm_signal_2 = 2'b00;
end

S13: begin
  highway_signal_1 = 2'b10;
  highway_signal_2 = 2'b10;
  farm_signal_1 = 2'b10;
  farm_signal_2 = 2'b01;
end

S14: begin
  highway_signal_1 = 2'b10;
  highway_signal_2 = 2'b10;
  farm_signal_1 = 2'b10;
  farm_signal_2 = 2'b10;
end

S15: begin
  highway_signal_1 = 2'b10;
  highway_signal_2 = 2'b11;
  farm_signal_1 = 2'b10;
  farm_signal_2 = 2'b10;
end

S16: begin
  highway_signal_1 = 2'b10;
  highway_signal_2 = 2'b00;
  farm_signal_1 = 2'b10;
  farm_signal_2 = 2'b10;
end

S17: begin
  highway_signal_1 = 2'b10;
  highway_signal_2 = 2'b01;
  farm_signal_1 = 2'b10;
  farm_signal_2 = 2'b10;
end
    
  endcase
end
endmodule 


// test go 
module testing();
reg clk;
reg reset;
reg go;
wire [1:0] highway_signal_1;
wire [1:0] highway_signal_2;
wire [1:0] farm_signal_1;
wire [1:0] farm_signal_2;
// Instantiate the design 
traffic_light_controller my_controller (.clk(clk),.reset(reset),.go(go),.highway_signal_1(highway_signal_1),.highway_signal_2(highway_signal_2),.farm_signal_1(farm_signal_1),.farm_signal_2(farm_signal_2));	 
initial begin
  // Initialize input signals
  reset = 0;
  go = 0;
  clk=0;
  #20;
  reset = 1;
  go = 1;  
  forever begin
    #5;
    clk = ~clk;
  end   
end

initial begin
  #30;
  $display("Time S0: %t,GO = %d , highwaySignal1: %b, highwaySignal2: %b, farmSignal1: %b, farmSignal2: %b", $time,go,highway_signal_1, highway_signal_2, farm_signal_1, farm_signal_2);
  #10;
  $display("Time S1: %t,GO = %d , highwaySignal1: %b, highwaySignal2: %b, farmSignal1: %b, farmSignal2: %b", $time,go,highway_signal_1, highway_signal_2, farm_signal_1, farm_signal_2); 
  #20;
  go=0;
  $display("Time S2: %t,GO = %d , highwaySignal1: %b, highwaySignal2: %b, farmSignal1: %b, farmSignal2: %b", $time,go,highway_signal_1, highway_signal_2, farm_signal_1, farm_signal_2);
  #300;
  $display("Time S3: %t,GO = %d , highwaySignal1: %b, highwaySignal2: %b, farmSignal1: %b, farmSignal2: %b", $time,go,highway_signal_1, highway_signal_2, farm_signal_1, farm_signal_2);
  #20;
  #400 $finish;
end

endmodule


module traffic_light_controller_tb();

reg clk;
reg reset;
reg go;

wire [1:0] highway_signal_1;
wire [1:0] highway_signal_2;
wire [1:0] farm_signal_1;
wire [1:0] farm_signal_2;

// Instantiate the design 
traffic_light_controller my_controller (.clk(clk),.reset(reset),.go(go),.highway_signal_1(highway_signal_1),.highway_signal_2(highway_signal_2),
  .farm_signal_1(farm_signal_1),.farm_signal_2(farm_signal_2));
 	 
initial begin
  // Initialize input signals
  reset = 0;
  go = 0;
  clk=0;

  // Wait for some time to allow the design to reset
  #20;
  
  // Start the test
  reset = 1;
  go = 1;
  
  // Create a clock signal
  forever begin
    #5;
    clk = ~clk;
  end  
  
end	

// Test cases
always begin
	
	#30;
  // Assert that the output values are correct for state S0
  assert(highway_signal_1 == 2'b10 && highway_signal_2 == 2'b10 && farm_signal_1 == 2'b10 && farm_signal_2 == 2'b10)
  		$display("Time: %t, highwaySignal1: %b, highwaySignal2: %b, farmSignal1: %b, farmSignal2: %b", $time,highway_signal_1, highway_signal_2, farm_signal_1, farm_signal_2);
  else begin  
    $display("Assertion failed: output values are incorrect for state S0");
   	 $finish;
  end
  
  #10;
    // Assert that the output values are correct for state S1
  assert(highway_signal_1 == 2'b11 && highway_signal_2 == 2'b11 && farm_signal_1 == 2'b10 && farm_signal_2 == 2'b10)
	$display("Time: %t, highwaySignal1: %b, highwaySignal2: %b, farmSignal1: %b, farmSignal2: %b", $time,highway_signal_1, highway_signal_2, farm_signal_1, farm_signal_2);
	else begin
    $display("Assertion failed: output values are incorrect for state S1");
     $finish;
  end

  #20;
  // Assert that the output values are correct for state S2
  assert(highway_signal_1 == 2'b00 && highway_signal_2 == 2'b00 && farm_signal_1 == 2'b10 && farm_signal_2 == 2'b10) 
$display("Time: %t, highwaySignal1: %b, highwaySignal2: %b, farmSignal1: %b, farmSignal2: %b", $time,highway_signal_1, highway_signal_2, farm_signal_1, farm_signal_2);
  else begin
    $display("Assertion failed: output values are incorrect for state S2");
  	  $finish;
  end

  #300;
  
  // Assert that the output values are correct for state S3
  assert(highway_signal_1 == 2'b00 && highway_signal_2 == 2'b01 && farm_signal_1 == 2'b10 && farm_signal_2 == 2'b10) 
  $display("Time: %t, highwaySignal1: %b, highwaySignal2: %b, farmSignal1: %b, farmSignal2: %b", $time, highway_signal_1, highway_signal_2, farm_signal_1, farm_signal_2);
  else begin
    $display("Assertion failed: output values are incorrect for state S3");
		$finish;
  end

  #20;

  // Assert that the output values are correct for state S4
  assert(highway_signal_1 == 2'b00 && highway_signal_2 == 2'b10 && farm_signal_1 == 2'b10 && farm_signal_2 == 2'b10)
  $display("Time: %t, highwaySignal1: %b, highwaySignal2: %b, farmSignal1: %b, farmSignal2: %b", $time, highway_signal_1, highway_signal_2, farm_signal_1, farm_signal_2);
  else begin
    $display("Assertion failed: output values are incorrect for state S4");
		$finish;
  end

  #100;
 
  // Assert that the output values are correct for state S5
  assert(highway_signal_1 == 2'b01 && highway_signal_2 == 2'b10 && farm_signal_1 == 2'b10 && farm_signal_2 == 2'b10) 
  $display("Time: %t, highwaySignal1: %b, highwaySignal2: %b, farmSignal1: %b, farmSignal2: %b", $time, highway_signal_1, highway_signal_2, farm_signal_1, farm_signal_2);
  else begin
    $display("Assertion failed: output values are incorrect for state S5");
		$finish;
  end

  #20;

  // Assert that the output values are correct for state S6
  assert(highway_signal_1 == 2'b10 && highway_signal_2 == 2'b10 && farm_signal_1 == 2'b10 && farm_signal_2 == 2'b10) 
  $display("Time: %t, highwaySignal1: %b, highwaySignal2: %b, farmSignal1: %b, farmSignal2: %b", $time,highway_signal_1, highway_signal_2, farm_signal_1, farm_signal_2);
  else begin
    $display("Assertion failed: output values are incorrect for state S6");
    	$finish;
  end

 #10;
  // Assert that the output values are correct for state S7
  assert(highway_signal_1 == 2'b10 && highway_signal_2 == 2'b10 && farm_signal_1 == 2'b11 && farm_signal_2 == 2'b11) 
  $display("Time: %t, highwaySignal1: %b, highwaySignal2: %b, farmSignal1: %b, farmSignal2: %b", $time,highway_signal_1, highway_signal_2, farm_signal_1, farm_signal_2);
  else begin
    $display("Assertion failed: output values are incorrect for state S7");
   	   $finish;
  end

 #20;
 
  // Assert that the output values are correct for state S8
  assert(highway_signal_1 == 2'b10 && highway_signal_2 == 2'b10 && farm_signal_1 == 2'b00 && farm_signal_2 == 2'b00) 
  $display("Time: %t, highwaySignal1: %b, highwaySignal2: %b, farmSignal1: %b, farmSignal2: %b", $time,highway_signal_1, highway_signal_2, farm_signal_1, farm_signal_2);
  else begin
    $display("Assertion failed: output values are incorrect for state S8");
     $finish;
  end

   #150;

  // Assert that the output values are correct for state S9
  assert(highway_signal_1 == 2'b10 && highway_signal_2 == 2'b10 && farm_signal_1 == 2'b00 && farm_signal_2 == 2'b01) 
  $display("Time: %t, highwaySignal1: %b, highwaySignal2: %b, farmSignal1: %b, farmSignal2: %b", $time,highway_signal_1, highway_signal_2, farm_signal_1, farm_signal_2);
  else begin
    $display("Assertion failed: output values are incorrect for state S9");
  	 $finish;
  end

   #20;

  // Assert that the output values are correct for state S10
  assert(highway_signal_1 == 2'b10 && highway_signal_2 == 2'b10 && farm_signal_1 == 2'b00 && farm_signal_2 == 2'b10) 
  $display("Time: %t, highwaySignal1: %b, highwaySignal2: %b, farmSignal1: %b, farmSignal2: %b", $time,highway_signal_1, highway_signal_2, farm_signal_1, farm_signal_2);
  else begin
    $display("Assertion failed: output values are incorrect for state S10");
   			 $finish;
  end	
  
  	 #50;

  // Assert that the output values are correct for state S11
  assert(highway_signal_1 == 2'b10 && highway_signal_2 == 2'b10 && farm_signal_1 == 2'b01 && farm_signal_2 == 2'b11) 
  $display("Time: %t, highwaySignal1: %b, highwaySignal2: %b, farmSignal1: %b, farmSignal2: %b", $time,highway_signal_1, highway_signal_2, farm_signal_1, farm_signal_2);
  else begin
    $display("Assertion failed: output values are incorrect for state S11"); 
		$finish;
  end
	#20;

  // Assert that the output values are correct for state S12
  assert(highway_signal_1 == 2'b10 && highway_signal_2 == 2'b10 && farm_signal_1 == 2'b10 && farm_signal_2 == 2'b00) 
  $display("Time: %t, highwaySignal1: %b, highwaySignal2: %b, farmSignal1: %b, farmSignal2: %b", $time,highway_signal_1, highway_signal_2, farm_signal_1, farm_signal_2);
  else begin
    $display("Assertion failed: output values are incorrect for state S12");
    	   $finish;
  end

  #100;

  // Assert that the output values are correct for state S13
  assert(highway_signal_1 == 2'b10 && highway_signal_2 == 2'b10 && farm_signal_1 == 2'b10 && farm_signal_2 == 2'b01) 
  $display("Time: %t, highwaySignal1: %b, highwaySignal2: %b, farmSignal1: %b, farmSignal2: %b", $time,highway_signal_1, highway_signal_2, farm_signal_1, farm_signal_2);
  else begin
    $display("Assertion failed: output values are incorrect for state S13");
   		  $finish;
  end

  #20;

  // Assert that the output values are correct for state S14
  assert(highway_signal_1 == 2'b10 && highway_signal_2 == 2'b10 && farm_signal_1 == 2'b10 && farm_signal_2 == 2'b10) 
  $display("Time: %t, highwaySignal1: %b, highwaySignal2: %b, farmSignal1: %b, farmSignal2: %b", $time,highway_signal_1, highway_signal_2, farm_signal_1, farm_signal_2);
  else begin
    $display("Assertion failed: output values are incorrect for state S14");
       $finish;
  end

  #10;

  // Assert that the output values are correct for state S15
  assert(highway_signal_1 == 2'b10 && highway_signal_2 == 2'b11 && farm_signal_1 == 2'b10 && farm_signal_2 == 2'b10) 
  $display("Time: %t, highwaySignal1: %b, highwaySignal2: %b, farmSignal1: %b, farmSignal2: %b", $time,highway_signal_1, highway_signal_2, farm_signal_1, farm_signal_2);
  else begin
    $display("Assertion failed: output values are incorrect for state S15");
    		   $finish;
  end

  #20;

  // Assert that the output values are correct for state S16
  assert(highway_signal_1 == 2'b10 && highway_signal_2 == 2'b00 && farm_signal_1 == 2'b10 && farm_signal_2 == 2'b10) 
  $display("Time: %t, highwaySignal1: %b, highwaySignal2: %b, farmSignal1: %b, farmSignal2: %b", $time,highway_signal_1, highway_signal_2, farm_signal_1, farm_signal_2);
  else begin
    $display("Assertion failed: output values are incorrect for state S16");
					   $finish;
  end
   #150;

  // Assert that the output values are correct for state S17
  assert(highway_signal_1 == 2'b10 && highway_signal_2 == 2'b01 && farm_signal_1 == 2'b10 && farm_signal_2 == 2'b10) 
  $display("Time: %t, highwaySignal1: %b, highwaySignal2: %b, farmSignal1: %b, farmSignal2: %b", $time,highway_signal_1, highway_signal_2, farm_signal_1, farm_signal_2);
  else begin
    $display("Assertion failed: output values are incorrect for state S17");
   		 $finish;
  end
  #2000 $finish;
end
endmodule