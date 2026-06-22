`timescale 1ns/1ps

class environment;

    virtual axi_dma_if vif;
    mailbox #(transaction) mon2scb;
    
    agent      agt;
    scoreboard scb;

    function new(virtual axi_dma_if vif);
        this.vif = vif;
        mon2scb  = new();
        agt      = new(vif, mon2scb);
        scb      = new(mon2scb);
    endfunction

    task run();
        fork
            agt.run();
            scb.main();
        join_any
    endtask

endclass
