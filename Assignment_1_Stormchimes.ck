// Assignment_1_Stormchimes

// Network
SinOsc beat1 => dac;
SqrOsc beat2 => dac;
SawOsc g => dac;
TriOsc c => NRev rg => dac;
SinOsc e => NRev re => dac;

// Set reverb.
0.3 => rg.mix;
0.6 => re.mix;

// Set beat frequencies.
82.407 => beat1.freq;
130.813 => beat2.freq;


// Initialize sound volumes and set frequencies.
0 => g.gain;
0 => c.gain;
0 => e.gain;
391.995 => g.freq;
523.251 => c.freq;
659.255 => e.freq;

// Setup sound loop count.
// The same effect could be achived by using the modulus of
// the for loop.
0 => int start;
0 => int count;
30 => int end;

for(0 => int i; 120 > i; i++) {
    // Play beat1 every other count.
    if(i % 2 == 0) {
        0.9 => beat1.gain ;
    } else {
        0 => beat1.gain;
    }
    
    // Play beat2 every 6th count.
    if(i % 6 == 0) {
        0.1 => beat2.gain ;
    } else {
        0 => beat2.gain;
    }
    
    if(count > end) {
        // Play random volumes lightly.
        Std.rand2f(0.0, 0.3) => c.gain;
        Std.rand2f(0.0, 0.3) => e.gain;
        Std.rand2f(0.0, 0.2) => g.gain;
        start => count;
    } else {
        
        // Turn up E and modulate the SawOsc for 10 counts
        if(count > 10) {
            0.4 => e.gain;
            Std.rand2f(0.0, 0.4) => g.gain;
        }
        
        // Play the sounds at random volumes to achive
        // the chime effect for the last 10 counts.
        if(count > 20){
            Std.rand2f(0.0, 1.0) => c.gain;
            Std.rand2f(0.0, 1.0) => e.gain;
            Std.rand2f(0.0, 1.0) => g.gain;
        }
    }
    // Increment the sound counter
    1 +=> count;
    
    // Loop every .2 seconds.
    0.2::second => now;
}

// Turn off the SawOsc and fade out at the end.
0 => g.gain;
for(0.6 => float i; 0 < i; i - 0.05 => i) {
    i => e.gain;
    i => c.gain;
    0.3::second => now;
}