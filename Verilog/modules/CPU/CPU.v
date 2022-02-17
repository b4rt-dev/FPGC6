/*
* B32P CPU
*/

/* Features:
- 5 stage pipeline
    - fetch             FE
    - decode            DE
    - execute           EX
    - memory            MEM
    - write back        WB
*/

module CPU(
    input clk, reset
);

/*
* STALL & FLUSH
*/
wire flush_FE, flush_DE, flush_EX, flush_MEM, flush_WB;
assign flush_FE = 1'b0;
assign flush_DE = 1'b0;
assign flush_EX = 1'b0;
assign flush_MEM = 1'b0;
assign flush_WB = 1'b0;

wire stall_FE, stall_DE, stall_EX, stall_MEM, stall_WB;
assign stall_FE = 1'b0;
assign stall_DE = 1'b0;
assign stall_EX = 1'b0;
assign stall_MEM = 1'b0;
assign stall_WB = 1'b0;

/*
* FETCH (FE)
*/

// Program Counter
reg [31:0]  pc_FE = 32'd0;

wire [31:0] pc4_FE;
assign pc4_FE = pc_FE + 3'd4;

always @(posedge clk) 
begin
    if (stall_FE)
    begin
        pc_FE <= pc_FE;
    end
    else if (jumpc_MEM || jumpr_MEM)
    begin
        pc_FE <= jump_addr_MEM;
    end
    else
    begin
        pc_FE <= pc4_FE;
    end
end


// Instruction Memory
//  should eventually become a memory with variable latency
wire [31:0] instr_FE;

InstrMem instrMem(
.clk(clk), 
.reset(reset),
.addr(pc_FE),
.q(instr_FE)
);


// Pass data from FE to DE

wire [31:0] instr_DE;
Regr #(.N(32)) regr_instr_FE_DE(
.clk(clk),
.hold(stall_FE),
.clear(flush_FE),
.in(instr_FE),
.out(instr_DE)
);


wire [31:0] pc4_DE;
Regr #(.N(32)) regr_pc4_FE_DE(
.clk(clk),
.hold(stall_FE),
.clear(flush_FE),
.in(pc4_FE),
.out(pc4_DE)
);


/*
* DECODE (DE)
*/

// Instruction Decoder
wire [3:0] areg_DE, breg_DE, instrOP_DE;
wire he_DE, oe_DE, sig_DE;

InstructionDecoder instrDec_DE(
.instr(instr_DE),

.instrOP(instrOP_DE),
.aluOP(),

.constAlu(),
.const16(),
.const27(),

.areg(areg_DE),
.breg(breg_DE),
.dreg(),

.he(he_DE),
.oe(oe_DE),
.sig(sig_DE)
);

// Control Unit
wire alu_use_const_DE;
wire push_DE, pop_DE;
wire dreg_we_DE, dreg_we_high_DE;
wire mem_write_DE, mem_read_DE;
wire jumpc_DE, jumpr_DE;
wire getIntID_DE, getPC_DE, loadConst_DE;
ControlUnit controlUnit(
// in
.instrOP        (instrOP_DE),
.he             (he_DE),

// out
.alu_use_const  (alu_use_const_DE),
.push           (push_DE),
.pop            (pop_DE),
.dreg_we        (dreg_we_DE),
.dreg_we_high   (dreg_we_high_DE),
.mem_write      (mem_write_DE),
.mem_read       (mem_read_DE),
.jumpc          (jumpc_DE),
.jumpr          (jumpr_DE),
.getIntID       (getIntID_DE),
.getPC          (getPC_DE),
.loadConst      (loadConst_DE)
);


// Register Bank
wire [3:0] dreg_WB;
wire dreg_we_WB, dreg_we_high_WB;
reg [31:0] data_d_WB;
wire [31:0] data_a_DE, data_b_DE;

Regbank regbank(
.clk(clk),
.reset(reset),

.addr_a(areg_DE),
.addr_b(breg_DE),
.data_a(data_a_DE),
.data_b(data_b_DE),

// from WB stage
.addr_d(dreg_WB),
.data_d(data_d_WB),
.we(dreg_we_WB),
.we_high(dreg_we_high_WB)
);


// Pass data from DE to EX

wire [31:0] instr_EX;
Regr #(.N(32)) regr_instr_DE_EX(
.clk(clk),
.hold(stall_DE),
.clear(flush_DE),
.in(instr_DE),
.out(instr_EX)
);

