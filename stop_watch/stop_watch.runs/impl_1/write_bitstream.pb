
n
Command: %s
1870*	planAhead29
%open_checkpoint stop_watch_routed.dcp2default:defaultZ12-2866h px? 
^

Starting %s Task
103*constraints2#
open_checkpoint2default:defaultZ18-103h px? 
?

%s
*constraints2r
^Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.003 . Memory (MB): peak = 206.715 ; gain = 0.0002default:defaulth px? 
?
scannot add Board Part %s available at %s as part %s specified in board_part file is either invalid or not available5*board28
$digilentinc.com:arty-s7-25:part0:1.02default:default2\
HC:/Xilinx/Vivado/2016.1/data/boards/board_files/arty-s7-25/E.0/board.xml2default:default2#
xc7s25csga324-12default:defaultZ49-26h px? 
?
scannot add Board Part %s available at %s as part %s specified in board_part file is either invalid or not available5*board28
$digilentinc.com:arty-s7-50:part0:1.02default:default2\
HC:/Xilinx/Vivado/2016.1/data/boards/board_files/arty-s7-50/B.0/board.xml2default:default2#
xc7s50csga324-12default:defaultZ49-26h px? 
?
scannot add Board Part %s available at %s as part %s specified in board_part file is either invalid or not available5*board28
$digilentinc.com:cmod-s7-25:part0:1.02default:default2\
HC:/Xilinx/Vivado/2016.1/data/boards/board_files/cmod-s7-25/B.0/board.xml2default:default2#
xc7s25csga225-12default:defaultZ49-26h px? 
?
scannot add Board Part %s available at %s as part %s specified in board_part file is either invalid or not available5*board29
%digilentinc.com:cora-z7-07s:part0:1.02default:default2]
IC:/Xilinx/Vivado/2016.1/data/boards/board_files/cora-z7-07s/B.0/board.xml2default:default2$
xc7z007sclg400-12default:defaultZ49-26h px? 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
242default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
x
Netlist was created with %s %s291*project2
Vivado2default:default2
2016.12default:defaultZ1-479h px? 
W
Loading part %s157*device2$
xc7a100tcsg324-12default:defaultZ21-403h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
?
Parsing XDC File [%s]
179*designutils2|
hC:/Users/ol1662le-s/Program/stop_watch/stop_watch.runs/impl_1/.Xil/Vivado-4152-fox-15/dcp/stop_watch.xdc2default:defaultZ20-179h px? 
?
Finished Parsing XDC File [%s]
178*designutils2|
hC:/Users/ol1662le-s/Program/stop_watch/stop_watch.runs/impl_1/.Xil/Vivado-4152-fox-15/dcp/stop_watch.xdc2default:defaultZ20-178h px? 
?
Reading XDEF placement.
206*designutilsZ20-206h px? 
D
Reading placer database...
1602*designutilsZ20-1892h px? 
=
Reading XDEF routing.
207*designutilsZ20-207h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
Read XDEF File: 2default:default2
00:00:002default:default2 
00:00:00.0312default:default2
515.9652default:default2
0.0082default:defaultZ17-268h px? 
?
7Restored from archive | CPU: %s secs | Memory: %s MB |
1612*designutils2
0.0000002default:default2
0.0000002default:defaultZ20-1924h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common20
Finished XDEF File Restore: 2default:default2
00:00:002default:default2 
00:00:00.0312default:default2
515.9652default:default2
0.0082default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
?
'Checkpoint was created with %s build %s378*project2+
Vivado v2016.1 (64-bit)2default:default2
15382592default:defaultZ1-604h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
open_checkpoint: 2default:default2
00:00:042default:default2
00:00:052default:default2
515.9962default:default2
309.2812default:defaultZ17-268h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-349h px? 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
Z
DRC finished with %s
1905*	planAhead2
0 Errors2default:defaultZ12-3199h px? 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px? 
i
)Running write_bitstream with %s threads.
1750*designutils2
22default:defaultZ20-2272h px? 
?
Loading data files...
1271*designutilsZ12-1165h px? 
>
Loading site data...
1273*designutilsZ12-1167h px? 
?
Loading route data...
1272*designutilsZ12-1166h px? 
?
Processing options...
1362*designutilsZ12-1514h px? 
<
Creating bitmap...
1249*designutilsZ12-1141h px? 
7
Creating bitstream...
7*	bitstreamZ40-7h px? 
a
Writing bitstream %s...
11*	bitstream2$
./stop_watch.bit2default:defaultZ40-11h px? 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px? 
?
?WebTalk data collection is mandatory when using a WebPACK part without a full Vivado license. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.
120*projectZ1-120h px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
write_bitstream: 2default:default2
00:00:122default:default2
00:00:142default:default2
891.7502default:default2
375.7542default:defaultZ17-268h px? 
g
Unable to parse hwdef file %s162*	vivadotcl2$
stop_watch.hwdef2default:defaultZ4-395h px? 


End Record