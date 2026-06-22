`timescale 1ns/1ps

class scoreboard;
    mailbox #(transaction) mon2scb;
    int total_valid_writes = 0;
    bit enable = 1; // Control flag to stop the scoreboard loop safely

    function new(mailbox #(transaction) mon2scb);
        this.mon2scb = mon2scb;
    endfunction

    task run();
        transaction trans;
        while (enable || mon2scb.num() > 0) begin
            // Non-blocking attempt or short wait to prevent a hard lockup
            if (mon2scb.num() > 0) begin
                mon2scb.get(trans);
                total_valid_writes++;
            end else begin
                @(posedge tb_axi_dma.ACLK);
            end
        end
    endtask
    
    function void print_stats();
        $display("-------------------------------------------------");
        $display("[SCOREBOARD] Total Valid AXI Writes to Memory: %0d", total_valid_writes);
        $display("-------------------------------------------------");
    endfunction
endclass
