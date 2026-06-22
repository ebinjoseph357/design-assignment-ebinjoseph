`timescale 1ns/1ps

class monitor;
    virtual axi_dma_if vif;
    mailbox #(transaction) mon2scb;
    bit enable = 1; // Control flag to stop the monitor loop safely
    
    function new(virtual axi_dma_if vif, mailbox #(transaction) mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction

    task run();
        transaction dummy_t = new(); 
        // Changed from 'forever' to a clean conditional loop
        while (enable) begin
            @(posedge vif.ACLK);
            if (vif.M_AWVALID && vif.M_AWREADY && vif.M_WVALID && vif.M_WREADY) begin
                mon2scb.put(dummy_t); 
            end
        end
    endtask
endclass
