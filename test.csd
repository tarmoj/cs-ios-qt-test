<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

sr        = 44100
ksmps     = 64
nchnls    = 2
0dbfs      = 1

chnset 100, "slider"
chn_k "slider", 3


instr 1
prints "CSOUND instr 1\n"
isl = 100 ;chnget "slider"
ksl init isl
ksl chnget "slider"
ksl port ksl, 0.01, isl
a2 expsegr 0.001,0.01,p4,p3-0.01, 0.001, 0.1, 0.001
a1 oscili a2, ksl, 1
outs a1,a1
endin

instr 2

    chnset line:k(chnget:i("slider"),p3, p4), "slider"
endin

</CsInstruments>
<CsScore>
f 1 0 16384 10 1

i 1 0 10 0.5
i 2 1 1 500
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