wire [31:0] data_a_EX, data_b_EX;
Regr #(.N(64)) regr_regdata_DE_EX(
.clk(clk),
.hold(stall_DE),
.clear(flush_DE),
.in({data_a_DE, data_b_DE}),
.out({data_a_EX, data_b_EX})
);

wire [31:0] pc4_EX;
Regr #(.N(32)) regr_pc4_DE_EX(
.clk(clk),
.hold(stall_DE),
.clear(flush_DE),
.in(pc4_DE),
.out(pc4_EX)
);

wire alu_use_const_EX;
wire push_EX, pop_EX;
wire dreg_we_EX, dreg_we_high_EX;
wire mem_write_EX, mem_read_EX;
wire jumpc_EX, jumpr_EX;
wire getIntID_EX, getPC_EX, loadConst_EX;
Regr #(.N(12)) regr_cuflags_DE_EX(
.clk        (clk),
.hold       (stall_DE),
.clear      (flush_DE),
.in         ({alu_use_const_DE, push_DE, pop_DE, dreg_we_DE, dreg_we_high_DE, mem_write_DE, mem_read_DE, jumpc_DE, jumpr_DE, getIntID_DE, getPC_DE, loadConst_DE}),
.out        ({alu_use_const_EX, push_EX, pop_EX, dreg_we_EX, dreg_we_high_EX, mem_write_EX, mem_read_EX, jumpc_EX, jumpr_EX, getIntID_EX, getPC_EX, loadConst_EX})
);


/*
* EXECUTE (EX)
*/

// Instruction Decoder
wire [31:0] alu_const16_EX;
wire [3:0] aluOP_EX;

InstructionDecoder instrDec_EX(
.instr(instr_EX),

.instrOP(),
.aluOP(aluOP_EX),

.constAlu(alu_const16_EX),
.const16(),
.const27(),

.areg(),
.breg(),
.dreg(),

.he(),
.oe(),
.sig()
);


// ALU
wire [31:0] alu_result_EX;

wire[31:0] alu_input_b_EX;
assign alu_input_b_EX = (alu_use_const_EX) ? alu_const16_EX : data_b_EX;

ALU alu(
.opcode(aluOP_EX),
.a(data_a_EX),
.b(alu_input_b_EX),
.y(alu_result_EX)
);


// Pass data from EX to MEM

wire [31:0] instr_MEM;
Regr #(.N(32)) regr_instr_EX_MEM(
.clk(clk),
.hold(stall_EX),
.clear(flush_EX),
.in(instr_EX),
.out(instr_MEM)
);

wire [31:0] data_a_MEM, data_b_MEM;
Regr #(.N(64)) regr_regdata_EX_MEM(
.clk(clk),
.hold(stall_EX),
.clear(flush_EX),
.in({data_a_EX, data_b_EX}),
.out({data_a_MEM, data_b_MEM})
);

wire [31:0] pc4_MEM;
Regr #(.N(32)) regr_pc4_EX_MEM(
.clk(clk),
.hold(stall_EX),
.clear(flush_EX),
.in(pc4_EX),
.out(pc4_MEM)
);

wire push_MEM, pop_MEM;
wire dreg_we_MEM, dreg_we_high_MEM;
wire mem_write_MEM, mem_read_MEM;
wire jumpc_MEM, jumpr_MEM;
wire getIntID_MEM, getPC_MEM, loadConst_MEM;
Regr #(.N(11)) regr_cuflags_EX_MEM(
.clk        (clk),
.hold       (stall_EX),
.clear      (flush_EX),
.in         ({push_EX, pop_EX, dreg_we_EX, dreg_we_high_EX, mem_write_EX, mem_read_EX, jumpc_EX, jumpr_EX, getIntID_EX, getPC_EX, loadConst_EX}),
.out        ({push_MEM, pop_MEM, dreg_we_MEM, dreg_we_high_MEM, mem_write_MEM, mem_read_MEM, jumpc_MEM, jumpr_MEM, getIntID_MEM, getPC_MEM, loadConst_MEM})
);

wire [31:0] alu_result_MEM;
Regr #(.N(32)) regr_alu_result_EX_MEM(
.clk(clk),
.hold(stall_EX),
.clear(flush_EX),
.in(alu_result_EX),
.out(alu_result_MEM)
);

/*
* MEMORY (MEM)
*/


// Instruction Decoder
wire [31:0] const16_MEM;
wire [26:0] const27_MEM;
wire oe_MEM;

InstructionDecoder instrDec_MEM(
.instr(instr_MEM),

.instrOP(),
.aluOP(),

.constAlu(),
.const16(const16_MEM),
.const27(const27_MEM),

.areg(),
.breg(),
.dreg(),

.he(),
.oe(oe_MEM),
.sig()
);


