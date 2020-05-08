////////////////////////////////////////////////////////////////////
//
// bel_fft_project_twiddle_rom0.v.v
//
//
// This file is part of the "bel_fft" project
//
// Author(s):
//     - Frank Storm (Frank.Storm@gmx.net)
//
////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2012-2013 Authors
//
// This source file may be used and distributed without
// restriction provided that this copyright statement is not
// removed from the file and that any derivative work contains
// the original copyright notice and the associated disclaimer.
//
// This source file is free software; you can redistribute it
// and/or modify it under the terms of the GNU Lesser General
// Public License as published by the Free Software Foundation;
// either version 2.1 of the License, or (at your option) any
// later version.
//
// This source is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied
// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
// PURPOSE.  See the GNU Lesser General Public License for more
// details.
//
// You should have received a copy of the GNU Lesser General
// Public License along with this source; if not, download it
// from http://www.gnu.org/licenses/lgpl.html
//
////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log$
//
////////////////////////////////////////////////////////////////////


module bel_fft_project_twiddle_rom0 (
        clock,
        clken,
        address,
        q);

    input clock;
    input clken;
    input [8 - 1:0] address;
    output [64 - 1: 0] q;

    reg [64 - 1:0] rom [256 - 1:0];
    reg [64 - 1:0] q;

    always @(posedge clock) begin
        if (clken) begin
            case (address)
                8'h0000: q <= 64'h7FFFFFFF00000000;
                8'h0001: q <= 64'h7FF62181FCDBD541;
                8'h0002: q <= 64'h7FD8878DF9B82684;
                8'h0003: q <= 64'h7FA736B3F6956FB7;
                8'h0004: q <= 64'h7F62368EF3742CA2;
                8'h0005: q <= 64'h7F0991C3F054D8D5;
                8'h0006: q <= 64'h7E9D55FBED37EF92;
                8'h0007: q <= 64'h7E1D93E9EA1DEBBC;
                8'h0008: q <= 64'h7D8A5F3FE70747C4;
                8'h0009: q <= 64'h7CE3CEB1E3F47D96;
                8'h000A: q <= 64'h7C29FBEDE0E60685;
                8'h000B: q <= 64'h7B5D039DDDDC5B3B;
                8'h000C: q <= 64'h7A7D055ADAD7F3A3;
                8'h000D: q <= 64'h798A23B0D7D946D8;
                8'h000E: q <= 64'h78848413D4E0CB15;
                8'h000F: q <= 64'h776C4EDAD1EEF59E;
                8'h0010: q <= 64'h7641AF3CCF043AB3;
                8'h0011: q <= 64'h7504D344CC210D79;
                8'h0012: q <= 64'h73B5EBD0C945DFED;
                8'h0013: q <= 64'h72552C84C67322CE;
                8'h0014: q <= 64'h70E2CBC5C3A94590;
                8'h0015: q <= 64'h6F5F02B1C0E8B649;
                8'h0016: q <= 64'h6DCA0D14BE31E19C;
                8'h0017: q <= 64'h6C24295FBB8532B0;
                8'h0018: q <= 64'h6A6D98A3B8E3131A;
                8'h0019: q <= 64'h68A69E80B64BEACD;
                8'h001A: q <= 64'h66CF811FB3C0200D;
                8'h001B: q <= 64'h64E88925B140175C;
                8'h001C: q <= 64'h62F201ACAECC336C;
                8'h001D: q <= 64'h60EC382FAC64D511;
                8'h001E: q <= 64'h5ED77C89AA0A5B2E;
                8'h001F: q <= 64'h5CB420DFA7BD22AC;
                8'h0020: q <= 64'h5A827999A57D8667;
                8'h0021: q <= 64'h5842DD54A34BDF21;
                8'h0022: q <= 64'h55F5A4D2A1288377;
                8'h0023: q <= 64'h539B2AEF9F13C7D1;
                8'h0024: q <= 64'h5133CC949D0DFE54;
                8'h0025: q <= 64'h4EBFE8A49B1776DB;
                8'h0026: q <= 64'h4C3FDFF399307EE1;
                8'h0027: q <= 64'h49B4153397596180;
                8'h0028: q <= 64'h471CECE69592675D;
                8'h0029: q <= 64'h447ACD5093DBD6A1;
                8'h002A: q <= 64'h41CE1E649235F2EC;
                8'h002B: q <= 64'h3F1749B790A0FD4F;
                8'h002C: q <= 64'h3C56BA708F1D343B;
                8'h002D: q <= 64'h398CDD328DAAD37C;
                8'h002E: q <= 64'h36BA20138C4A1430;
                8'h002F: q <= 64'h33DEF2878AFB2CBC;
                8'h0030: q <= 64'h30FBC54D89BE50C4;
                8'h0031: q <= 64'h2E110A628893B126;
                8'h0032: q <= 64'h2B1F34EB877B7BED;
                8'h0033: q <= 64'h2826B9288675DC50;
                8'h0034: q <= 64'h25280C5D8582FAA6;
                8'h0035: q <= 64'h2223A4C584A2FC63;
                8'h0036: q <= 64'h1F19F97B83D60413;
                8'h0037: q <= 64'h1C0B826A831C314F;
                8'h0038: q <= 64'h18F8B83C8275A0C1;
                8'h0039: q <= 64'h15E2144481E26C17;
                8'h003A: q <= 64'h12C8106E8162AA05;
                8'h003B: q <= 64'h0FAB272B80F66E3D;
                8'h003C: q <= 64'h0C8BD35E809DC972;
                8'h003D: q <= 64'h096A90498058C94D;
                8'h003E: q <= 64'h0647D97C80277873;
                8'h003F: q <= 64'h03242ABF8009DE7F;
                8'h0040: q <= 64'h0000000080000001;
                8'h0041: q <= 64'hFCDBD5418009DE7F;
                8'h0042: q <= 64'hF9B8268480277873;
                8'h0043: q <= 64'hF6956FB78058C94D;
                8'h0044: q <= 64'hF3742CA2809DC972;
                8'h0045: q <= 64'hF054D8D580F66E3D;
                8'h0046: q <= 64'hED37EF928162AA05;
                8'h0047: q <= 64'hEA1DEBBC81E26C17;
                8'h0048: q <= 64'hE70747C48275A0C1;
                8'h0049: q <= 64'hE3F47D96831C314F;
                8'h004A: q <= 64'hE0E6068583D60413;
                8'h004B: q <= 64'hDDDC5B3B84A2FC63;
                8'h004C: q <= 64'hDAD7F3A38582FAA6;
                8'h004D: q <= 64'hD7D946D88675DC50;
                8'h004E: q <= 64'hD4E0CB15877B7BED;
                8'h004F: q <= 64'hD1EEF59E8893B126;
                8'h0050: q <= 64'hCF043AB389BE50C4;
                8'h0051: q <= 64'hCC210D798AFB2CBC;
                8'h0052: q <= 64'hC945DFED8C4A1430;
                8'h0053: q <= 64'hC67322CE8DAAD37C;
                8'h0054: q <= 64'hC3A945908F1D343B;
                8'h0055: q <= 64'hC0E8B64990A0FD4F;
                8'h0056: q <= 64'hBE31E19C9235F2EC;
                8'h0057: q <= 64'hBB8532B093DBD6A1;
                8'h0058: q <= 64'hB8E3131A9592675D;
                8'h0059: q <= 64'hB64BEACD97596180;
                8'h005A: q <= 64'hB3C0200D99307EE1;
                8'h005B: q <= 64'hB140175C9B1776DB;
                8'h005C: q <= 64'hAECC336C9D0DFE54;
                8'h005D: q <= 64'hAC64D5119F13C7D1;
                8'h005E: q <= 64'hAA0A5B2EA1288377;
                8'h005F: q <= 64'hA7BD22ACA34BDF21;
                8'h0060: q <= 64'hA57D8667A57D8667;
                8'h0061: q <= 64'hA34BDF21A7BD22AC;
                8'h0062: q <= 64'hA1288377AA0A5B2E;
                8'h0063: q <= 64'h9F13C7D1AC64D511;
                8'h0064: q <= 64'h9D0DFE54AECC336C;
                8'h0065: q <= 64'h9B1776DBB140175C;
                8'h0066: q <= 64'h99307EE1B3C0200D;
                8'h0067: q <= 64'h97596180B64BEACD;
                8'h0068: q <= 64'h9592675DB8E3131A;
                8'h0069: q <= 64'h93DBD6A1BB8532B0;
                8'h006A: q <= 64'h9235F2ECBE31E19C;
                8'h006B: q <= 64'h90A0FD4FC0E8B649;
                8'h006C: q <= 64'h8F1D343BC3A94590;
                8'h006D: q <= 64'h8DAAD37CC67322CE;
                8'h006E: q <= 64'h8C4A1430C945DFED;
                8'h006F: q <= 64'h8AFB2CBCCC210D79;
                8'h0070: q <= 64'h89BE50C4CF043AB3;
                8'h0071: q <= 64'h8893B126D1EEF59E;
                8'h0072: q <= 64'h877B7BEDD4E0CB15;
                8'h0073: q <= 64'h8675DC50D7D946D8;
                8'h0074: q <= 64'h8582FAA6DAD7F3A3;
                8'h0075: q <= 64'h84A2FC63DDDC5B3B;
                8'h0076: q <= 64'h83D60413E0E60685;
                8'h0077: q <= 64'h831C314FE3F47D96;
                8'h0078: q <= 64'h8275A0C1E70747C4;
                8'h0079: q <= 64'h81E26C17EA1DEBBC;
                8'h007A: q <= 64'h8162AA05ED37EF92;
                8'h007B: q <= 64'h80F66E3DF054D8D5;
                8'h007C: q <= 64'h809DC972F3742CA2;
                8'h007D: q <= 64'h8058C94DF6956FB7;
                8'h007E: q <= 64'h80277873F9B82684;
                8'h007F: q <= 64'h8009DE7FFCDBD541;
                8'h0080: q <= 64'h8000000100000000;
                8'h0081: q <= 64'h8009DE7F03242ABF;
                8'h0082: q <= 64'h802778730647D97C;
                8'h0083: q <= 64'h8058C94D096A9049;
                8'h0084: q <= 64'h809DC9720C8BD35E;
                8'h0085: q <= 64'h80F66E3D0FAB272B;
                8'h0086: q <= 64'h8162AA0512C8106E;
                8'h0087: q <= 64'h81E26C1715E21444;
                8'h0088: q <= 64'h8275A0C118F8B83C;
                8'h0089: q <= 64'h831C314F1C0B826A;
                8'h008A: q <= 64'h83D604131F19F97B;
                8'h008B: q <= 64'h84A2FC632223A4C5;
                8'h008C: q <= 64'h8582FAA625280C5D;
                8'h008D: q <= 64'h8675DC502826B928;
                8'h008E: q <= 64'h877B7BED2B1F34EB;
                8'h008F: q <= 64'h8893B1262E110A62;
                8'h0090: q <= 64'h89BE50C430FBC54D;
                8'h0091: q <= 64'h8AFB2CBC33DEF287;
                8'h0092: q <= 64'h8C4A143036BA2013;
                8'h0093: q <= 64'h8DAAD37C398CDD32;
                8'h0094: q <= 64'h8F1D343B3C56BA70;
                8'h0095: q <= 64'h90A0FD4F3F1749B7;
                8'h0096: q <= 64'h9235F2EC41CE1E64;
                8'h0097: q <= 64'h93DBD6A1447ACD50;
                8'h0098: q <= 64'h9592675D471CECE6;
                8'h0099: q <= 64'h9759618049B41533;
                8'h009A: q <= 64'h99307EE14C3FDFF3;
                8'h009B: q <= 64'h9B1776DB4EBFE8A4;
                8'h009C: q <= 64'h9D0DFE545133CC94;
                8'h009D: q <= 64'h9F13C7D1539B2AEF;
                8'h009E: q <= 64'hA128837755F5A4D2;
                8'h009F: q <= 64'hA34BDF215842DD54;
                8'h00A0: q <= 64'hA57D86675A827999;
                8'h00A1: q <= 64'hA7BD22AC5CB420DF;
                8'h00A2: q <= 64'hAA0A5B2E5ED77C89;
                8'h00A3: q <= 64'hAC64D51160EC382F;
                8'h00A4: q <= 64'hAECC336C62F201AC;
                8'h00A5: q <= 64'hB140175C64E88925;
                8'h00A6: q <= 64'hB3C0200D66CF811F;
                8'h00A7: q <= 64'hB64BEACD68A69E80;
                8'h00A8: q <= 64'hB8E3131A6A6D98A3;
                8'h00A9: q <= 64'hBB8532B06C24295F;
                8'h00AA: q <= 64'hBE31E19C6DCA0D14;
                8'h00AB: q <= 64'hC0E8B6496F5F02B1;
                8'h00AC: q <= 64'hC3A9459070E2CBC5;
                8'h00AD: q <= 64'hC67322CE72552C84;
                8'h00AE: q <= 64'hC945DFED73B5EBD0;
                8'h00AF: q <= 64'hCC210D797504D344;
                8'h00B0: q <= 64'hCF043AB37641AF3C;
                8'h00B1: q <= 64'hD1EEF59E776C4EDA;
                8'h00B2: q <= 64'hD4E0CB1578848413;
                8'h00B3: q <= 64'hD7D946D8798A23B0;
                8'h00B4: q <= 64'hDAD7F3A37A7D055A;
                8'h00B5: q <= 64'hDDDC5B3B7B5D039D;
                8'h00B6: q <= 64'hE0E606857C29FBED;
                8'h00B7: q <= 64'hE3F47D967CE3CEB1;
                8'h00B8: q <= 64'hE70747C47D8A5F3F;
                8'h00B9: q <= 64'hEA1DEBBC7E1D93E9;
                8'h00BA: q <= 64'hED37EF927E9D55FB;
                8'h00BB: q <= 64'hF054D8D57F0991C3;
                8'h00BC: q <= 64'hF3742CA27F62368E;
                8'h00BD: q <= 64'hF6956FB77FA736B3;
                8'h00BE: q <= 64'hF9B826847FD8878D;
                8'h00BF: q <= 64'hFCDBD5417FF62181;
                8'h00C0: q <= 64'h000000007FFFFFFF;
                8'h00C1: q <= 64'h03242ABF7FF62181;
                8'h00C2: q <= 64'h0647D97C7FD8878D;
                8'h00C3: q <= 64'h096A90497FA736B3;
                8'h00C4: q <= 64'h0C8BD35E7F62368E;
                8'h00C5: q <= 64'h0FAB272B7F0991C3;
                8'h00C6: q <= 64'h12C8106E7E9D55FB;
                8'h00C7: q <= 64'h15E214447E1D93E9;
                8'h00C8: q <= 64'h18F8B83C7D8A5F3F;
                8'h00C9: q <= 64'h1C0B826A7CE3CEB1;
                8'h00CA: q <= 64'h1F19F97B7C29FBED;
                8'h00CB: q <= 64'h2223A4C57B5D039D;
                8'h00CC: q <= 64'h25280C5D7A7D055A;
                8'h00CD: q <= 64'h2826B928798A23B0;
                8'h00CE: q <= 64'h2B1F34EB78848413;
                8'h00CF: q <= 64'h2E110A62776C4EDA;
                8'h00D0: q <= 64'h30FBC54D7641AF3C;
                8'h00D1: q <= 64'h33DEF2877504D344;
                8'h00D2: q <= 64'h36BA201373B5EBD0;
                8'h00D3: q <= 64'h398CDD3272552C84;
                8'h00D4: q <= 64'h3C56BA7070E2CBC5;
                8'h00D5: q <= 64'h3F1749B76F5F02B1;
                8'h00D6: q <= 64'h41CE1E646DCA0D14;
                8'h00D7: q <= 64'h447ACD506C24295F;
                8'h00D8: q <= 64'h471CECE66A6D98A3;
                8'h00D9: q <= 64'h49B4153368A69E80;
                8'h00DA: q <= 64'h4C3FDFF366CF811F;
                8'h00DB: q <= 64'h4EBFE8A464E88925;
                8'h00DC: q <= 64'h5133CC9462F201AC;
                8'h00DD: q <= 64'h539B2AEF60EC382F;
                8'h00DE: q <= 64'h55F5A4D25ED77C89;
                8'h00DF: q <= 64'h5842DD545CB420DF;
                8'h00E0: q <= 64'h5A8279995A827999;
                8'h00E1: q <= 64'h5CB420DF5842DD54;
                8'h00E2: q <= 64'h5ED77C8955F5A4D2;
                8'h00E3: q <= 64'h60EC382F539B2AEF;
                8'h00E4: q <= 64'h62F201AC5133CC94;
                8'h00E5: q <= 64'h64E889254EBFE8A4;
                8'h00E6: q <= 64'h66CF811F4C3FDFF3;
                8'h00E7: q <= 64'h68A69E8049B41533;
                8'h00E8: q <= 64'h6A6D98A3471CECE6;
                8'h00E9: q <= 64'h6C24295F447ACD50;
                8'h00EA: q <= 64'h6DCA0D1441CE1E64;
                8'h00EB: q <= 64'h6F5F02B13F1749B7;
                8'h00EC: q <= 64'h70E2CBC53C56BA70;
                8'h00ED: q <= 64'h72552C84398CDD32;
                8'h00EE: q <= 64'h73B5EBD036BA2013;
                8'h00EF: q <= 64'h7504D34433DEF287;
                8'h00F0: q <= 64'h7641AF3C30FBC54D;
                8'h00F1: q <= 64'h776C4EDA2E110A62;
                8'h00F2: q <= 64'h788484132B1F34EB;
                8'h00F3: q <= 64'h798A23B02826B928;
                8'h00F4: q <= 64'h7A7D055A25280C5D;
                8'h00F5: q <= 64'h7B5D039D2223A4C5;
                8'h00F6: q <= 64'h7C29FBED1F19F97B;
                8'h00F7: q <= 64'h7CE3CEB11C0B826A;
                8'h00F8: q <= 64'h7D8A5F3F18F8B83C;
                8'h00F9: q <= 64'h7E1D93E915E21444;
                8'h00FA: q <= 64'h7E9D55FB12C8106E;
                8'h00FB: q <= 64'h7F0991C30FAB272B;
                8'h00FC: q <= 64'h7F62368E0C8BD35E;
                8'h00FD: q <= 64'h7FA736B3096A9049;
                8'h00FE: q <= 64'h7FD8878D0647D97C;
                8'h00FF: q <= 64'h7FF6218103242ABF;
            endcase
        end
    end

endmodule
