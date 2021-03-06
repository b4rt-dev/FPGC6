/*
* RGB332 to Luma-PhaseSelect-Amplitude lookup table
*/
module RGBtoYPhaseAmpl(
    input [7:0] rgb332, // rrrgggbb
    output reg [7:0] luma,
    output reg [4:0] phase,
    output reg [7:0] ampl
);

always @(*)
case(rgb332)
8'b00000000 : begin luma <= 8'd72; phase <= 5'd5; ampl <= 8'd0; end
8'b00000001 : begin luma <= 8'd79; phase <= 5'd17; ampl <= 8'd19; end
8'b00000010 : begin luma <= 8'd85; phase <= 5'd17; ampl <= 8'd39; end
8'b00000011 : begin luma <= 8'd92; phase <= 5'd17; ampl <= 8'd58; end
8'b00000100 : begin luma <= 8'd87; phase <= 5'd27; ampl <= 8'd11; end
8'b00000101 : begin luma <= 8'd94; phase <= 5'd20; ampl <= 8'd19; end
8'b00000110 : begin luma <= 8'd101; phase <= 5'd19; ampl <= 8'd37; end
8'b00000111 : begin luma <= 8'd108; phase <= 5'd18; ampl <= 8'd56; end
8'b00001000 : begin luma <= 8'd103; phase <= 5'd27; ampl <= 8'd22; end
8'b00001001 : begin luma <= 8'd110; phase <= 5'd22; ampl <= 8'd25; end
8'b00001010 : begin luma <= 8'd116; phase <= 5'd20; ampl <= 8'd39; end
8'b00001011 : begin luma <= 8'd123; phase <= 5'd19; ampl <= 8'd56; end
8'b00001100 : begin luma <= 8'd118; phase <= 5'd27; ampl <= 8'd33; end
8'b00001101 : begin luma <= 8'd125; phase <= 5'd24; ampl <= 8'd33; end
8'b00001110 : begin luma <= 8'd132; phase <= 5'd21; ampl <= 8'd43; end
8'b00001111 : begin luma <= 8'd138; phase <= 5'd20; ampl <= 8'd58; end
8'b00010000 : begin luma <= 8'd134; phase <= 5'd27; ampl <= 8'd44; end
8'b00010001 : begin luma <= 8'd140; phase <= 5'd24; ampl <= 8'd43; end
8'b00010010 : begin luma <= 8'd147; phase <= 5'd22; ampl <= 8'd50; end
8'b00010011 : begin luma <= 8'd154; phase <= 5'd21; ampl <= 8'd62; end
8'b00010100 : begin luma <= 8'd149; phase <= 5'd27; ampl <= 8'd55; end
8'b00010101 : begin luma <= 8'd156; phase <= 5'd25; ampl <= 8'd53; end
8'b00010110 : begin luma <= 8'd163; phase <= 5'd23; ampl <= 8'd58; end
8'b00010111 : begin luma <= 8'd169; phase <= 5'd22; ampl <= 8'd68; end
8'b00011000 : begin luma <= 8'd165; phase <= 5'd27; ampl <= 8'd66; end
8'b00011001 : begin luma <= 8'd171; phase <= 5'd25; ampl <= 8'd64; end
8'b00011010 : begin luma <= 8'd178; phase <= 5'd24; ampl <= 8'd67; end
8'b00011011 : begin luma <= 8'd185; phase <= 5'd22; ampl <= 8'd75; end
8'b00011100 : begin luma <= 8'd180; phase <= 5'd27; ampl <= 8'd77; end
8'b00011101 : begin luma <= 8'd187; phase <= 5'd25; ampl <= 8'd74; end
8'b00011110 : begin luma <= 8'd193; phase <= 5'd24; ampl <= 8'd76; end
8'b00011111 : begin luma <= 8'd200; phase <= 5'd23; ampl <= 8'd83; end
8'b00100000 : begin luma <= 8'd80; phase <= 5'd7; ampl <= 8'd12; end
8'b00100001 : begin luma <= 8'd87; phase <= 5'd14; ampl <= 8'd18; end
8'b00100010 : begin luma <= 8'd93; phase <= 5'd16; ampl <= 8'd35; end
8'b00100011 : begin luma <= 8'd100; phase <= 5'd16; ampl <= 8'd54; end
8'b00100100 : begin luma <= 8'd95; phase <= 5'd1; ampl <= 8'd8; end
8'b00100101 : begin luma <= 8'd102; phase <= 5'd17; ampl <= 8'd11; end
8'b00100110 : begin luma <= 8'd109; phase <= 5'd17; ampl <= 8'd31; end
8'b00100111 : begin luma <= 8'd115; phase <= 5'd17; ampl <= 8'd50; end
8'b00101000 : begin luma <= 8'd111; phase <= 5'd29; ampl <= 8'd16; end
8'b00101001 : begin luma <= 8'd117; phase <= 5'd22; ampl <= 8'd13; end
8'b00101010 : begin luma <= 8'd124; phase <= 5'd19; ampl <= 8'd29; end
8'b00101011 : begin luma <= 8'd131; phase <= 5'd18; ampl <= 8'd48; end
8'b00101100 : begin luma <= 8'd126; phase <= 5'd28; ampl <= 8'd26; end
8'b00101101 : begin luma <= 8'd133; phase <= 5'd24; ampl <= 8'd22; end
8'b00101110 : begin luma <= 8'd140; phase <= 5'd21; ampl <= 8'd32; end
8'b00101111 : begin luma <= 8'd146; phase <= 5'd19; ampl <= 8'd49; end
8'b00110000 : begin luma <= 8'd142; phase <= 5'd28; ampl <= 8'd36; end
8'b00110001 : begin luma <= 8'd148; phase <= 5'd25; ampl <= 8'd32; end
8'b00110010 : begin luma <= 8'd155; phase <= 5'd22; ampl <= 8'd38; end
8'b00110011 : begin luma <= 8'd162; phase <= 5'd20; ampl <= 8'd52; end
8'b00110100 : begin luma <= 8'd157; phase <= 5'd27; ampl <= 8'd47; end
8'b00110101 : begin luma <= 8'd164; phase <= 5'd25; ampl <= 8'd42; end
8'b00110110 : begin luma <= 8'd170; phase <= 5'd23; ampl <= 8'd46; end
8'b00110111 : begin luma <= 8'd177; phase <= 5'd21; ampl <= 8'd57; end
8'b00111000 : begin luma <= 8'd172; phase <= 5'd27; ampl <= 8'd58; end
8'b00111001 : begin luma <= 8'd179; phase <= 5'd25; ampl <= 8'd53; end
8'b00111010 : begin luma <= 8'd186; phase <= 5'd24; ampl <= 8'd55; end
8'b00111011 : begin luma <= 8'd193; phase <= 5'd22; ampl <= 8'd63; end
8'b00111100 : begin luma <= 8'd188; phase <= 5'd27; ampl <= 8'd69; end
8'b00111101 : begin luma <= 8'd195; phase <= 5'd26; ampl <= 8'd64; end
8'b00111110 : begin luma <= 8'd201; phase <= 5'd24; ampl <= 8'd65; end
8'b00111111 : begin luma <= 8'd208; phase <= 5'd23; ampl <= 8'd71; end
8'b01000000 : begin luma <= 8'd88; phase <= 5'd7; ampl <= 8'd24; end
8'b01000001 : begin luma <= 8'd94; phase <= 5'd11; ampl <= 8'd23; end
8'b01000010 : begin luma <= 8'd101; phase <= 5'd14; ampl <= 8'd35; end
8'b01000011 : begin luma <= 8'd108; phase <= 5'd15; ampl <= 8'd52; end
8'b01000100 : begin luma <= 8'd103; phase <= 5'd4; ampl <= 8'd17; end
8'b01000101 : begin luma <= 8'd110; phase <= 5'd12; ampl <= 8'd12; end
8'b01000110 : begin luma <= 8'd117; phase <= 5'd15; ampl <= 8'd27; end
8'b01000111 : begin luma <= 8'd123; phase <= 5'd16; ampl <= 8'd46; end
8'b01001000 : begin luma <= 8'd119; phase <= 5'd1; ampl <= 8'd17; end
8'b01001001 : begin luma <= 8'd125; phase <= 5'd17; ampl <= 8'd3; end
8'b01001010 : begin luma <= 8'd132; phase <= 5'd17; ampl <= 8'd22; end
8'b01001011 : begin luma <= 8'd139; phase <= 5'd17; ampl <= 8'd42; end
8'b01001100 : begin luma <= 8'd134; phase <= 5'd31; ampl <= 8'd22; end
8'b01001101 : begin luma <= 8'd141; phase <= 5'd25; ampl <= 8'd11; end
8'b01001110 : begin luma <= 8'd147; phase <= 5'd20; ampl <= 8'd22; end
8'b01001111 : begin luma <= 8'd154; phase <= 5'd18; ampl <= 8'd40; end
8'b01010000 : begin luma <= 8'd149; phase <= 5'd29; ampl <= 8'd31; end
8'b01010001 : begin luma <= 8'd156; phase <= 5'd26; ampl <= 8'd21; end
8'b01010010 : begin luma <= 8'd163; phase <= 5'd22; ampl <= 8'd27; end
8'b01010011 : begin luma <= 8'd170; phase <= 5'd20; ampl <= 8'd41; end
8'b01010100 : begin luma <= 8'd165; phase <= 5'd29; ampl <= 8'd41; end
8'b01010101 : begin luma <= 8'd172; phase <= 5'd26; ampl <= 8'd32; end
8'b01010110 : begin luma <= 8'd178; phase <= 5'd23; ampl <= 8'd34; end
8'b01010111 : begin luma <= 8'd185; phase <= 5'd21; ampl <= 8'd45; end
8'b01011000 : begin luma <= 8'd180; phase <= 5'd28; ampl <= 8'd51; end
8'b01011001 : begin luma <= 8'd187; phase <= 5'd26; ampl <= 8'd43; end
8'b01011010 : begin luma <= 8'd194; phase <= 5'd24; ampl <= 8'd43; end
8'b01011011 : begin luma <= 8'd200; phase <= 5'd22; ampl <= 8'd51; end
8'b01011100 : begin luma <= 8'd196; phase <= 5'd28; ampl <= 8'd62; end
8'b01011101 : begin luma <= 8'd202; phase <= 5'd26; ampl <= 8'd54; end
8'b01011110 : begin luma <= 8'd209; phase <= 5'd24; ampl <= 8'd53; end
8'b01011111 : begin luma <= 8'd216; phase <= 5'd23; ampl <= 8'd59; end
8'b01100000 : begin luma <= 8'd96; phase <= 5'd7; ampl <= 8'd35; end
8'b01100001 : begin luma <= 8'd102; phase <= 5'd10; ampl <= 8'd32; end
8'b01100010 : begin luma <= 8'd109; phase <= 5'd12; ampl <= 8'd39; end
8'b01100011 : begin luma <= 8'd116; phase <= 5'd14; ampl <= 8'd53; end
8'b01100100 : begin luma <= 8'd111; phase <= 5'd5; ampl <= 8'd28; end
8'b01100101 : begin luma <= 8'd118; phase <= 5'd9; ampl <= 8'd21; end
8'b01100110 : begin luma <= 8'd124; phase <= 5'd13; ampl <= 8'd29; end
8'b01100111 : begin luma <= 8'd131; phase <= 5'd15; ampl <= 8'd45; end
8'b01101000 : begin luma <= 8'd126; phase <= 5'd3; ampl <= 8'd24; end
8'b01101001 : begin luma <= 8'd133; phase <= 5'd8; ampl <= 8'd11; end
8'b01101010 : begin luma <= 8'd140; phase <= 5'd14; ampl <= 8'd20; end
8'b01101011 : begin luma <= 8'd147; phase <= 5'd16; ampl <= 8'd38; end
8'b01101100 : begin luma <= 8'd142; phase <= 5'd1; ampl <= 8'd25; end
8'b01101101 : begin luma <= 8'd149; phase <= 5'd1; ampl <= 8'd6; end
8'b01101110 : begin luma <= 8'd155; phase <= 5'd17; ampl <= 8'd14; end
8'b01101111 : begin luma <= 8'd162; phase <= 5'd17; ampl <= 8'd33; end
8'b01110000 : begin luma <= 8'd157; phase <= 5'd31; ampl <= 8'd30; end
8'b01110001 : begin luma <= 8'd164; phase <= 5'd29; ampl <= 8'd14; end
8'b01110010 : begin luma <= 8'd171; phase <= 5'd21; ampl <= 8'd15; end
8'b01110011 : begin luma <= 8'd177; phase <= 5'd19; ampl <= 8'd32; end
8'b01110100 : begin luma <= 8'd173; phase <= 5'd30; ampl <= 8'd38; end
8'b01110101 : begin luma <= 8'd179; phase <= 5'd28; ampl <= 8'd24; end
8'b01110110 : begin luma <= 8'd186; phase <= 5'd23; ampl <= 8'd23; end
8'b01110111 : begin luma <= 8'd193; phase <= 5'd20; ampl <= 8'd34; end
8'b01111000 : begin luma <= 8'd188; phase <= 5'd29; ampl <= 8'd47; end
8'b01111001 : begin luma <= 8'd195; phase <= 5'd27; ampl <= 8'd35; end
8'b01111010 : begin luma <= 8'd201; phase <= 5'd24; ampl <= 8'd32; end
8'b01111011 : begin luma <= 8'd208; phase <= 5'd22; ampl <= 8'd40; end
8'b01111100 : begin luma <= 8'd203; phase <= 5'd29; ampl <= 8'd56; end
8'b01111101 : begin luma <= 8'd210; phase <= 5'd27; ampl <= 8'd46; end
8'b01111110 : begin luma <= 8'd217; phase <= 5'd25; ampl <= 8'd42; end
8'b01111111 : begin luma <= 8'd224; phase <= 5'd23; ampl <= 8'd47; end
8'b10000000 : begin luma <= 8'd103; phase <= 5'd7; ampl <= 8'd47; end
8'b10000001 : begin luma <= 8'd110; phase <= 5'd9; ampl <= 8'd42; end
8'b10000010 : begin luma <= 8'd117; phase <= 5'd11; ampl <= 8'd46; end
8'b10000011 : begin luma <= 8'd124; phase <= 5'd13; ampl <= 8'd56; end
8'b10000100 : begin luma <= 8'd119; phase <= 5'd6; ampl <= 8'd40; end
8'b10000101 : begin luma <= 8'd126; phase <= 5'd8; ampl <= 8'd32; end
8'b10000110 : begin luma <= 8'd132; phase <= 5'd11; ampl <= 8'd35; end
8'b10000111 : begin luma <= 8'd139; phase <= 5'd13; ampl <= 8'd47; end
8'b10001000 : begin luma <= 8'd134; phase <= 5'd4; ampl <= 8'd34; end
8'b10001001 : begin luma <= 8'd141; phase <= 5'd7; ampl <= 8'd23; end
8'b10001010 : begin luma <= 8'd148; phase <= 5'd12; ampl <= 8'd24; end
8'b10001011 : begin luma <= 8'd154; phase <= 5'd14; ampl <= 8'd38; end
8'b10001100 : begin luma <= 8'd150; phase <= 5'd3; ampl <= 8'd32; end
8'b10001101 : begin luma <= 8'd156; phase <= 5'd5; ampl <= 8'd15; end
8'b10001110 : begin luma <= 8'd163; phase <= 5'd13; ampl <= 8'd14; end
8'b10001111 : begin luma <= 8'd170; phase <= 5'd15; ampl <= 8'd30; end
8'b10010000 : begin luma <= 8'd165; phase <= 5'd1; ampl <= 8'd33; end
8'b10010001 : begin luma <= 8'd172; phase <= 5'd1; ampl <= 8'd14; end
8'b10010010 : begin luma <= 8'd178; phase <= 5'd17; ampl <= 8'd6; end
8'b10010011 : begin luma <= 8'd185; phase <= 5'd17; ampl <= 8'd25; end
8'b10010100 : begin luma <= 8'd180; phase <= 5'd0; ampl <= 8'd38; end
8'b10010101 : begin luma <= 8'd187; phase <= 5'd30; ampl <= 8'd20; end
8'b10010110 : begin luma <= 8'd194; phase <= 5'd24; ampl <= 8'd11; end
8'b10010111 : begin luma <= 8'd201; phase <= 5'd19; ampl <= 8'd24; end
8'b10011000 : begin luma <= 8'd196; phase <= 5'd31; ampl <= 8'd45; end
8'b10011001 : begin luma <= 8'd203; phase <= 5'd29; ampl <= 8'd29; end
8'b10011010 : begin luma <= 8'd209; phase <= 5'd25; ampl <= 8'd21; end
8'b10011011 : begin luma <= 8'd216; phase <= 5'd21; ampl <= 8'd28; end
8'b10011100 : begin luma <= 8'd211; phase <= 5'd30; ampl <= 8'd53; end
8'b10011101 : begin luma <= 8'd218; phase <= 5'd28; ampl <= 8'd39; end
8'b10011110 : begin luma <= 8'd225; phase <= 5'd26; ampl <= 8'd32; end
8'b10011111 : begin luma <= 8'd231; phase <= 5'd23; ampl <= 8'd35; end
8'b10100000 : begin luma <= 8'd111; phase <= 5'd7; ampl <= 8'd59; end
8'b10100001 : begin luma <= 8'd118; phase <= 5'd8; ampl <= 8'd53; end
8'b10100010 : begin luma <= 8'd125; phase <= 5'd10; ampl <= 8'd54; end
8'b10100011 : begin luma <= 8'd131; phase <= 5'd12; ampl <= 8'd62; end
8'b10100100 : begin luma <= 8'd127; phase <= 5'd6; ampl <= 8'd51; end
8'b10100101 : begin luma <= 8'd133; phase <= 5'd8; ampl <= 8'd43; end
8'b10100110 : begin luma <= 8'd140; phase <= 5'd10; ampl <= 8'd43; end
8'b10100111 : begin luma <= 8'd147; phase <= 5'd12; ampl <= 8'd51; end
8'b10101000 : begin luma <= 8'd142; phase <= 5'd5; ampl <= 8'd45; end
8'b10101001 : begin luma <= 8'd149; phase <= 5'd7; ampl <= 8'd34; end
8'b10101010 : begin luma <= 8'd155; phase <= 5'd10; ampl <= 8'd32; end
8'b10101011 : begin luma <= 8'd162; phase <= 5'd13; ampl <= 8'd41; end
8'b10101100 : begin luma <= 8'd157; phase <= 5'd4; ampl <= 8'd41; end
8'b10101101 : begin luma <= 8'd164; phase <= 5'd6; ampl <= 8'd27; end
8'b10101110 : begin luma <= 8'd171; phase <= 5'd10; ampl <= 8'd21; end
8'b10101111 : begin luma <= 8'd178; phase <= 5'd13; ampl <= 8'd31; end
8'b10110000 : begin luma <= 8'd173; phase <= 5'd2; ampl <= 8'd40; end
8'b10110001 : begin luma <= 8'd180; phase <= 5'd4; ampl <= 8'd22; end
8'b10110010 : begin luma <= 8'd186; phase <= 5'd9; ampl <= 8'd11; end
8'b10110011 : begin luma <= 8'd193; phase <= 5'd15; ampl <= 8'd22; end
8'b10110100 : begin luma <= 8'd188; phase <= 5'd1; ampl <= 8'd42; end
8'b10110101 : begin luma <= 8'd195; phase <= 5'd1; ampl <= 8'd22; end
8'b10110110 : begin luma <= 8'd202; phase <= 5'd1; ampl <= 8'd3; end
8'b10110111 : begin luma <= 8'd208; phase <= 5'd17; ampl <= 8'd17; end
8'b10111000 : begin luma <= 8'd204; phase <= 5'd0; ampl <= 8'd46; end
8'b10111001 : begin luma <= 8'd210; phase <= 5'd31; ampl <= 8'd27; end
8'b10111010 : begin luma <= 8'd217; phase <= 5'd28; ampl <= 8'd12; end
8'b10111011 : begin luma <= 8'd224; phase <= 5'd20; ampl <= 8'd17; end
8'b10111100 : begin luma <= 8'd219; phase <= 5'd31; ampl <= 8'd52; end
8'b10111101 : begin luma <= 8'd226; phase <= 5'd30; ampl <= 8'd35; end
8'b10111110 : begin luma <= 8'd233; phase <= 5'd27; ampl <= 8'd23; end
8'b10111111 : begin luma <= 8'd239; phase <= 5'd23; ampl <= 8'd24; end
8'b11000000 : begin luma <= 8'd119; phase <= 5'd7; ampl <= 8'd71; end
8'b11000001 : begin luma <= 8'd126; phase <= 5'd8; ampl <= 8'd65; end
8'b11000010 : begin luma <= 8'd132; phase <= 5'd10; ampl <= 8'd64; end
8'b11000011 : begin luma <= 8'd139; phase <= 5'd11; ampl <= 8'd69; end
8'b11000100 : begin luma <= 8'd134; phase <= 5'd6; ampl <= 8'd63; end
8'b11000101 : begin luma <= 8'd141; phase <= 5'd8; ampl <= 8'd55; end
8'b11000110 : begin luma <= 8'd148; phase <= 5'd9; ampl <= 8'd53; end
8'b11000111 : begin luma <= 8'd155; phase <= 5'd11; ampl <= 8'd58; end
8'b11001000 : begin luma <= 8'd150; phase <= 5'd5; ampl <= 8'd57; end
8'b11001001 : begin luma <= 8'd157; phase <= 5'd7; ampl <= 8'd46; end
8'b11001010 : begin luma <= 8'd163; phase <= 5'd9; ampl <= 8'd42; end
8'b11001011 : begin luma <= 8'd170; phase <= 5'd11; ampl <= 8'd47; end
8'b11001100 : begin luma <= 8'd165; phase <= 5'd4; ampl <= 8'd52; end
8'b11001101 : begin luma <= 8'd172; phase <= 5'd6; ampl <= 8'd38; end
8'b11001110 : begin luma <= 8'd179; phase <= 5'd9; ampl <= 8'd32; end
8'b11001111 : begin luma <= 8'd185; phase <= 5'd12; ampl <= 8'd36; end
8'b11010000 : begin luma <= 8'd181; phase <= 5'd3; ampl <= 8'd49; end
8'b11010001 : begin luma <= 8'd187; phase <= 5'd5; ampl <= 8'd32; end
8'b11010010 : begin luma <= 8'd194; phase <= 5'd8; ampl <= 8'd22; end
8'b11010011 : begin luma <= 8'd201; phase <= 5'd12; ampl <= 8'd26; end
8'b11010100 : begin luma <= 8'd196; phase <= 5'd2; ampl <= 8'd48; end
8'b11010101 : begin luma <= 8'd203; phase <= 5'd3; ampl <= 8'd29; end
8'b11010110 : begin luma <= 8'd210; phase <= 5'd6; ampl <= 8'd13; end
8'b11010111 : begin luma <= 8'd216; phase <= 5'd13; ampl <= 8'd16; end
8'b11011000 : begin luma <= 8'd212; phase <= 5'd1; ampl <= 8'd50; end
8'b11011001 : begin luma <= 8'd218; phase <= 5'd1; ampl <= 8'd31; end
8'b11011010 : begin luma <= 8'd225; phase <= 5'd1; ampl <= 8'd11; end
8'b11011011 : begin luma <= 8'd232; phase <= 5'd17; ampl <= 8'd8; end
8'b11011100 : begin luma <= 8'd227; phase <= 5'd0; ampl <= 8'd54; end
8'b11011101 : begin luma <= 8'd234; phase <= 5'd0; ampl <= 8'd35; end
8'b11011110 : begin luma <= 8'd240; phase <= 5'd30; ampl <= 8'd18; end
8'b11011111 : begin luma <= 8'd247; phase <= 5'd23; ampl <= 8'd12; end
8'b11100000 : begin luma <= 8'd127; phase <= 5'd7; ampl <= 8'd83; end
8'b11100001 : begin luma <= 8'd134; phase <= 5'd8; ampl <= 8'd76; end
8'b11100010 : begin luma <= 8'd140; phase <= 5'd9; ampl <= 8'd74; end
8'b11100011 : begin luma <= 8'd147; phase <= 5'd11; ampl <= 8'd77; end
8'b11100100 : begin luma <= 8'd142; phase <= 5'd6; ampl <= 8'd75; end
8'b11100101 : begin luma <= 8'd149; phase <= 5'd8; ampl <= 8'd67; end
8'b11100110 : begin luma <= 8'd156; phase <= 5'd9; ampl <= 8'd64; end
8'b11100111 : begin luma <= 8'd162; phase <= 5'd11; ampl <= 8'd66; end
8'b11101000 : begin luma <= 8'd158; phase <= 5'd6; ampl <= 8'd68; end
8'b11101001 : begin luma <= 8'd164; phase <= 5'd7; ampl <= 8'd58; end
8'b11101010 : begin luma <= 8'd171; phase <= 5'd9; ampl <= 8'd53; end
8'b11101011 : begin luma <= 8'd178; phase <= 5'd11; ampl <= 8'd55; end
8'b11101100 : begin luma <= 8'd173; phase <= 5'd5; ampl <= 8'd62; end
8'b11101101 : begin luma <= 8'd180; phase <= 5'd6; ampl <= 8'd50; end
8'b11101110 : begin luma <= 8'd187; phase <= 5'd8; ampl <= 8'd43; end
8'b11101111 : begin luma <= 8'd193; phase <= 5'd11; ampl <= 8'd44; end
8'b11110000 : begin luma <= 8'd189; phase <= 5'd4; ampl <= 8'd58; end
8'b11110001 : begin luma <= 8'd195; phase <= 5'd5; ampl <= 8'd43; end
8'b11110010 : begin luma <= 8'd202; phase <= 5'd8; ampl <= 8'd33; end
8'b11110011 : begin luma <= 8'd209; phase <= 5'd11; ampl <= 8'd33; end
8'b11110100 : begin luma <= 8'd204; phase <= 5'd3; ampl <= 8'd56; end
8'b11110101 : begin luma <= 8'd211; phase <= 5'd4; ampl <= 8'd39; end
8'b11110110 : begin luma <= 8'd217; phase <= 5'd6; ampl <= 8'd25; end
8'b11110111 : begin luma <= 8'd224; phase <= 5'd11; ampl <= 8'd22; end
8'b11111000 : begin luma <= 8'd219; phase <= 5'd2; ampl <= 8'd56; end
8'b11111001 : begin luma <= 8'd226; phase <= 5'd3; ampl <= 8'd37; end
8'b11111010 : begin luma <= 8'd233; phase <= 5'd4; ampl <= 8'd19; end
8'b11111011 : begin luma <= 8'd240; phase <= 5'd11; ampl <= 8'd11; end
8'b11111100 : begin luma <= 8'd235; phase <= 5'd1; ampl <= 8'd58; end
8'b11111101 : begin luma <= 8'd242; phase <= 5'd1; ampl <= 8'd39; end
8'b11111110 : begin luma <= 8'd248; phase <= 5'd1; ampl <= 8'd19; end
8'b11111111 : begin luma <= 8'd255; phase <= 5'd11; ampl <= 8'd0; end
endcase


endmodule