reg [31:0] jump_addr_MEM;


always @(*) 
begin
    jump_addr_MEM <= 32'd0;

    if (jumpc_MEM)
    begin
        if (oe_MEM)
        begin
            // add sign extended to allow negative offsets
            jump_addr_MEM <= pc4_MEM + {{5{const27_MEM[26]}}, const27_MEM[26:0]};
        end
        else
        begin
           jump_addr_MEM <= {5'd0, const27_MEM};
        end
    end

    else if (jumpr_MEM)
    begin
        if (oe_MEM)
        begin
            jump_addr_MEM <= pc4_MEM + (data_b_MEM + const16_MEM);
        end
        else
        begin
            jump_addr_MEM <= data_b_MEM + const16_MEM;
        end
    end
end

// Data Memory
//  should eventually become a memory with variable latency
wire [31:0] dataMem_q_MEM;
wire [31:0] dataMem_addr_MEM;
assign dataMem_addr_MEM = data_a_MEM + const16_MEM;

DataMem dataMem(
.clk(clk),
.addr(dataMem_addr_MEM),
.we(mem_write_MEM),
.data(data_b_MEM),
.q(dataMem_q_MEM)
);

// Stack
wire [31:0] stack_q_MEM;

Stack stack(
.clk(clk),
.reset(reset),
.q(stack_q_MEM),
.d(data_b_MEM),
.push(push_MEM),
.pop(pop_MEM)
);


// Pass data from MEM to WB

wire [31:0] instr_WB;
Regr #(.N(32)) regr_instr_MEM_WB(
.clk(clk),
.hold(stall_WB),
.clear(flush_WB),
.in(instr_MEM),
.out(instr_WB)
);

wire [31:0] alu_result_WB;
Regr #(.N(32)) regr_alu_result_MEM_WB(
.clk(clk),
.hold(stall_MEM),
.clear(flush_MEM),
.in(alu_result_MEM),
.out(alu_result_WB)
);

wire [31:0] stack_q_WB;
Regr #(.N(32)) regr_stack_q_MEM_WB(
.clk(clk),
.hold(stall_MEM),
.clear(flush_MEM),
.in(stack_q_MEM),
.out(stack_q_WB)
);

wire [31:0] pc4_WB;
Regr #(.N(32)) regr_pc4_MEM_WB(
.clk(clk),
.hold(stall_MEM),
.clear(flush_MEM),
.in(pc4_MEM),
.out(pc4_WB)
);

wire [31:0] dataMem_q_WB;
Regr #(.N(32)) regr_dataMem_q_MEM_WB(
.clk(clk),
.hold(stall_MEM),
.clear(flush_MEM),
.in(dataMem_q_MEM),
.out(dataMem_q_WB)
);

wire pop_WB, mem_read_WB;
//wire dreg_we_WB, dreg_we_high_WB;
wire getIntID_WB, getPC_WB, loadConst_WB;
Regr #(.N(7)) regr_cuflags_MEM_WB(
.clk        (clk),
.hold       (stall_MEM),
.clear      (flush_MEM),
.in         ({pop_MEM, dreg_we_MEM, dreg_we_high_MEM, mem_read_MEM, getIntID_MEM, getPC_MEM, loadConst_MEM}),
.out        ({pop_WB, dreg_we_WB, dreg_we_high_WB, mem_read_WB, getIntID_WB, getPC_WB, loadConst_WB})
);

/*
* WRITE BACK (WB)
*/
wire [15:0] const16u_WB;

InstructionDecoder instrDec_WB(
.instr(instr_WB),

.instrOP(),
.aluOP(),

.constAlu(),
.const16(),
.const16u(const16u_WB),
.const27(),

.areg(),
.breg(),
.dreg(dreg_WB),

.he(),
.oe(),
.sig()
);

always @(*) 
begin
    case (1'b1)
        pop_WB:
        begin
            data_d_WB <= stack_q_WB;
        end
        mem_read_WB:
        begin
            data_d_WB <= dataMem_q_WB;
        end
        getIntID_WB:
        begin
            data_d_WB <= 32'd0; // TODO: get interrupt ID
        end
        getPC_WB:
        begin
            data_d_WB <= pc4_WB;
        end
        loadConst_WB:
        begin
            data_d_WB <= const16u_WB;
        end
        default:
        begin
            data_d_WB <= alu_result_WB;
        end
    endcase
end


endmodule