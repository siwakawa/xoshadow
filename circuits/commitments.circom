pragma circom 2.0.0;

template CommitmentProof() {
    // Inputs: balance and randomness are private inputs
    signal private input balance;  // The value to be committed
    signal private input randomness;  // The randomness used in the commitment

    // Output: the resulting commitment
    signal output commitment;

    // Constants for the generators g and h (in practice, choose securely)
    var g = 2;
    var h = 3;

    // Calculate the Pedersen commitment: C = g^balance * h^randomness
    // In circom, we use the addition of logs: log_g(C) = balance + randomness * log_h(g)
    commitment <== g ** balance * h ** randomness;
}

component main = CommitmentProof();
