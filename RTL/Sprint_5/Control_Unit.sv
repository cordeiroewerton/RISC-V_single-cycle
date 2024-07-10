module Control_Unit(input logic[6:0] Op, Funct7, input logic[3:0] Funct3, output logic[2:0] ULAControl, output logic ULASrc, regWrite, ImmSrc, MemWrite, ResultSrc);
    always_comb begin
        case(Op)
            7'b0110011: begin
                case(Funct3)
                    3'b000: begin // ADD e SUB
                        case(Funct7)
                            7'b0000000: begin //ADD
                                regWrite = 1;
                                ULASrc = 0;
                                ULAControl = 3'b000;
                                MemWrite = 0;
                                ResultSrc = 0;
                            end
                            7'b0100000: begin // SUB
                                regWrite = 1;
                                ULASrc = 0;
                                ULAControl = 3'b001;
                                MemWrite = 0;
                                ResultSrc = 0;
                            end
                            default begin
                                regWrite = 0;
                                ULASrc = 0;
                                ULAControl = 3'b000;
                                MemWrite = 0;
                                ResultSrc = 0;
                            end
                        endcase
                    end
                    3'b111: begin // AND
                        case(Funct7)
                            7'b0000000: begin 
                                regWrite = 1;
                                ULASrc = 0;
                                ULAControl = 3'b010;
                                MemWrite = 0;
                                ResultSrc = 0;
                            end
                            default: begin
                                regWrite = 0;
                                ULASrc = 0;
                                ULAControl = 3'b000;
                                MemWrite = 0;
                                ResultSrc = 0;
                            end
                        endcase
                    end
                    3'b110: begin // OR
                        case(Funct7)
                            7'b0000000: begin
                                regWrite = 1;
                                ULASrc = 0;
                                ULAControl = 3'b011;
                                MemWrite = 0;
                                ResultSrc = 0;
                            end
                            default: begin
                                regWrite = 0;
                                ULASrc = 0;
                                ULAControl = 3'b000;
                                MemWrite = 0;
                                ResultSrc = 0;
                            end
                        endcase
                    end
                    3'b010: begin // SLT
                        case(Funct7)
                            7'b0000000: begin
                                regWrite = 1;
                                ULASrc = 0;
                                ULAControl = 3'b101;
                                MemWrite = 0;
                                ResultSrc = 0;
                            end
                            default: begin
                                regWrite = 0;
                                ULASrc = 0;
                                ULAControl = 3'b000;
                                MemWrite = 0;
                                ResultSrc = 0;
                            end
                        endcase
                    end
                    default begin
                            regWrite = 0;
                            ULASrc = 0;
                            ULAControl = 3'b000;
                            MemWrite = 0;
                            ResultSrc = 0;
                    end
                endcase
            end
            7'b0010011: begin // ADDi
                case(Funct3)
                    3'b000: begin
                        regWrite = 1;
                        ULASrc = 1;
                        ULAControl = 3'b000;
                        MemWrite = 0;
                        ResultSrc = 0;
                    end
                    default: begin
                        regWrite = 0;
                        ULASrc = 0;
                        ULAControl = 3'b000;
                        MemWrite = 0;
                        ResultSrc = 0;
                    end
                endcase
            end
            7'b0000011: begin // LB
                case(Funct3)
                    3'b000: begin
                        regWrite = 1;
                        ImmSrc = 0;
                        ULASrc = 1;
                        ULAControl = 3'b000;
                        MemWrite = 0;
                        ResultSrc = 1;
                    end
                    default: begin
                        regWrite = 0;
                        ULASrc = 0;
                        ULAControl = 3'b000;
                        MemWrite = 0;
                        ResultSrc = 0;
                    end
                endcase
            end
            7'b0000011: begin // SB
                case(Funct3)
                    3'b000: begin
                        regWrite = 0;
                        ImmSrc = 1;
                        ULASrc = 1;
                        ULAControl = 3'b000;
                        MemWrite = 1;
                        ResultSrc = X;
                    end
                    default: begin
                        regWrite = 0;
                        ULASrc = 0;
                        ULAControl = 3'b000;
                        MemWrite = 0;
                        ResultSrc = 0;
                    end
                endcase
            end
            default: begin // Default
                regWrite = 0;
                ULASrc = 0;
                ULAControl = 3'b000;
                MemWrite = 0;
                ResultSrc = 0;
            end
        endcase
    end
endmodule