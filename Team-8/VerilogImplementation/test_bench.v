module testbench;

    reg [25:0] p;
    reg [25:0] q;
    reg [25:0] p_;
    reg [25:0] q_;
    reg [25:0] letter;
    wire [25:0] n;
    reg [25:0] e;
    reg [25:0] d;
    wire [25:0] phi;
    wire [25:0] en_letter;
   wire [25:0] de_letter;

    sixteenbitmultiplier m1(p,q,n);
    sixteenbitmultiplier m2(p-26'd1,q-26'd1,phi);
    encryptor en(e,n,letter,en_letter);
    decryptor de(d,n,en_letter,letter,de_letter);

    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0);
    end

    initial begin
       p =26'd5;
       q =26'd7;
       e =26'd5;
       d =26'd5;
       $display("Input letter number (a = 0)      Encrypted text      Decrypted text");
       $display("-------------------------------------------------------------------");
       for(letter =26'd0;letter <26'd26;letter = letter +26'd1)begin
            $display("        %d               %d               %d",letter,en_letter,de_letter);
       end
    end

    initial #400 $finish;

endmodule
