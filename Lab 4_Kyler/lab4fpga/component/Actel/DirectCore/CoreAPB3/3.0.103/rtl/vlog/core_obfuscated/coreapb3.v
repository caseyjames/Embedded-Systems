// Actel Corporation Proprietary and Confidential
// Copyright 2010 Actel Corporation.  All rights reserved.
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
// Revision Information:
// 05Feb10              Production Release Version 3.0
// SVN Revision Information:
// SVN $Revision: 12344 $
// SVN $Date: 2010-02-27 21:59:30 -0800 (Sat, 27 Feb 2010) $
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
[
20
:
0
]
RANGESIZE
=
256
,
parameter
[
0
:
0
]
IADDR_ENABLE
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
)
(
input
PRESETN,
input
PCLK,
input
[
23
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
wire
[
23
:
0
]
PADDRS,
output
wire
[
(
(
(
1
-
IADDR_ENABLE
)
*
24
)
+
(
(
IADDR_ENABLE
)
*
32
)
)
-
1
:
0
]
PADDRS0,
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
PSLVERRS15
)
;
function
integer
CAPB3I0I
;
input
[
31
:
0
]
CAPB3l0I
;
begin
CAPB3I0I
=
0
;
while
(
CAPB3l0I
>
1
)
begin
CAPB3l0I
=
CAPB3l0I
>>
1
;
CAPB3I0I
=
CAPB3I0I
+
1
;
end
end
endfunction
localparam
CAPB3O1I
=
CAPB3I0I
(
RANGESIZE
)
;
localparam
CAPB3I1I
=
(
CAPB3O1I
*
(
RANGESIZE
<
65536
)
)
+
(
15
*
(
RANGESIZE
>=
65536
)
)
;
localparam
[
CAPB3O1I
-
1
:
0
]
CAPB3l1I
=
'h
c
;
localparam
[
CAPB3O1I
-
1
:
0
]
CAPB3OOl
=
'h
8
;
localparam
[
CAPB3O1I
-
1
:
0
]
CAPB3IOl
=
'h
4
;
localparam
[
CAPB3O1I
-
1
:
0
]
CAPB3lOl
=
'h
0
;
localparam
[
CAPB3O1I
-
1
:
0
]
CAPB3OIl
=
'h
4
;
localparam
[
CAPB3O1I
-
1
:
0
]
CAPB3IIl
=
'h
0
;
localparam
[
CAPB3O1I
-
1
:
0
]
CAPB3lIl
=
'h
0
;
localparam
[
15
:
0
]
CAPB3Oll
=
APBSLOT0ENABLE
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
CAPB3Ill
=
APBSLOT1ENABLE
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
CAPB3lll
=
APBSLOT2ENABLE
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
CAPB3O0l
=
APBSLOT3ENABLE
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
CAPB3I0l
=
APBSLOT4ENABLE
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
CAPB3l0l
=
APBSLOT5ENABLE
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
CAPB3O1l
=
APBSLOT6ENABLE
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
CAPB3I1l
=
APBSLOT7ENABLE
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
CAPB3l1l
=
APBSLOT8ENABLE
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
CAPB3OO0
=
APBSLOT9ENABLE
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
CAPB3IO0
=
APBSLOT10ENABLE
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
CAPB3lO0
=
APBSLOT11ENABLE
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
CAPB3OI0
=
APBSLOT12ENABLE
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
CAPB3II0
=
APBSLOT13ENABLE
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
CAPB3lI0
=
APBSLOT14ENABLE
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
CAPB3Ol0
=
APBSLOT15ENABLE
*
(
2
**
15
)
;
wire
[
31
:
0
]
CAPB3Il0
;
wire
[
31
:
0
]
CAPB3IlI
;
wire
[
31
:
0
]
CAPB3ll0
;
wire
[
31
:
0
]
CAPB3O00
;
wire
[
31
:
0
]
CAPB3I00
;
wire
[
31
:
0
]
CAPB3l00
;
wire
[
31
:
0
]
CAPB3O10
;
wire
[
31
:
0
]
CAPB3I10
;
wire
[
31
:
0
]
CAPB3l10
;
wire
[
31
:
0
]
CAPB3OO1
;
wire
[
31
:
0
]
CAPB3IO1
;
wire
[
31
:
0
]
CAPB3lO1
;
wire
[
31
:
0
]
CAPB3OI1
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
15
:
0
]
CAPB3I01
;
wire
[
15
:
0
]
CAPB3l01
;
reg
[
15
:
0
]
CAPB3O11
;
wire
[
3
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
CAPB3OOOI
;
wire
CAPB3IOOI
;
assign
CAPB3l11
=
32
'b
0
;
assign
CAPB3OOOI
=
1
'b
1
;
assign
CAPB3IOOI
=
1
'b
0
;
assign
PADDRS
=
CAPB3Il0
[
23
:
0
]
;
assign
PADDRS0
=
CAPB3Il0
[
(
(
(
1
-
IADDR_ENABLE
)
*
24
)
+
(
(
IADDR_ENABLE
)
*
32
)
)
-
1
:
0
]
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
generate
begin
:
CAPB3lOOI
assign
CAPB3I11
=
PADDR
[
(
CAPB3O1I
+
3
)
:
(
CAPB3O1I
+
0
)
]
;
end
endgenerate
generate
begin
:
CAPB3OIOI
if
(
IADDR_ENABLE
==
0
)
begin
:
CAPB3IIOI
assign
CAPB3Il0
[
31
:
0
]
=
{
CAPB3l11
[
31
:
CAPB3O1I
+
4
]
,
PADDR
[
(
CAPB3O1I
+
3
)
:
0
]
}
;
assign
CAPB3O01
[
31
:
0
]
=
CAPB3l11
[
31
:
0
]
;
end
else
if
(
IADDR_ENABLE
==
1
)
begin
:
CAPB3lIOI
reg
[
31
:
0
]
CAPB3OlOI
;
if
(
APB_DWIDTH
==
8
)
begin
always
@
(
posedge
PCLK
or
negedge
PRESETN
)
begin
if
(
PRESETN
==
1
'b
0
)
CAPB3OlOI
[
31
:
0
]
<=
32
'b
0
;
else
begin
if
(
RANGESIZE
<
65536
)
begin
if
(
CAPB3O11
[
1
]
==
1
'b
1
&&
PWRITE
==
1
'b
1
&&
PENABLE
==
1
'b
1
&&
PADDR
[
(
CAPB3O1I
-
1
)
:
0
]
==
CAPB3IOl
[
(
CAPB3O1I
-
1
)
:
0
]
)
CAPB3OlOI
[
15
:
CAPB3I1I
]
<=
PWDATA
[
7
:
(
CAPB3I1I
-
8
)
]
;
end
if
(
CAPB3O11
[
1
]
==
1
'b
1
&&
PWRITE
==
1
'b
1
&&
PENABLE
==
1
'b
1
&&
PADDR
[
(
CAPB3O1I
-
1
)
:
0
]
==
CAPB3OOl
[
(
CAPB3O1I
-
1
)
:
0
]
)
CAPB3OlOI
[
23
:
16
]
<=
PWDATA
[
7
:
0
]
;
if
(
CAPB3O11
[
1
]
==
1
'b
1
&&
PWRITE
==
1
'b
1
&&
PENABLE
==
1
'b
1
&&
PADDR
[
(
CAPB3O1I
-
1
)
:
0
]
==
CAPB3l1I
[
(
CAPB3O1I
-
1
)
:
0
]
)
CAPB3OlOI
[
31
:
24
]
<=
PWDATA
[
7
:
0
]
;
end
end
assign
CAPB3O01
[
7
:
0
]
=
(
PADDR
[
(
CAPB3O1I
-
1
)
:
0
]
==
CAPB3lOl
[
(
CAPB3O1I
-
1
)
:
0
]
)
?
CAPB3OlOI
[
7
:
0
]
:
(
PADDR
[
(
CAPB3O1I
-
1
)
:
0
]
==
CAPB3IOl
[
(
CAPB3O1I
-
1
)
:
0
]
)
?
CAPB3OlOI
[
15
:
8
]
:
(
PADDR
[
(
CAPB3O1I
-
1
)
:
0
]
==
CAPB3OOl
[
(
CAPB3O1I
-
1
)
:
0
]
)
?
CAPB3OlOI
[
23
:
16
]
:
(
PADDR
[
(
CAPB3O1I
-
1
)
:
0
]
==
CAPB3l1I
[
(
CAPB3O1I
-
1
)
:
0
]
)
?
CAPB3OlOI
[
31
:
24
]
:
8
'b
0
;
end
else
if
(
APB_DWIDTH
==
16
)
begin
always
@
(
posedge
PCLK
or
negedge
PRESETN
)
begin
if
(
PRESETN
==
1
'b
0
)
CAPB3OlOI
[
31
:
0
]
<=
32
'b
0
;
else
begin
if
(
RANGESIZE
<
65536
)
begin
if
(
CAPB3O11
[
1
]
==
1
'b
1
&&
PWRITE
==
1
'b
1
&&
PENABLE
==
1
'b
1
&&
PADDR
[
(
CAPB3O1I
-
1
)
:
0
]
==
CAPB3IIl
[
(
CAPB3O1I
-
1
)
:
0
]
)
CAPB3OlOI
[
15
:
CAPB3I1I
]
<=
PWDATA
[
15
:
CAPB3I1I
]
;
end
if
(
CAPB3O11
[
1
]
==
1
'b
1
&&
PWRITE
==
1
'b
1
&&
PENABLE
==
1
'b
1
&&
PADDR
[
(
CAPB3O1I
-
1
)
:
0
]
==
CAPB3OIl
[
(
CAPB3O1I
-
1
)
:
0
]
)
CAPB3OlOI
[
31
:
16
]
<=
PWDATA
[
15
:
0
]
;
end
end
assign
CAPB3O01
[
15
:
0
]
=
(
PADDR
[
(
CAPB3O1I
-
1
)
:
0
]
==
CAPB3IIl
[
(
CAPB3O1I
-
1
)
:
0
]
)
?
CAPB3OlOI
[
15
:
0
]
:
(
PADDR
[
(
CAPB3O1I
-
1
)
:
0
]
==
CAPB3OIl
[
(
CAPB3O1I
-
1
)
:
0
]
)
?
CAPB3OlOI
[
31
:
16
]
:
16
'b
0
;
end
else
begin
always
@
(
posedge
PCLK
or
negedge
PRESETN
)
begin
if
(
PRESETN
==
1
'b
0
)
CAPB3OlOI
[
31
:
0
]
<=
32
'b
0
;
else
begin
if
(
CAPB3O11
[
1
]
==
1
'b
1
&&
PWRITE
==
1
'b
1
&&
PENABLE
==
1
'b
1
&&
PADDR
[
(
CAPB3O1I
-
1
)
:
0
]
==
CAPB3lIl
[
(
CAPB3O1I
-
1
)
:
0
]
)
CAPB3OlOI
[
31
:
CAPB3O1I
]
<=
PWDATA
[
31
:
CAPB3O1I
]
;
end
end
assign
CAPB3O01
[
31
:
0
]
=
(
PADDR
[
(
CAPB3O1I
-
1
)
:
0
]
==
CAPB3lIl
[
(
CAPB3O1I
-
1
)
:
0
]
)
?
CAPB3OlOI
[
31
:
0
]
:
32
'b
0
;
end
assign
CAPB3Il0
[
31
:
CAPB3O1I
]
=
(
CAPB3O11
[
0
]
==
1
'b
1
)
?
CAPB3OlOI
[
31
:
CAPB3O1I
]
:
{
CAPB3l11
[
31
:
CAPB3O1I
+
4
]
,
PADDR
[
(
CAPB3O1I
+
3
)
:
(
CAPB3O1I
+
0
)
]
}
;
assign
CAPB3Il0
[
(
CAPB3O1I
-
1
)
:
0
]
=
PADDR
[
(
CAPB3O1I
-
1
)
:
0
]
;
end
end
endgenerate
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
CAPB3I11
)
4
'b
0000
:
CAPB3O11
=
CAPB3Oll
;
4
'b
0001
:
CAPB3O11
=
CAPB3Ill
;
4
'b
0010
:
CAPB3O11
=
CAPB3lll
;
4
'b
0011
:
CAPB3O11
=
CAPB3O0l
;
4
'b
0100
:
CAPB3O11
=
CAPB3I0l
;
4
'b
0101
:
CAPB3O11
=
CAPB3l0l
;
4
'b
0110
:
CAPB3O11
=
CAPB3O1l
;
4
'b
0111
:
CAPB3O11
=
CAPB3I1l
;
4
'b
1000
:
CAPB3O11
=
CAPB3l1l
;
4
'b
1001
:
CAPB3O11
=
CAPB3OO0
;
4
'b
1010
:
CAPB3O11
=
CAPB3IO0
;
4
'b
1011
:
CAPB3O11
=
CAPB3lO0
;
4
'b
1100
:
CAPB3O11
=
CAPB3OI0
;
4
'b
1101
:
CAPB3O11
=
CAPB3II0
;
4
'b
1110
:
CAPB3O11
=
CAPB3lI0
;
4
'b
1111
:
CAPB3O11
=
CAPB3Ol0
;
default
:
CAPB3O11
=
16
'b
0000000000000000
;
endcase
end
else
begin
CAPB3O11
=
16
'b
0000000000000000
;
end
end
generate
begin
:
CAPB3IlOI
if
(
APBSLOT0ENABLE
)
assign
CAPB3ll0
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
CAPB3ll0
[
31
:
0
]
=
CAPB3l11
[
31
:
0
]
;
if
(
IADDR_ENABLE
)
assign
CAPB3O00
[
31
:
0
]
=
CAPB3O01
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
CAPB3O00
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
CAPB3O00
[
31
:
0
]
=
CAPB3l11
[
31
:
0
]
;
if
(
APBSLOT2ENABLE
)
assign
CAPB3I00
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
CAPB3I00
[
31
:
0
]
=
CAPB3l11
[
31
:
0
]
;
if
(
APBSLOT3ENABLE
)
assign
CAPB3l00
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
CAPB3l00
[
31
:
0
]
=
CAPB3l11
[
31
:
0
]
;
if
(
APBSLOT4ENABLE
)
assign
CAPB3O10
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
CAPB3O10
[
31
:
0
]
=
CAPB3l11
[
31
:
0
]
;
if
(
APBSLOT5ENABLE
)
assign
CAPB3I10
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
CAPB3I10
[
31
:
0
]
=
CAPB3l11
[
31
:
0
]
;
if
(
APBSLOT6ENABLE
)
assign
CAPB3l10
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
CAPB3l10
[
31
:
0
]
=
CAPB3l11
[
31
:
0
]
;
if
(
APBSLOT7ENABLE
)
assign
CAPB3OO1
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
CAPB3OO1
[
31
:
0
]
=
CAPB3l11
[
31
:
0
]
;
if
(
APBSLOT8ENABLE
)
assign
CAPB3IO1
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
CAPB3IO1
[
31
:
0
]
=
CAPB3l11
[
31
:
0
]
;
if
(
APBSLOT9ENABLE
)
assign
CAPB3lO1
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
CAPB3lO1
[
31
:
0
]
=
CAPB3l11
[
31
:
0
]
;
if
(
APBSLOT10ENABLE
)
assign
CAPB3OI1
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
CAPB3OI1
[
31
:
0
]
=
CAPB3l11
[
31
:
0
]
;
if
(
APBSLOT11ENABLE
)
assign
CAPB3II1
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
CAPB3II1
[
31
:
0
]
=
CAPB3l11
[
31
:
0
]
;
if
(
APBSLOT12ENABLE
)
assign
CAPB3lI1
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
CAPB3lI1
[
31
:
0
]
=
CAPB3l11
[
31
:
0
]
;
if
(
APBSLOT13ENABLE
)
assign
CAPB3Ol1
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
CAPB3Ol1
[
31
:
0
]
=
CAPB3l11
[
31
:
0
]
;
if
(
APBSLOT14ENABLE
)
assign
CAPB3Il1
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
CAPB3Il1
[
31
:
0
]
=
CAPB3l11
[
31
:
0
]
;
if
(
APBSLOT15ENABLE
)
assign
CAPB3ll1
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
CAPB3ll1
[
31
:
0
]
=
CAPB3l11
[
31
:
0
]
;
if
(
APBSLOT0ENABLE
)
assign
CAPB3I01
[
0
]
=
PREADYS0
;
else
assign
CAPB3I01
[
0
]
=
CAPB3OOOI
;
if
(
IADDR_ENABLE
)
assign
CAPB3I01
[
1
]
=
CAPB3OOOI
;
else
if
(
APBSLOT1ENABLE
)
assign
CAPB3I01
[
1
]
=
PREADYS1
;
else
assign
CAPB3I01
[
1
]
=
CAPB3OOOI
;
if
(
APBSLOT2ENABLE
)
assign
CAPB3I01
[
2
]
=
PREADYS2
;
else
assign
CAPB3I01
[
2
]
=
CAPB3OOOI
;
if
(
APBSLOT3ENABLE
)
assign
CAPB3I01
[
3
]
=
PREADYS3
;
else
assign
CAPB3I01
[
3
]
=
CAPB3OOOI
;
if
(
APBSLOT4ENABLE
)
assign
CAPB3I01
[
4
]
=
PREADYS4
;
else
assign
CAPB3I01
[
4
]
=
CAPB3OOOI
;
if
(
APBSLOT5ENABLE
)
assign
CAPB3I01
[
5
]
=
PREADYS5
;
else
assign
CAPB3I01
[
5
]
=
CAPB3OOOI
;
if
(
APBSLOT6ENABLE
)
assign
CAPB3I01
[
6
]
=
PREADYS6
;
else
assign
CAPB3I01
[
6
]
=
CAPB3OOOI
;
if
(
APBSLOT7ENABLE
)
assign
CAPB3I01
[
7
]
=
PREADYS7
;
else
assign
CAPB3I01
[
7
]
=
CAPB3OOOI
;
if
(
APBSLOT8ENABLE
)
assign
CAPB3I01
[
8
]
=
PREADYS8
;
else
assign
CAPB3I01
[
8
]
=
CAPB3OOOI
;
if
(
APBSLOT9ENABLE
)
assign
CAPB3I01
[
9
]
=
PREADYS9
;
else
assign
CAPB3I01
[
9
]
=
CAPB3OOOI
;
if
(
APBSLOT10ENABLE
)
assign
CAPB3I01
[
10
]
=
PREADYS10
;
else
assign
CAPB3I01
[
10
]
=
CAPB3OOOI
;
if
(
APBSLOT11ENABLE
)
assign
CAPB3I01
[
11
]
=
PREADYS11
;
else
assign
CAPB3I01
[
11
]
=
CAPB3OOOI
;
if
(
APBSLOT12ENABLE
)
assign
CAPB3I01
[
12
]
=
PREADYS12
;
else
assign
CAPB3I01
[
12
]
=
CAPB3OOOI
;
if
(
APBSLOT13ENABLE
)
assign
CAPB3I01
[
13
]
=
PREADYS13
;
else
assign
CAPB3I01
[
13
]
=
CAPB3OOOI
;
if
(
APBSLOT14ENABLE
)
assign
CAPB3I01
[
14
]
=
PREADYS14
;
else
assign
CAPB3I01
[
14
]
=
CAPB3OOOI
;
if
(
APBSLOT15ENABLE
)
assign
CAPB3I01
[
15
]
=
PREADYS15
;
else
assign
CAPB3I01
[
15
]
=
CAPB3OOOI
;
if
(
APBSLOT0ENABLE
)
assign
CAPB3l01
[
0
]
=
PSLVERRS0
;
else
assign
CAPB3l01
[
0
]
=
CAPB3IOOI
;
if
(
IADDR_ENABLE
)
assign
CAPB3l01
[
1
]
=
CAPB3IOOI
;
else
if
(
APBSLOT1ENABLE
)
assign
CAPB3l01
[
1
]
=
PSLVERRS1
;
else
assign
CAPB3l01
[
1
]
=
CAPB3IOOI
;
if
(
APBSLOT2ENABLE
)
assign
CAPB3l01
[
2
]
=
PSLVERRS2
;
else
assign
CAPB3l01
[
2
]
=
CAPB3IOOI
;
if
(
APBSLOT3ENABLE
)
assign
CAPB3l01
[
3
]
=
PSLVERRS3
;
else
assign
CAPB3l01
[
3
]
=
CAPB3IOOI
;
if
(
APBSLOT4ENABLE
)
assign
CAPB3l01
[
4
]
=
PSLVERRS4
;
else
assign
CAPB3l01
[
4
]
=
CAPB3IOOI
;
if
(
APBSLOT5ENABLE
)
assign
CAPB3l01
[
5
]
=
PSLVERRS5
;
else
assign
CAPB3l01
[
5
]
=
CAPB3IOOI
;
if
(
APBSLOT6ENABLE
)
assign
CAPB3l01
[
6
]
=
PSLVERRS6
;
else
assign
CAPB3l01
[
6
]
=
CAPB3IOOI
;
if
(
APBSLOT7ENABLE
)
assign
CAPB3l01
[
7
]
=
PSLVERRS7
;
else
assign
CAPB3l01
[
7
]
=
CAPB3IOOI
;
if
(
APBSLOT8ENABLE
)
assign
CAPB3l01
[
8
]
=
PSLVERRS8
;
else
assign
CAPB3l01
[
8
]
=
CAPB3IOOI
;
if
(
APBSLOT9ENABLE
)
assign
CAPB3l01
[
9
]
=
PSLVERRS9
;
else
assign
CAPB3l01
[
9
]
=
CAPB3IOOI
;
if
(
APBSLOT10ENABLE
)
assign
CAPB3l01
[
10
]
=
PSLVERRS10
;
else
assign
CAPB3l01
[
10
]
=
CAPB3IOOI
;
if
(
APBSLOT11ENABLE
)
assign
CAPB3l01
[
11
]
=
PSLVERRS11
;
else
assign
CAPB3l01
[
11
]
=
CAPB3IOOI
;
if
(
APBSLOT12ENABLE
)
assign
CAPB3l01
[
12
]
=
PSLVERRS12
;
else
assign
CAPB3l01
[
12
]
=
CAPB3IOOI
;
if
(
APBSLOT13ENABLE
)
assign
CAPB3l01
[
13
]
=
PSLVERRS13
;
else
assign
CAPB3l01
[
13
]
=
CAPB3IOOI
;
if
(
APBSLOT14ENABLE
)
assign
CAPB3l01
[
14
]
=
PSLVERRS14
;
else
assign
CAPB3l01
[
14
]
=
CAPB3IOOI
;
if
(
APBSLOT15ENABLE
)
assign
CAPB3l01
[
15
]
=
PSLVERRS15
;
else
assign
CAPB3l01
[
15
]
=
CAPB3IOOI
;
end
endgenerate
CAPB3O
CAPB3llOI
(
.CAPB3I
(
CAPB3O11
[
15
:
0
]
)
,
.PRDATAS0
(
CAPB3ll0
[
31
:
0
]
)
,
.PRDATAS1
(
CAPB3O00
[
31
:
0
]
)
,
.PRDATAS2
(
CAPB3I00
[
31
:
0
]
)
,
.PRDATAS3
(
CAPB3l00
[
31
:
0
]
)
,
.PRDATAS4
(
CAPB3O10
[
31
:
0
]
)
,
.PRDATAS5
(
CAPB3I10
[
31
:
0
]
)
,
.PRDATAS6
(
CAPB3l10
[
31
:
0
]
)
,
.PRDATAS7
(
CAPB3OO1
[
31
:
0
]
)
,
.PRDATAS8
(
CAPB3IO1
[
31
:
0
]
)
,
.PRDATAS9
(
CAPB3lO1
[
31
:
0
]
)
,
.PRDATAS10
(
CAPB3OI1
[
31
:
0
]
)
,
.PRDATAS11
(
CAPB3II1
[
31
:
0
]
)
,
.PRDATAS12
(
CAPB3lI1
[
31
:
0
]
)
,
.PRDATAS13
(
CAPB3Ol1
[
31
:
0
]
)
,
.PRDATAS14
(
CAPB3Il1
[
31
:
0
]
)
,
.PRDATAS15
(
CAPB3ll1
[
31
:
0
]
)
,
.CAPB3l
(
CAPB3I01
[
15
:
0
]
)
,
.CAPB3OI
(
CAPB3l01
[
15
:
0
]
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
CAPB3IlI
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
CAPB3IlI
[
31
:
0
]
;
assign
PSELS0
=
CAPB3O11
[
0
]
;
generate
begin
:
CAPB3O0OI
if
(
IADDR_ENABLE
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
CAPB3O11
[
1
]
;
end
endgenerate
assign
PSELS2
=
CAPB3O11
[
2
]
;
assign
PSELS3
=
CAPB3O11
[
3
]
;
assign
PSELS4
=
CAPB3O11
[
4
]
;
assign
PSELS5
=
CAPB3O11
[
5
]
;
assign
PSELS6
=
CAPB3O11
[
6
]
;
assign
PSELS7
=
CAPB3O11
[
7
]
;
assign
PSELS8
=
CAPB3O11
[
8
]
;
assign
PSELS9
=
CAPB3O11
[
9
]
;
assign
PSELS10
=
CAPB3O11
[
10
]
;
assign
PSELS11
=
CAPB3O11
[
11
]
;
assign
PSELS12
=
CAPB3O11
[
12
]
;
assign
PSELS13
=
CAPB3O11
[
13
]
;
assign
PSELS14
=
CAPB3O11
[
14
]
;
assign
PSELS15
=
CAPB3O11
[
15
]
;
endmodule
