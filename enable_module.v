<<<<<<< HEAD
module enable_module (
    input E, 
    input [7:0] a_in, b_in,         // Gom 8 bit vào một bus
    output [7:0] a_out, b_out       // Đầu ra cũng là bus 8-bit
);

    assign a_out = (E == 1'b1) ? a_in : 8'b0;
    assign b_out = (E == 1'b1) ? b_in : 8'b0;

=======
module enable_module (
    input E, 
    input [7:0] a_in, b_in,         // Gom 8 bit vào một bus
    output [7:0] a_out, b_out       // Đầu ra cũng là bus 8-bit
);

    assign a_out = (E == 1'b1) ? a_in : 8'b0;
    assign b_out = (E == 1'b1) ? b_in : 8'b0;

>>>>>>> c7fdf456cf3266cb8c1a2771de77788b270bcffe
endmodule