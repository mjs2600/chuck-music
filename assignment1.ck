SinOsc beat1 => dac;
SqrOsc beat2 => dac;
SawOsc c => NRev rc => dac;
TriOsc g => NRev rg => dac;
SinOsc e => NRev re => dac;

0.3 => rc.mix;
0.3 => rg.mix;
0.3 => re.mix;

82.407 => beat1.freq;
130.813 => beat2.freq;

0 => g.gain;
0 => e.gain;
0.2 => c.gain;
391.995 => c.freq;
523.251 => g.freq;
659.255 => e.freq;


0 => int start;
0 => int count;
1 => int modifier;
30 => int end;

for(0 => int i; 90 > i; i++) {
    if(i % 2 == 0) {
        0.9 => beat1.gain ;
    } else {
        0 => beat1.gain;
    }
    
    if(i % 6 == 0) {
        0.1 => beat2.gain ;
    } else {
        0 => beat2.gain;
    }
    
    if(count > end) {
        Std.rand2f(0.0, 0.2) => g.gain;
        Std.rand2f(0.0, 0.2) => e.gain;
        Std.rand2f(0.0, 0.2) => c.gain;
        //-1 *=> modifier;
        start => count;
    } else {
        if(count > 10) {
            0.4 => e.gain;
        } 
        if(count > 20){
            Std.rand2f(0.0, 1.0) => g.gain;
            Std.rand2f(0.0, 1.0) => e.gain;
            Std.rand2f(0.0, 1.0) => c.gain;
        }
    }
    modifier * 1 +=> count;

    0.2::second => now;
}

for(0.6 => float i; 0 < i; i - 0.05 => i) {
    i => e.gain;
    i => c.gain;
    i => g.gain;
    0.3::second => now;
}
