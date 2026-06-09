module ripple1(input [3:0]a,[3:0]b,cin,output[3:0]sum,carry

    );
    wire w1,w2,w3;
   
    fulladd1 fa1(a[0],b[0],cin,sum[0],w1);
    fulladd1 fa2(a[1],b[1],w1,sum[1],w2);
    fulladd1 fa3(a[2],b[2],w2,sum[2],w3);
    fulladd1 fa4(a[3],b[3],w3,sum[3],carry);
   
endmodule

