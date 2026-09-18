module flipflop(
    input  wire S,     
    input  wire R,     
    output wire Q,     
    output wire Q_bar  
);

    
    nor Nor0 (Q, S, Q_bar);

    
    nor Nor1 (Q_bar, R, Q);

endmodule
    
