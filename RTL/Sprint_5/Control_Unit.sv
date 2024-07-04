module Control_Unit(input logic[6:0] Op, Funct7, input logic[3:0] Funct3, output logic[2:0] ULAControl, output logic ULASrc, regWrite);
    always_comb begin
        case(Op)
            7'b0110011: begin
                case(Funct3)
                    3'b000: begin
                        case(Funct7)
                            7'b0000000: begin
                                regWrite = 1;
                                ULASrc = 0;
                                ULAControl = 3'b000;
                            end
                            7'b0100000: begin
                                regWrite = 1;
                                ULASrc = 0;
                                ULAControl = 3'b001;
                            end
                            default begin
                                regWrite = 0;
                                ULASrc = 0;
                                ULAControl = 3'b000;
                            end
                        endcase
                    end
                    3'b111: begin
                        case(Funct7)
                            7'b0000000: begin
                                regWrite = 1;
                                ULASrc = 0;
                                ULAControl = 3'b010;
                            end
                            default: begin
                                regWrite = 0;
                                ULASrc = 0;
                                ULAControl = 3'b011;
                            end
                        endcase
                    end
                    3'b110: begin
                        case(Funct7)
                            7'b0000000: begin
                                regWrite = 1;
                                ULASrc = 0;
                                ULAControl = 011;
                            end
                            default: begin
                                regWrite = 0;
                                ULASrc = 0;
                                ULAControl = 000;
                            end
                        endcase
                    end
                    3'b010: begin
                        case(Funct7)
                            7'b0000000: begin
                                regWrite = 1;
                                ULASrc = 0;
                                ULAControl = 101;
                            end
                            default: begin
                                regWrite = 0;
                                ULASrc = 0;
                                ULAControl = 000;
                            end
                        endcase
                    end
                    default begin
                            regWrite = 0;
                            ULASrc = 0;
                            ULAControl = 000;
                    end
                endcase
            end
            7'b0010011: begin
                case(Funct3)
                    3'b000: begin
                        regWrite = 1;
                        ULASrc = 1;
                        ULAControl = 000;
                    end
                    default: begin
                        regWrite = 0;
                        ULASrc = 0;
                        ULAControl = 000;
                    end
                endcase
            end
            default: begin
                regWrite = 0;
                ULASrc = 0;
                ULAControl = 000;
            end
        endcase
    end
endmodule