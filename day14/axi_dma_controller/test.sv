`timescale 1ns/1ps

// ============================================================================
// BASE TEST CLASS
// ============================================================================
class test;
    environment env;

    function new(virtual axi_dma_if vif);
        env = new(vif);
    endfunction

    virtual task run();
        env.run();
        
        wait(env.agt.gen.ended.triggered);
        wait(env.agt.gen2driv.num() == 0);
        #100; 
        
        env.agt.mon.enable = 0;
        env.scb.enable     = 0;
        
        env.scb.print_stats();
    endtask
endclass


// ============================================================================
// TEST CASE 1: 16-Bit Normal Transfers Only
// ============================================================================
class test_16bit_normal extends test;

    function new(virtual axi_dma_if vif);
        super.new(vif);
    endfunction

    virtual task run();
        $display("=================================================");
        $display("     TEST CASE 1: STARTING 16-BIT NORMAL RUN     ");
        $display("=================================================");
        
        env.agt.gen.transaction_count = 5; 
        env.agt.gen.force_mode        = 0;  // Force Normal Mode
        env.agt.gen.force_size        = 16; // Force 16-bit size

        super.run(); 
    endtask
endclass


// ============================================================================
// TEST CASE 2: Scatter-Gather Transfers Only
// ============================================================================
class test_scatter_gather extends test;

    function new(virtual axi_dma_if vif);
        super.new(vif);
    endfunction

    virtual task run();
        $display("=================================================");
        $display("     TEST CASE 2: STARTING SCATTER-GATHER RUN    ");
        $display("=================================================");
        
        env.agt.gen.transaction_count = 5; 
        env.agt.gen.force_mode        = 1;  // Force SG Mode
        env.agt.gen.force_size        = -1; // Leave size randomized

        super.run(); 
    endtask
endclass
