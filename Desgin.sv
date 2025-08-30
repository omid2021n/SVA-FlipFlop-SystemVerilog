module dff (
              input d,  
              input rst,  
              input clk,  
              output q, qr
);  
  
  
    reg tem_q    = 0;
    reg tem_qr = 1;
  
  
   always @ (posedge clk)  
    begin      
      if (!rst) 
        begin 
          
          tem_q    <= 1'b0;
          tem_qr <= 1'b1;
        end
       else 
         begin
          tem_q    <= d; 
          tem_qr   <= ~d;
         end
    end

 always@(posedge clk)
    begin
      A1: assert (tem_q == ~tem_qr) $info("Action  at %0t",$time);  else $info("Error at %0t", $time);
    end
    
   assign q    = tem_q;
   assign qr   = tem_qr;
  
endmodule 
