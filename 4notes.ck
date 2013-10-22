SqrOsc cSharp => dac;
SqrOsc a => dac;
SqrOsc b => dac;
SqrOsc e => dac;

277.18 => cSharp.freq;
440 => a.freq;
493.883 => b.freq;
329.628 => e.freq;



while(true){    
    0 => cSharp.gain;
    0 => a.gain;
    0 => b.gain;
    .2 => e.gain;

    .5::second => now;
    
    0 => e.gain;
    .2 => b.gain;
    
    .5::second => now;
    
    0 => b.gain;
    .2 => cSharp.gain;
    
    .5::second => now;
    
    0 => cSharp.gain;
    .2 => a.gain;
    
    .5::second => now;
    0 => a.gain;
    .2::second => now;
}