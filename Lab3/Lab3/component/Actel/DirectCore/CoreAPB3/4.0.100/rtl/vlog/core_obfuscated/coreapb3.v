// Microsemi Corporation Proprietary and Confidential
// Copyright 2011 Microsemi Corporation.  All rights reserved.
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
// Revision Information:
// 05Feb10              Production Release Version 3.0
// SVN Revision Information:
// SVN $Revision: 19036 $
// SVN $Date: 2013-01-11 08:25:22 -0800 (Fri, 11 Jan 2013) $
`timescale 1ns/1ps
module
CoreAPB3
#
(
parameter
[
5
:
0
]
APB_DWIDTH
=
32
,
parameter
IADDR_OPTION
=
0
,
parameter
[
0
:
0
]
APBSLOT0ENABLE
=
1
,
parameter
[
0
:
0
]
APBSLOT1ENABLE
=
1
,
parameter
[
0
:
0
]
APBSLOT2ENABLE
=
1
,
parameter
[
0
:
0
]
APBSLOT3ENABLE
=
1
,
parameter
[
0
:
0
]
APBSLOT4ENABLE
=
1
,
parameter
[
0
:
0
]
APBSLOT5ENABLE
=
1
,
parameter
[
0
:
0
]
APBSLOT6ENABLE
=
1
,
parameter
[
0
:
0
]
APBSLOT7ENABLE
=
1
,
parameter
[
0
:
0
]
APBSLOT8ENABLE
=
1
,
parameter
[
0
:
0
]
APBSLOT9ENABLE
=
1
,
parameter
[
0
:
0
]
APBSLOT10ENABLE
=
1
,
parameter
[
0
:
0
]
APBSLOT11ENABLE
=
1
,
parameter
[
0
:
0
]
APBSLOT12ENABLE
=
1
,
parameter
[
0
:
0
]
APBSLOT13ENABLE
=
1
,
parameter
[
0
:
0
]
APBSLOT14ENABLE
=
1
,
parameter
[
0
:
0
]
APBSLOT15ENABLE
=
1
,
parameter
[
0
:
0
]
SC_0
=
0
,
parameter
[
0
:
0
]
SC_1
=
0
,
parameter
[
0
:
0
]
SC_2
=
0
,
parameter
[
0
:
0
]
SC_3
=
0
,
parameter
[
0
:
0
]
SC_4
=
0
,
parameter
[
0
:
0
]
SC_5
=
0
,
parameter
[
0
:
0
]
SC_6
=
0
,
parameter
[
0
:
0
]
SC_7
=
0
,
parameter
[
0
:
0
]
SC_8
=
0
,
parameter
[
0
:
0
]
SC_9
=
0
,
parameter
[
0
:
0
]
SC_10
=
0
,
parameter
[
0
:
0
]
SC_11
=
0
,
parameter
[
0
:
0
]
SC_12
=
0
,
parameter
[
0
:
0
]
SC_13
=
0
,
parameter
[
0
:
0
]
SC_14
=
0
,
parameter
[
0
:
0
]
SC_15
=
0
,
parameter
[
5
:
0
]
MADDR_BITS
=
32
,
parameter
[
3
:
0
]
UPR_NIBBLE_POSN
=
7
)
(
input
[
31
:
0
]
IADDR,
input
PRESETN,
input
PCLK,
input
[
31
:
0
]
PADDR,
input
PWRITE,
input
PENABLE,
input
PSEL,
input
[
31
:
0
]
PWDATA,
output
wire
[
31
:
0
]
PRDATA,
output
wire
PREADY,
output
wire
PSLVERR,
output
reg
[
31
:
0
]
PADDRS,
output
wire
PWRITES,
output
wire
PENABLES,
output
wire
[
31
:
0
]
PWDATAS,
output
wire
PSELS0,
output
wire
PSELS1,
output
wire
PSELS2,
output
wire
PSELS3,
output
wire
PSELS4,
output
wire
PSELS5,
output
wire
PSELS6,
output
wire
PSELS7,
output
wire
PSELS8,
output
wire
PSELS9,
output
wire
PSELS10,
output
wire
PSELS11,
output
wire
PSELS12,
output
wire
PSELS13,
output
wire
PSELS14,
output
wire
PSELS15,
output
reg
PSELS16,
input
[
31
:
0
]
PRDATAS0,
input
[
31
:
0
]
PRDATAS1,
input
[
31
:
0
]
PRDATAS2,
input
[
31
:
0
]
PRDATAS3,
input
[
31
:
0
]
PRDATAS4,
input
[
31
:
0
]
PRDATAS5,
input
[
31
:
0
]
PRDATAS6,
input
[
31
:
0
]
PRDATAS7,
input
[
31
:
0
]
PRDATAS8,
input
[
31
:
0
]
PRDATAS9,
input
[
31
:
0
]
PRDATAS10,
input
[
31
:
0
]
PRDATAS11,
input
[
31
:
0
]
PRDATAS12,
input
[
31
:
0
]
PRDATAS13,
input
[
31
:
0
]
PRDATAS14,
input
[
31
:
0
]
PRDATAS15,
input
[
31
:
0
]
PRDATAS16,
input
PREADYS0,
input
PREADYS1,
input
PREADYS2,
input
PREADYS3,
input
PREADYS4,
input
PREADYS5,
input
PREADYS6,
input
PREADYS7,
input
PREADYS8,
input
PREADYS9,
input
PREADYS10,
input
PREADYS11,
input
PREADYS12,
input
PREADYS13,
input
PREADYS14,
input
PREADYS15,
input
PREADYS16,
input
PSLVERRS0,
input
PSLVERRS1,
input
PSLVERRS2,
input
PSLVERRS3,
input
PSLVERRS4,
input
PSLVERRS5,
input
PSLVERRS6,
input
PSLVERRS7,
input
PSLVERRS8,
input
PSLVERRS9,
input
PSLVERRS10,
input
PSLVERRS11,
input
PSLVERRS12,
input
PSLVERRS13,
input
PSLVERRS14,
input
PSLVERRS15,
input
PSLVERRS16
)
;
localparam
CAPB3I1I
=
0
;
localparam
CAPB3l1I
=
1
;
localparam
CAPB3OOl
=
2
;
localparam
CAPB3IOl
=
3
;
localparam
CAPB3lOl
=
4
;
localparam
CAPB3OIl
=
5
;
localparam
CAPB3IIl
=
6
;
localparam
CAPB3lIl
=
7
;
localparam
CAPB3Oll
=
8
;
localparam
CAPB3Ill
=
9
;
localparam
CAPB3lll
=
10
;
localparam
CAPB3O0l
=
11
;
localparam
CAPB3I0l
=
12
;
localparam
CAPB3l0l
=
13
;
localparam
CAPB3O1l
=
14
;
localparam
CAPB3I1l
=
15
;
localparam
CAPB3l1l
=
16
;
localparam
CAPB3OO0
=
17
;
localparam
[
15
:
0
]
CAPB3IO0
=
(
APBSLOT0ENABLE
||
SC_0
||
(
IADDR_OPTION
==
CAPB3OOl
)
)
*
(
2
**
0
)
;
localparam
[
15
:
0
]
CAPB3lO0
=
(
APBSLOT1ENABLE
||
SC_1
||
(
IADDR_OPTION
==
CAPB3IOl
)
)
*
(
2
**
1
)
;
localparam
[
15
:
0
]
CAPB3OI0
=
(
APBSLOT2ENABLE
||
SC_2
||
(
IADDR_OPTION
==
CAPB3lOl
)
)
*
(
2
**
2
)
;
localparam
[
15
:
0
]
CAPB3II0
=
(
APBSLOT3ENABLE
||
SC_3
||
(
IADDR_OPTION
==
CAPB3OIl
)
)
*
(
2
**
3
)
;
localparam
[
15
:
0
]
CAPB3lI0
=
(
APBSLOT4ENABLE
||
SC_4
||
(
IADDR_OPTION
==
CAPB3IIl
)
)
*
(
2
**
4
)
;
localparam
[
15
:
0
]
CAPB3Ol0
=
(
APBSLOT5ENABLE
||
SC_5
||
(
IADDR_OPTION
==
CAPB3lIl
)
)
*
(
2
**
5
)
;
localparam
[
15
:
0
]
CAPB3Il0
=
(
APBSLOT6ENABLE
||
SC_6
||
(
IADDR_OPTION
==
CAPB3Oll
)
)
*
(
2
**
6
)
;
localparam
[
15
:
0
]
CAPB3ll0
=
(
APBSLOT7ENABLE
||
SC_7
||
(
IADDR_OPTION
==
CAPB3Ill
)
)
*
(
2
**
7
)
;
localparam
[
15
:
0
]
CAPB3O00
=
(
APBSLOT8ENABLE
||
SC_8
||
(
IADDR_OPTION
==
CAPB3lll
)
)
*
(
2
**
8
)
;
localparam
[
15
:
0
]
CAPB3I00
=
(
APBSLOT9ENABLE
||
SC_9
||
(
IADDR_OPTION
==
CAPB3O0l
)
)
*
(
2
**
9
)
;
localparam
[
15
:
0
]
CAPB3l00
=
(
APBSLOT10ENABLE
||
SC_10
||
(
IADDR_OPTION
==
CAPB3I0l
)
)
*
(
2
**
10
)
;
localparam
[
15
:
0
]
CAPB3O10
=
(
APBSLOT11ENABLE
||
SC_11
||
(
IADDR_OPTION
==
CAPB3l0l
)
)
*
(
2
**
11
)
;
localparam
[
15
:
0
]
CAPB3I10
=
(
APBSLOT12ENABLE
||
SC_12
||
(
IADDR_OPTION
==
CAPB3O1l
)
)
*
(
2
**
12
)
;
localparam
[
15
:
0
]
CAPB3l10
=
(
APBSLOT13ENABLE
||
SC_13
||
(
IADDR_OPTION
==
CAPB3I1l
)
)
*
(
2
**
13
)
;
localparam
[
15
:
0
]
CAPB3OO1
=
(
APBSLOT14ENABLE
||
SC_14
||
(
IADDR_OPTION
==
CAPB3l1l
)
)
*
(
2
**
14
)
;
localparam
[
15
:
0
]
CAPB3IO1
=
(
APBSLOT15ENABLE
||
SC_15
||
(
IADDR_OPTION
==
CAPB3OO0
)
)
*
(
2
**
15
)
;
localparam
[
15
:
0
]
CAPB3lO1
=
{
SC_15
,
SC_14
,
SC_13
,
SC_12
,
SC_11
,
SC_10
,
SC_9
,
SC_8
,
SC_7
,
SC_6
,
SC_5
,
SC_4
,
SC_3
,
SC_2
,
SC_1
,
SC_0
}
;
localparam
[
15
:
0
]
CAPB3OI1
=
CAPB3lO1
&
{
(
IADDR_OPTION
!=
CAPB3OO0
)
,
(
IADDR_OPTION
!=
CAPB3l1l
)
,
(
IADDR_OPTION
!=
CAPB3I1l
)
,
(
IADDR_OPTION
!=
CAPB3O1l
)
,
(
IADDR_OPTION
!=
CAPB3l0l
)
,
(
IADDR_OPTION
!=
CAPB3I0l
)
,
(
IADDR_OPTION
!=
CAPB3O0l
)
,
(
IADDR_OPTION
!=
CAPB3lll
)
,
(
IADDR_OPTION
!=
CAPB3Ill
)
,
(
IADDR_OPTION
!=
CAPB3Oll
)
,
(
IADDR_OPTION
!=
CAPB3lIl
)
,
(
IADDR_OPTION
!=
CAPB3IIl
)
,
(
IADDR_OPTION
!=
CAPB3OIl
)
,
(
IADDR_OPTION
!=
CAPB3lOl
)
,
(
IADDR_OPTION
!=
CAPB3IOl
)
,
(
IADDR_OPTION
!=
CAPB3OOl
)
}
;
wire
[
31
:
0
]
CAPB3I0I
;
wire
[
31
:
0
]
CAPB3II1
;
wire
[
31
:
0
]
CAPB3lI1
;
wire
[
31
:
0
]
CAPB3Ol1
;
wire
[
31
:
0
]
CAPB3Il1
;
wire
[
31
:
0
]
CAPB3ll1
;
wire
[
31
:
0
]
CAPB3O01
;
wire
[
31
:
0
]
CAPB3I01
;
wire
[
31
:
0
]
CAPB3l01
;
wire
[
31
:
0
]
CAPB3O11
;
wire
[
31
:
0
]
CAPB3I11
;
wire
[
31
:
0
]
CAPB3l11
;
wire
[
31
:
0
]
CAPB3OOOI
;
wire
[
31
:
0
]
CAPB3IOOI
;
wire
[
31
:
0
]
CAPB3lOOI
;
wire
[
31
:
0
]
CAPB3OIOI
;
wire
[
31
:
0
]
CAPB3IIOI
;
wire
[
31
:
0
]
CAPB3lIOI
;
wire
[
15
:
0
]
CAPB3OlOI
;
wire
[
15
:
0
]
CAPB3IlOI
;
reg
[
15
:
0
]
CAPB3llOI
;
reg
[
15
:
0
]
CAPB3O0OI
;
wire
[
3
:
0
]
CAPB3I0OI
;
wire
[
31
:
0
]
CAPB3I
;
wire
[
31
:
0
]
CAPB3l0OI
;
wire
[
31
:
0
]
CAPB3O1OI
;
wire
[
31
:
0
]
CAPB3I1OI
;
wire
CAPB3l1OI
;
wire
CAPB3OOII
;
assign
CAPB3I1OI
=
32
'b
0
;
assign
CAPB3l1OI
=
1
'b
1
;
assign
CAPB3OOII
=
1
'b
0
;
assign
PWRITES
=
PWRITE
;
assign
PENABLES
=
PENABLE
;
assign
PWDATAS
=
PWDATA
[
31
:
0
]
;
assign
CAPB3I0OI
=
PADDR
[
MADDR_BITS
-
1
:
MADDR_BITS
-
4
]
;
always
@(*)
begin
if
(
PSEL
==
1
'b
1
)
begin
case
(
CAPB3I0OI
)
4
'b
0000
:
CAPB3llOI
=
CAPB3IO0
;
4
'b
0001
:
CAPB3llOI
=
CAPB3lO0
;
4
'b
0010
:
CAPB3llOI
=
CAPB3OI0
;
4
'b
0011
:
CAPB3llOI
=
CAPB3II0
;
4
'b
0100
:
CAPB3llOI
=
CAPB3lI0
;
4
'b
0101
:
CAPB3llOI
=
CAPB3Ol0
;
4
'b
0110
:
CAPB3llOI
=
CAPB3Il0
;
4
'b
0111
:
CAPB3llOI
=
CAPB3ll0
;
4
'b
1000
:
CAPB3llOI
=
CAPB3O00
;
4
'b
1001
:
CAPB3llOI
=
CAPB3I00
;
4
'b
1010
:
CAPB3llOI
=
CAPB3l00
;
4
'b
1011
:
CAPB3llOI
=
CAPB3O10
;
4
'b
1100
:
CAPB3llOI
=
CAPB3I10
;
4
'b
1101
:
CAPB3llOI
=
CAPB3l10
;
4
'b
1110
:
CAPB3llOI
=
CAPB3OO1
;
4
'b
1111
:
CAPB3llOI
=
CAPB3IO1
;
default
:
CAPB3llOI
=
16
'b
0000000000000000
;
endcase
CAPB3O0OI
[
15
:
0
]
=
CAPB3llOI
&
~
CAPB3OI1
;
PSELS16
=
|
(
CAPB3llOI
&
CAPB3OI1
)
;
end
else
begin
CAPB3O0OI
=
16
'b
0000000000000000
;
PSELS16
=
1
'b
0
;
end
end
generate
begin
:
CAPB3IOII
if
(
IADDR_OPTION
==
CAPB3OOl
)
assign
CAPB3II1
[
31
:
0
]
=
CAPB3lIOI
[
31
:
0
]
;
else
if
(
APBSLOT0ENABLE
)
assign
CAPB3II1
[
31
:
0
]
=
PRDATAS0
[
31
:
0
]
;
else
assign
CAPB3II1
[
31
:
0
]
=
CAPB3I1OI
;
if
(
IADDR_OPTION
==
CAPB3IOl
)
assign
CAPB3lI1
[
31
:
0
]
=
CAPB3lIOI
[
31
:
0
]
;
else
if
(
APBSLOT1ENABLE
)
assign
CAPB3lI1
[
31
:
0
]
=
PRDATAS1
[
31
:
0
]
;
else
assign
CAPB3lI1
[
31
:
0
]
=
CAPB3I1OI
;
if
(
IADDR_OPTION
==
CAPB3lOl
)
assign
CAPB3Ol1
[
31
:
0
]
=
CAPB3lIOI
[
31
:
0
]
;
else
if
(
APBSLOT2ENABLE
)
assign
CAPB3Ol1
[
31
:
0
]
=
PRDATAS2
[
31
:
0
]
;
else
assign
CAPB3Ol1
[
31
:
0
]
=
CAPB3I1OI
;
if
(
IADDR_OPTION
==
CAPB3OIl
)
assign
CAPB3Il1
[
31
:
0
]
=
CAPB3lIOI
[
31
:
0
]
;
else
if
(
APBSLOT3ENABLE
)
assign
CAPB3Il1
[
31
:
0
]
=
PRDATAS3
[
31
:
0
]
;
else
assign
CAPB3Il1
[
31
:
0
]
=
CAPB3I1OI
;
if
(
IADDR_OPTION
==
CAPB3IIl
)
assign
CAPB3ll1
[
31
:
0
]
=
CAPB3lIOI
[
31
:
0
]
;
else
if
(
APBSLOT4ENABLE
)
assign
CAPB3ll1
[
31
:
0
]
=
PRDATAS4
[
31
:
0
]
;
else
assign
CAPB3ll1
[
31
:
0
]
=
CAPB3I1OI
;
if
(
IADDR_OPTION
==
CAPB3lIl
)
assign
CAPB3O01
[
31
:
0
]
=
CAPB3lIOI
[
31
:
0
]
;
else
if
(
APBSLOT5ENABLE
)
assign
CAPB3O01
[
31
:
0
]
=
PRDATAS5
[
31
:
0
]
;
else
assign
CAPB3O01
[
31
:
0
]
=
CAPB3I1OI
;
if
(
IADDR_OPTION
==
CAPB3Oll
)
assign
CAPB3I01
[
31
:
0
]
=
CAPB3lIOI
[
31
:
0
]
;
else
if
(
APBSLOT6ENABLE
)
assign
CAPB3I01
[
31
:
0
]
=
PRDATAS6
[
31
:
0
]
;
else
assign
CAPB3I01
[
31
:
0
]
=
CAPB3I1OI
;
if
(
IADDR_OPTION
==
CAPB3Ill
)
assign
CAPB3l01
[
31
:
0
]
=
CAPB3lIOI
[
31
:
0
]
;
else
if
(
APBSLOT7ENABLE
)
assign
CAPB3l01
[
31
:
0
]
=
PRDATAS7
[
31
:
0
]
;
else
assign
CAPB3l01
[
31
:
0
]
=
CAPB3I1OI
;
if
(
IADDR_OPTION
==
CAPB3lll
)
assign
CAPB3O11
[
31
:
0
]
=
CAPB3lIOI
[
31
:
0
]
;
else
if
(
APBSLOT8ENABLE
)
assign
CAPB3O11
[
31
:
0
]
=
PRDATAS8
[
31
:
0
]
;
else
assign
CAPB3O11
[
31
:
0
]
=
CAPB3I1OI
;
if
(
IADDR_OPTION
==
CAPB3O0l
)
assign
CAPB3I11
[
31
:
0
]
=
CAPB3lIOI
[
31
:
0
]
;
else
if
(
APBSLOT9ENABLE
)
assign
CAPB3I11
[
31
:
0
]
=
PRDATAS9
[
31
:
0
]
;
else
assign
CAPB3I11
[
31
:
0
]
=
CAPB3I1OI
;
if
(
IADDR_OPTION
==
CAPB3I0l
)
assign
CAPB3l11
[
31
:
0
]
=
CAPB3lIOI
[
31
:
0
]
;
else
if
(
APBSLOT10ENABLE
)
assign
CAPB3l11
[
31
:
0
]
=
PRDATAS10
[
31
:
0
]
;
else
assign
CAPB3l11
[
31
:
0
]
=
CAPB3I1OI
;
if
(
IADDR_OPTION
==
CAPB3l0l
)
assign
CAPB3OOOI
[
31
:
0
]
=
CAPB3lIOI
[
31
:
0
]
;
else
if
(
APBSLOT11ENABLE
)
assign
CAPB3OOOI
[
31
:
0
]
=
PRDATAS11
[
31
:
0
]
;
else
assign
CAPB3OOOI
[
31
:
0
]
=
CAPB3I1OI
;
if
(
IADDR_OPTION
==
CAPB3O1l
)
assign
CAPB3IOOI
[
31
:
0
]
=
CAPB3lIOI
[
31
:
0
]
;
else
if
(
APBSLOT12ENABLE
)
assign
CAPB3IOOI
[
31
:
0
]
=
PRDATAS12
[
31
:
0
]
;
else
assign
CAPB3IOOI
[
31
:
0
]
=
CAPB3I1OI
;
if
(
IADDR_OPTION
==
CAPB3I1l
)
assign
CAPB3lOOI
[
31
:
0
]
=
CAPB3lIOI
[
31
:
0
]
;
else
if
(
APBSLOT13ENABLE
)
assign
CAPB3lOOI
[
31
:
0
]
=
PRDATAS13
[
31
:
0
]
;
else
assign
CAPB3lOOI
[
31
:
0
]
=
CAPB3I1OI
;
if
(
IADDR_OPTION
==
CAPB3l1l
)
assign
CAPB3OIOI
[
31
:
0
]
=
CAPB3lIOI
[
31
:
0
]
;
else
if
(
APBSLOT14ENABLE
)
assign
CAPB3OIOI
[
31
:
0
]
=
PRDATAS14
[
31
:
0
]
;
else
assign
CAPB3OIOI
[
31
:
0
]
=
CAPB3I1OI
;
if
(
IADDR_OPTION
==
CAPB3OO0
)
assign
CAPB3IIOI
[
31
:
0
]
=
CAPB3lIOI
[
31
:
0
]
;
else
if
(
APBSLOT15ENABLE
)
assign
CAPB3IIOI
[
31
:
0
]
=
PRDATAS15
[
31
:
0
]
;
else
assign
CAPB3IIOI
[
31
:
0
]
=
CAPB3I1OI
;
if
(
IADDR_OPTION
==
CAPB3OOl
)
assign
CAPB3OlOI
[
0
]
=
CAPB3l1OI
;
else
if
(
APBSLOT0ENABLE
)
assign
CAPB3OlOI
[
0
]
=
PREADYS0
;
else
assign
CAPB3OlOI
[
0
]
=
CAPB3l1OI
;
if
(
IADDR_OPTION
==
CAPB3IOl
)
assign
CAPB3OlOI
[
1
]
=
CAPB3l1OI
;
else
if
(
APBSLOT1ENABLE
)
assign
CAPB3OlOI
[
1
]
=
PREADYS1
;
else
assign
CAPB3OlOI
[
1
]
=
CAPB3l1OI
;
if
(
IADDR_OPTION
==
CAPB3lOl
)
assign
CAPB3OlOI
[
2
]
=
CAPB3l1OI
;
else
if
(
APBSLOT2ENABLE
)
assign
CAPB3OlOI
[
2
]
=
PREADYS2
;
else
assign
CAPB3OlOI
[
2
]
=
CAPB3l1OI
;
if
(
IADDR_OPTION
==
CAPB3OIl
)
assign
CAPB3OlOI
[
3
]
=
CAPB3l1OI
;
else
if
(
APBSLOT3ENABLE
)
assign
CAPB3OlOI
[
3
]
=
PREADYS3
;
else
assign
CAPB3OlOI
[
3
]
=
CAPB3l1OI
;
if
(
IADDR_OPTION
==
CAPB3IIl
)
assign
CAPB3OlOI
[
4
]
=
CAPB3l1OI
;
else
if
(
APBSLOT4ENABLE
)
assign
CAPB3OlOI
[
4
]
=
PREADYS4
;
else
assign
CAPB3OlOI
[
4
]
=
CAPB3l1OI
;
if
(
IADDR_OPTION
==
CAPB3lIl
)
assign
CAPB3OlOI
[
5
]
=
CAPB3l1OI
;
else
if
(
APBSLOT5ENABLE
)
assign
CAPB3OlOI
[
5
]
=
PREADYS5
;
else
assign
CAPB3OlOI
[
5
]
=
CAPB3l1OI
;
if
(
IADDR_OPTION
==
CAPB3Oll
)
assign
CAPB3OlOI
[
6
]
=
CAPB3l1OI
;
else
if
(
APBSLOT6ENABLE
)
assign
CAPB3OlOI
[
6
]
=
PREADYS6
;
else
assign
CAPB3OlOI
[
6
]
=
CAPB3l1OI
;
if
(
IADDR_OPTION
==
CAPB3Ill
)
assign
CAPB3OlOI
[
7
]
=
CAPB3l1OI
;
else
if
(
APBSLOT7ENABLE
)
assign
CAPB3OlOI
[
7
]
=
PREADYS7
;
else
assign
CAPB3OlOI
[
7
]
=
CAPB3l1OI
;
if
(
IADDR_OPTION
==
CAPB3lll
)
assign
CAPB3OlOI
[
8
]
=
CAPB3l1OI
;
else
if
(
APBSLOT8ENABLE
)
assign
CAPB3OlOI
[
8
]
=
PREADYS8
;
else
assign
CAPB3OlOI
[
8
]
=
CAPB3l1OI
;
if
(
IADDR_OPTION
==
CAPB3O0l
)
assign
CAPB3OlOI
[
9
]
=
CAPB3l1OI
;
else
if
(
APBSLOT9ENABLE
)
assign
CAPB3OlOI
[
9
]
=
PREADYS9
;
else
assign
CAPB3OlOI
[
9
]
=
CAPB3l1OI
;
if
(
IADDR_OPTION
==
CAPB3I0l
)
assign
CAPB3OlOI
[
10
]
=
CAPB3l1OI
;
else
if
(
APBSLOT10ENABLE
)
assign
CAPB3OlOI
[
10
]
=
PREADYS10
;
else
assign
CAPB3OlOI
[
10
]
=
CAPB3l1OI
;
if
(
IADDR_OPTION
==
CAPB3l0l
)
assign
CAPB3OlOI
[
11
]
=
CAPB3l1OI
;
else
if
(
APBSLOT11ENABLE
)
assign
CAPB3OlOI
[
11
]
=
PREADYS11
;
else
assign
CAPB3OlOI
[
11
]
=
CAPB3l1OI
;
if
(
IADDR_OPTION
==
CAPB3O1l
)
assign
CAPB3OlOI
[
12
]
=
CAPB3l1OI
;
else
if
(
APBSLOT12ENABLE
)
assign
CAPB3OlOI
[
12
]
=
PREADYS12
;
else
assign
CAPB3OlOI
[
12
]
=
CAPB3l1OI
;
if
(
IADDR_OPTION
==
CAPB3I1l
)
assign
CAPB3OlOI
[
13
]
=
CAPB3l1OI
;
else
if
(
APBSLOT13ENABLE
)
assign
CAPB3OlOI
[
13
]
=
PREADYS13
;
else
assign
CAPB3OlOI
[
13
]
=
CAPB3l1OI
;
if
(
IADDR_OPTION
==
CAPB3l1l
)
assign
CAPB3OlOI
[
14
]
=
CAPB3l1OI
;
else
if
(
APBSLOT14ENABLE
)
assign
CAPB3OlOI
[
14
]
=
PREADYS14
;
else
assign
CAPB3OlOI
[
14
]
=
CAPB3l1OI
;
if
(
IADDR_OPTION
==
CAPB3OO0
)
assign
CAPB3OlOI
[
15
]
=
CAPB3l1OI
;
else
if
(
APBSLOT15ENABLE
)
assign
CAPB3OlOI
[
15
]
=
PREADYS15
;
else
assign
CAPB3OlOI
[
15
]
=
CAPB3l1OI
;
if
(
IADDR_OPTION
==
CAPB3OOl
)
assign
CAPB3IlOI
[
0
]
=
CAPB3OOII
;
else
if
(
APBSLOT0ENABLE
)
assign
CAPB3IlOI
[
0
]
=
PSLVERRS0
;
else
assign
CAPB3IlOI
[
0
]
=
CAPB3OOII
;
if
(
IADDR_OPTION
==
CAPB3IOl
)
assign
CAPB3IlOI
[
1
]
=
CAPB3OOII
;
else
if
(
APBSLOT1ENABLE
)
assign
CAPB3IlOI
[
1
]
=
PSLVERRS1
;
else
assign
CAPB3IlOI
[
1
]
=
CAPB3OOII
;
if
(
IADDR_OPTION
==
CAPB3lOl
)
assign
CAPB3IlOI
[
2
]
=
CAPB3OOII
;
else
if
(
APBSLOT2ENABLE
)
assign
CAPB3IlOI
[
2
]
=
PSLVERRS2
;
else
assign
CAPB3IlOI
[
2
]
=
CAPB3OOII
;
if
(
IADDR_OPTION
==
CAPB3OIl
)
assign
CAPB3IlOI
[
3
]
=
CAPB3OOII
;
else
if
(
APBSLOT3ENABLE
)
assign
CAPB3IlOI
[
3
]
=
PSLVERRS3
;
else
assign
CAPB3IlOI
[
3
]
=
CAPB3OOII
;
if
(
IADDR_OPTION
==
CAPB3IIl
)
assign
CAPB3IlOI
[
4
]
=
CAPB3OOII
;
else
if
(
APBSLOT4ENABLE
)
assign
CAPB3IlOI
[
4
]
=
PSLVERRS4
;
else
assign
CAPB3IlOI
[
4
]
=
CAPB3OOII
;
if
(
IADDR_OPTION
==
CAPB3lIl
)
assign
CAPB3IlOI
[
5
]
=
CAPB3OOII
;
else
if
(
APBSLOT5ENABLE
)
assign
CAPB3IlOI
[
5
]
=
PSLVERRS5
;
else
assign
CAPB3IlOI
[
5
]
=
CAPB3OOII
;
if
(
IADDR_OPTION
==
CAPB3Oll
)
assign
CAPB3IlOI
[
6
]
=
CAPB3OOII
;
else
if
(
APBSLOT6ENABLE
)
assign
CAPB3IlOI
[
6
]
=
PSLVERRS6
;
else
assign
CAPB3IlOI
[
6
]
=
CAPB3OOII
;
if
(
IADDR_OPTION
==
CAPB3Ill
)
assign
CAPB3IlOI
[
7
]
=
CAPB3OOII
;
else
if
(
APBSLOT7ENABLE
)
assign
CAPB3IlOI
[
7
]
=
PSLVERRS7
;
else
assign
CAPB3IlOI
[
7
]
=
CAPB3OOII
;
if
(
IADDR_OPTION
==
CAPB3lll
)
assign
CAPB3IlOI
[
8
]
=
CAPB3OOII
;
else
if
(
APBSLOT8ENABLE
)
assign
CAPB3IlOI
[
8
]
=
PSLVERRS8
;
else
assign
CAPB3IlOI
[
8
]
=
CAPB3OOII
;
if
(
IADDR_OPTION
==
CAPB3O0l
)
assign
CAPB3IlOI
[
9
]
=
CAPB3OOII
;
else
if
(
APBSLOT9ENABLE
)
assign
CAPB3IlOI
[
9
]
=
PSLVERRS9
;
else
assign
CAPB3IlOI
[
9
]
=
CAPB3OOII
;
if
(
IADDR_OPTION
==
CAPB3I0l
)
assign
CAPB3IlOI
[
10
]
=
CAPB3OOII
;
else
if
(
APBSLOT10ENABLE
)
assign
CAPB3IlOI
[
10
]
=
PSLVERRS10
;
else
assign
CAPB3IlOI
[
10
]
=
CAPB3OOII
;
if
(
IADDR_OPTION
==
CAPB3l0l
)
assign
CAPB3IlOI
[
11
]
=
CAPB3OOII
;
else
if
(
APBSLOT11ENABLE
)
assign
CAPB3IlOI
[
11
]
=
PSLVERRS11
;
else
assign
CAPB3IlOI
[
11
]
=
CAPB3OOII
;
if
(
IADDR_OPTION
==
CAPB3O1l
)
assign
CAPB3IlOI
[
12
]
=
CAPB3OOII
;
else
if
(
APBSLOT12ENABLE
)
assign
CAPB3IlOI
[
12
]
=
PSLVERRS12
;
else
assign
CAPB3IlOI
[
12
]
=
CAPB3OOII
;
if
(
IADDR_OPTION
==
CAPB3I1l
)
assign
CAPB3IlOI
[
13
]
=
CAPB3OOII
;
else
if
(
APBSLOT13ENABLE
)
assign
CAPB3IlOI
[
13
]
=
PSLVERRS13
;
else
assign
CAPB3IlOI
[
13
]
=
CAPB3OOII
;
if
(
IADDR_OPTION
==
CAPB3l1l
)
assign
CAPB3IlOI
[
14
]
=
CAPB3OOII
;
else
if
(
APBSLOT14ENABLE
)
assign
CAPB3IlOI
[
14
]
=
PSLVERRS14
;
else
assign
CAPB3IlOI
[
14
]
=
CAPB3OOII
;
if
(
IADDR_OPTION
==
CAPB3OO0
)
assign
CAPB3IlOI
[
15
]
=
CAPB3OOII
;
else
if
(
APBSLOT15ENABLE
)
assign
CAPB3IlOI
[
15
]
=
PSLVERRS15
;
else
assign
CAPB3IlOI
[
15
]
=
CAPB3OOII
;
end
endgenerate
CAPB3l
CAPB3lOII
(
.CAPB3OI
(
{
PSELS16
,
CAPB3O0OI
[
15
:
0
]
}
)
,
.PRDATAS0
(
CAPB3II1
[
31
:
0
]
)
,
.PRDATAS1
(
CAPB3lI1
[
31
:
0
]
)
,
.PRDATAS2
(
CAPB3Ol1
[
31
:
0
]
)
,
.PRDATAS3
(
CAPB3Il1
[
31
:
0
]
)
,
.PRDATAS4
(
CAPB3ll1
[
31
:
0
]
)
,
.PRDATAS5
(
CAPB3O01
[
31
:
0
]
)
,
.PRDATAS6
(
CAPB3I01
[
31
:
0
]
)
,
.PRDATAS7
(
CAPB3l01
[
31
:
0
]
)
,
.PRDATAS8
(
CAPB3O11
[
31
:
0
]
)
,
.PRDATAS9
(
CAPB3I11
[
31
:
0
]
)
,
.PRDATAS10
(
CAPB3l11
[
31
:
0
]
)
,
.PRDATAS11
(
CAPB3OOOI
[
31
:
0
]
)
,
.PRDATAS12
(
CAPB3IOOI
[
31
:
0
]
)
,
.PRDATAS13
(
CAPB3lOOI
[
31
:
0
]
)
,
.PRDATAS14
(
CAPB3OIOI
[
31
:
0
]
)
,
.PRDATAS15
(
CAPB3IIOI
[
31
:
0
]
)
,
.PRDATAS16
(
PRDATAS16
[
31
:
0
]
)
,
.CAPB3II
(
{
PREADYS16
,
CAPB3OlOI
[
15
:
0
]
}
)
,
.CAPB3lI
(
{
PSLVERRS16
,
CAPB3IlOI
[
15
:
0
]
}
)
,
.PREADY
(
PREADY
)
,
.PSLVERR
(
PSLVERR
)
,
.PRDATA
(
CAPB3I0I
[
31
:
0
]
)
)
;
assign
PRDATA
[
31
:
0
]
=
CAPB3I0I
[
31
:
0
]
;
generate
begin
:
CAPB3OIII
if
(
IADDR_OPTION
==
CAPB3OOl
)
assign
PSELS0
=
1
'b
0
;
else
assign
PSELS0
=
CAPB3O0OI
[
0
]
;
if
(
IADDR_OPTION
==
CAPB3IOl
)
assign
PSELS1
=
1
'b
0
;
else
assign
PSELS1
=
CAPB3O0OI
[
1
]
;
if
(
IADDR_OPTION
==
CAPB3lOl
)
assign
PSELS2
=
1
'b
0
;
else
assign
PSELS2
=
CAPB3O0OI
[
2
]
;
if
(
IADDR_OPTION
==
CAPB3OIl
)
assign
PSELS3
=
1
'b
0
;
else
assign
PSELS3
=
CAPB3O0OI
[
3
]
;
if
(
IADDR_OPTION
==
CAPB3IIl
)
assign
PSELS4
=
1
'b
0
;
else
assign
PSELS4
=
CAPB3O0OI
[
4
]
;
if
(
IADDR_OPTION
==
CAPB3lIl
)
assign
PSELS5
=
1
'b
0
;
else
assign
PSELS5
=
CAPB3O0OI
[
5
]
;
if
(
IADDR_OPTION
==
CAPB3Oll
)
assign
PSELS6
=
1
'b
0
;
else
assign
PSELS6
=
CAPB3O0OI
[
6
]
;
if
(
IADDR_OPTION
==
CAPB3Ill
)
assign
PSELS7
=
1
'b
0
;
else
assign
PSELS7
=
CAPB3O0OI
[
7
]
;
if
(
IADDR_OPTION
==
CAPB3lll
)
assign
PSELS8
=
1
'b
0
;
else
assign
PSELS8
=
CAPB3O0OI
[
8
]
;
if
(
IADDR_OPTION
==
CAPB3O0l
)
assign
PSELS9
=
1
'b
0
;
else
assign
PSELS9
=
CAPB3O0OI
[
9
]
;
if
(
IADDR_OPTION
==
CAPB3I0l
)
assign
PSELS10
=
1
'b
0
;
else
assign
PSELS10
=
CAPB3O0OI
[
10
]
;
if
(
IADDR_OPTION
==
CAPB3l0l
)
assign
PSELS11
=
1
'b
0
;
else
assign
PSELS11
=
CAPB3O0OI
[
11
]
;
if
(
IADDR_OPTION
==
CAPB3O1l
)
assign
PSELS12
=
1
'b
0
;
else
assign
PSELS12
=
CAPB3O0OI
[
12
]
;
if
(
IADDR_OPTION
==
CAPB3I1l
)
assign
PSELS13
=
1
'b
0
;
else
assign
PSELS13
=
CAPB3O0OI
[
13
]
;
if
(
IADDR_OPTION
==
CAPB3l1l
)
assign
PSELS14
=
1
'b
0
;
else
assign
PSELS14
=
CAPB3O0OI
[
14
]
;
if
(
IADDR_OPTION
==
CAPB3OO0
)
assign
PSELS15
=
1
'b
0
;
else
assign
PSELS15
=
CAPB3O0OI
[
15
]
;
end
endgenerate
generate
begin
:
CAPB3IIII
if
(
IADDR_OPTION
==
CAPB3I1I
)
assign
CAPB3I
=
32
'b
0
;
if
(
IADDR_OPTION
==
CAPB3l1I
)
assign
CAPB3I
=
32
'b
0
;
if
(
IADDR_OPTION
==
CAPB3OOl
)
CAPB3O
#
(
APB_DWIDTH
,
MADDR_BITS
)
CAPB3lIII
(
PCLK
,
PRESETN
,
PENABLE
,
CAPB3O0OI
[
0
]
,
PADDR
,
PWRITE
,
PWDATA
,
CAPB3lIOI
,
CAPB3I
)
;
if
(
IADDR_OPTION
==
CAPB3IOl
)
CAPB3O
#
(
APB_DWIDTH
,
MADDR_BITS
)
CAPB3lIII
(
PCLK
,
PRESETN
,
PENABLE
,
CAPB3O0OI
[
1
]
,
PADDR
,
PWRITE
,
PWDATA
,
CAPB3lIOI
,
CAPB3I
)
;
if
(
IADDR_OPTION
==
CAPB3lOl
)
CAPB3O
#
(
APB_DWIDTH
,
MADDR_BITS
)
CAPB3lIII
(
PCLK
,
PRESETN
,
PENABLE
,
CAPB3O0OI
[
2
]
,
PADDR
,
PWRITE
,
PWDATA
,
CAPB3lIOI
,
CAPB3I
)
;
if
(
IADDR_OPTION
==
CAPB3OIl
)
CAPB3O
#
(
APB_DWIDTH
,
MADDR_BITS
)
CAPB3lIII
(
PCLK
,
PRESETN
,
PENABLE
,
CAPB3O0OI
[
3
]
,
PADDR
,
PWRITE
,
PWDATA
,
CAPB3lIOI
,
CAPB3I
)
;
if
(
IADDR_OPTION
==
CAPB3IIl
)
CAPB3O
#
(
APB_DWIDTH
,
MADDR_BITS
)
CAPB3lIII
(
PCLK
,
PRESETN
,
PENABLE
,
CAPB3O0OI
[
4
]
,
PADDR
,
PWRITE
,
PWDATA
,
CAPB3lIOI
,
CAPB3I
)
;
if
(
IADDR_OPTION
==
CAPB3lIl
)
CAPB3O
#
(
APB_DWIDTH
,
MADDR_BITS
)
CAPB3lIII
(
PCLK
,
PRESETN
,
PENABLE
,
CAPB3O0OI
[
5
]
,
PADDR
,
PWRITE
,
PWDATA
,
CAPB3lIOI
,
CAPB3I
)
;
if
(
IADDR_OPTION
==
CAPB3Oll
)
CAPB3O
#
(
APB_DWIDTH
,
MADDR_BITS
)
CAPB3lIII
(
PCLK
,
PRESETN
,
PENABLE
,
CAPB3O0OI
[
6
]
,
PADDR
,
PWRITE
,
PWDATA
,
CAPB3lIOI
,
CAPB3I
)
;
if
(
IADDR_OPTION
==
CAPB3Ill
)
CAPB3O
#
(
APB_DWIDTH
,
MADDR_BITS
)
CAPB3lIII
(
PCLK
,
PRESETN
,
PENABLE
,
CAPB3O0OI
[
7
]
,
PADDR
,
PWRITE
,
PWDATA
,
CAPB3lIOI
,
CAPB3I
)
;
if
(
IADDR_OPTION
==
CAPB3lll
)
CAPB3O
#
(
APB_DWIDTH
,
MADDR_BITS
)
CAPB3lIII
(
PCLK
,
PRESETN
,
PENABLE
,
CAPB3O0OI
[
8
]
,
PADDR
,
PWRITE
,
PWDATA
,
CAPB3lIOI
,
CAPB3I
)
;
if
(
IADDR_OPTION
==
CAPB3O0l
)
CAPB3O
#
(
APB_DWIDTH
,
MADDR_BITS
)
CAPB3lIII
(
PCLK
,
PRESETN
,
PENABLE
,
CAPB3O0OI
[
9
]
,
PADDR
,
PWRITE
,
PWDATA
,
CAPB3lIOI
,
CAPB3I
)
;
if
(
IADDR_OPTION
==
CAPB3I0l
)
CAPB3O
#
(
APB_DWIDTH
,
MADDR_BITS
)
CAPB3lIII
(
PCLK
,
PRESETN
,
PENABLE
,
CAPB3O0OI
[
10
]
,
PADDR
,
PWRITE
,
PWDATA
,
CAPB3lIOI
,
CAPB3I
)
;
if
(
IADDR_OPTION
==
CAPB3l0l
)
CAPB3O
#
(
APB_DWIDTH
,
MADDR_BITS
)
CAPB3lIII
(
PCLK
,
PRESETN
,
PENABLE
,
CAPB3O0OI
[
11
]
,
PADDR
,
PWRITE
,
PWDATA
,
CAPB3lIOI
,
CAPB3I
)
;
if
(
IADDR_OPTION
==
CAPB3O1l
)
CAPB3O
#
(
APB_DWIDTH
,
MADDR_BITS
)
CAPB3lIII
(
PCLK
,
PRESETN
,
PENABLE
,
CAPB3O0OI
[
12
]
,
PADDR
,
PWRITE
,
PWDATA
,
CAPB3lIOI
,
CAPB3I
)
;
if
(
IADDR_OPTION
==
CAPB3I1l
)
CAPB3O
#
(
APB_DWIDTH
,
MADDR_BITS
)
CAPB3lIII
(
PCLK
,
PRESETN
,
PENABLE
,
CAPB3O0OI
[
13
]
,
PADDR
,
PWRITE
,
PWDATA
,
CAPB3lIOI
,
CAPB3I
)
;
if
(
IADDR_OPTION
==
CAPB3l1l
)
CAPB3O
#
(
APB_DWIDTH
,
MADDR_BITS
)
CAPB3lIII
(
PCLK
,
PRESETN
,
PENABLE
,
CAPB3O0OI
[
14
]
,
PADDR
,
PWRITE
,
PWDATA
,
CAPB3lIOI
,
CAPB3I
)
;
if
(
IADDR_OPTION
==
CAPB3OO0
)
CAPB3O
#
(
APB_DWIDTH
,
MADDR_BITS
)
CAPB3lIII
(
PCLK
,
PRESETN
,
PENABLE
,
CAPB3O0OI
[
15
]
,
PADDR
,
PWRITE
,
PWDATA
,
CAPB3lIOI
,
CAPB3I
)
;
end
endgenerate
generate
begin
if
(
IADDR_OPTION
==
CAPB3I1I
)
begin
assign
CAPB3O1OI
=
PADDR
;
assign
CAPB3l0OI
=
32
'b
0
;
end
else
if
(
IADDR_OPTION
==
CAPB3l1I
)
begin
assign
CAPB3O1OI
=
IADDR
;
assign
CAPB3l0OI
=
IADDR
;
end
else
begin
assign
CAPB3O1OI
=
CAPB3I
;
assign
CAPB3l0OI
=
CAPB3I
;
end
end
endgenerate
generate
if
(
MADDR_BITS
==
12
)
begin
always
@(*)
case
(
UPR_NIBBLE_POSN
)
2
:
PADDRS
=
{
CAPB3O1OI
[
31
:
12
]
,
PADDR
[
11
:
0
]
}
;
3
:
PADDRS
=
{
CAPB3O1OI
[
31
:
16
]
,
PADDR
[
11
:
8
]
,
CAPB3l0OI
[
11
:
8
]
,
PADDR
[
7
:
0
]
}
;
4
:
PADDRS
=
{
CAPB3O1OI
[
31
:
20
]
,
PADDR
[
11
:
8
]
,
CAPB3l0OI
[
15
:
8
]
,
PADDR
[
7
:
0
]
}
;
5
:
PADDRS
=
{
CAPB3O1OI
[
31
:
24
]
,
PADDR
[
11
:
8
]
,
CAPB3l0OI
[
19
:
8
]
,
PADDR
[
7
:
0
]
}
;
6
:
PADDRS
=
{
CAPB3O1OI
[
31
:
28
]
,
PADDR
[
11
:
8
]
,
CAPB3l0OI
[
23
:
8
]
,
PADDR
[
7
:
0
]
}
;
7
:
PADDRS
=
{
PADDR
[
11
:
8
]
,
CAPB3l0OI
[
27
:
8
]
,
PADDR
[
7
:
0
]
}
;
8
:
PADDRS
=
{
CAPB3l0OI
[
31
:
8
]
,
PADDR
[
7
:
0
]
}
;
endcase
end
endgenerate
generate
if
(
MADDR_BITS
==
16
)
begin
always
@(*)
case
(
UPR_NIBBLE_POSN
)
2
:
PADDRS
=
{
CAPB3O1OI
[
31
:
16
]
,
PADDR
[
15
:
0
]
}
;
3
:
PADDRS
=
{
CAPB3O1OI
[
31
:
16
]
,
PADDR
[
15
:
0
]
}
;
4
:
PADDRS
=
{
CAPB3O1OI
[
31
:
20
]
,
PADDR
[
15
:
12
]
,
CAPB3l0OI
[
15
:
12
]
,
PADDR
[
11
:
0
]
}
;
5
:
PADDRS
=
{
CAPB3O1OI
[
31
:
24
]
,
PADDR
[
15
:
12
]
,
CAPB3l0OI
[
19
:
12
]
,
PADDR
[
11
:
0
]
}
;
6
:
PADDRS
=
{
CAPB3O1OI
[
31
:
28
]
,
PADDR
[
15
:
12
]
,
CAPB3l0OI
[
23
:
12
]
,
PADDR
[
11
:
0
]
}
;
7
:
PADDRS
=
{
PADDR
[
15
:
12
]
,
CAPB3l0OI
[
27
:
12
]
,
PADDR
[
11
:
0
]
}
;
8
:
PADDRS
=
{
CAPB3l0OI
[
31
:
12
]
,
PADDR
[
11
:
0
]
}
;
endcase
end
endgenerate
generate
if
(
MADDR_BITS
==
20
)
begin
always
@(*)
case
(
UPR_NIBBLE_POSN
)
2
:
PADDRS
=
{
CAPB3O1OI
[
31
:
20
]
,
PADDR
[
19
:
0
]
}
;
3
:
PADDRS
=
{
CAPB3O1OI
[
31
:
20
]
,
PADDR
[
19
:
0
]
}
;
4
:
PADDRS
=
{
CAPB3O1OI
[
31
:
20
]
,
PADDR
[
19
:
0
]
}
;
5
:
PADDRS
=
{
CAPB3O1OI
[
31
:
24
]
,
PADDR
[
19
:
16
]
,
CAPB3l0OI
[
19
:
16
]
,
PADDR
[
15
:
0
]
}
;
6
:
PADDRS
=
{
CAPB3O1OI
[
31
:
28
]
,
PADDR
[
19
:
16
]
,
CAPB3l0OI
[
23
:
16
]
,
PADDR
[
15
:
0
]
}
;
7
:
PADDRS
=
{
PADDR
[
19
:
16
]
,
CAPB3l0OI
[
27
:
16
]
,
PADDR
[
15
:
0
]
}
;
8
:
PADDRS
=
{
CAPB3l0OI
[
31
:
16
]
,
PADDR
[
15
:
0
]
}
;
endcase
end
endgenerate
generate
if
(
MADDR_BITS
==
24
)
begin
always
@(*)
case
(
UPR_NIBBLE_POSN
)
2
:
PADDRS
=
{
CAPB3O1OI
[
31
:
24
]
,
PADDR
[
23
:
0
]
}
;
3
:
PADDRS
=
{
CAPB3O1OI
[
31
:
24
]
,
PADDR
[
23
:
0
]
}
;
4
:
PADDRS
=
{
CAPB3O1OI
[
31
:
24
]
,
PADDR
[
23
:
0
]
}
;
5
:
PADDRS
=
{
CAPB3O1OI
[
31
:
24
]
,
PADDR
[
23
:
0
]
}
;
6
:
PADDRS
=
{
CAPB3O1OI
[
31
:
28
]
,
PADDR
[
23
:
20
]
,
CAPB3l0OI
[
23
:
20
]
,
PADDR
[
19
:
0
]
}
;
7
:
PADDRS
=
{
PADDR
[
23
:
20
]
,
CAPB3l0OI
[
27
:
20
]
,
PADDR
[
19
:
0
]
}
;
8
:
PADDRS
=
{
CAPB3l0OI
[
31
:
20
]
,
PADDR
[
19
:
0
]
}
;
endcase
end
endgenerate
generate
if
(
MADDR_BITS
==
28
)
begin
always
@(*)
case
(
UPR_NIBBLE_POSN
)
2
:
PADDRS
=
{
CAPB3O1OI
[
31
:
28
]
,
PADDR
[
27
:
0
]
}
;
3
:
PADDRS
=
{
CAPB3O1OI
[
31
:
28
]
,
PADDR
[
27
:
0
]
}
;
4
:
PADDRS
=
{
CAPB3O1OI
[
31
:
28
]
,
PADDR
[
27
:
0
]
}
;
5
:
PADDRS
=
{
CAPB3O1OI
[
31
:
28
]
,
PADDR
[
27
:
0
]
}
;
6
:
PADDRS
=
{
CAPB3O1OI
[
31
:
28
]
,
PADDR
[
27
:
0
]
}
;
7
:
PADDRS
=
{
PADDR
[
27
:
24
]
,
CAPB3l0OI
[
27
:
24
]
,
PADDR
[
23
:
0
]
}
;
8
:
PADDRS
=
{
CAPB3l0OI
[
31
:
24
]
,
PADDR
[
23
:
0
]
}
;
endcase
end
endgenerate
generate
if
(
MADDR_BITS
==
32
)
begin
always
@(*)
PADDRS
=
PADDR
[
31
:
0
]
;
end
endgenerate
endmodule
