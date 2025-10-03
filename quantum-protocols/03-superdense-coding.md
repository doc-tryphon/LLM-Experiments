# Step 3: Superdense Coding

**Status**: Complete ✓  
**Tests**: 27/27 passing  
**Implementation**: `src/quantum/superdense_coding.py`  
**Test Suite**: `tests/verification/test_superdense_coding.py`

## Overview

Superdense coding (also called dense coding) is a quantum communication protocol that allows transmission of 2 classical bits of information by sending only 1 qubit, using a pre-shared entangled state. It is the dual protocol to quantum teleportation.

## Mathematical Results Verified

All results verified to numerical tolerance 10⁻¹⁰:

1. **Information Capacity**: Exactly 2 classical bits per qubit sent
2. **All Messages Decoded**: '00', '01', '10', '11' correctly encoded and decoded
3. **Orthogonality**: All 4 encoded states mutually orthogonal
4. **Enhancement Factor**: 2× over classical channel (classical sends 1 bit per qubit)
5. **Duality with Teleportation**: Resource usage is inverse of teleportation
6. **Perfect Fidelity**: F = 1.0 for all message transmissions

## Protocol Description

### Superdense Coding Protocol (Bennett & Wiesner 1992)

**Goal**: Alice wants to send 2 classical bits to Bob using 1 qubit

**Resources**:
- Alice and Bob share entangled pair |Φ⁺⟩ = (|00⟩ + |11⟩)/√2
- Alice keeps qubit A, Bob keeps qubit B
- Quantum communication channel (1 qubit from Alice to Bob)

**Steps**:

1. **Alice encodes her 2-bit message** by applying a gate to her qubit:
   ```
   Message '00' → Apply I  → |Φ⁺⟩ = (|00⟩ + |11⟩)/√2
   Message '01' → Apply Z  → |Φ⁻⟩ = (|00⟩ - |11⟩)/√2
   Message '10' → Apply X  → |Ψ⁺⟩ = (|01⟩ + |10⟩)/√2
   Message '11' → Apply XZ → |Ψ⁻⟩ = (|01⟩ - |10⟩)/√2
   ```

2. **Alice sends her qubit to Bob** (1 qubit transmission)

3. **Bob performs Bell measurement** on both qubits (his original qubit + Alice's qubit)

4. **Bob decodes the message** from his measurement outcome:
   ```
   Measure |Φ⁺⟩ → Message was '00'
   Measure |Φ⁻⟩ → Message was '01'
   Measure |Ψ⁺⟩ → Message was '10'
   Measure |Ψ⁻⟩ → Message was '11'
   ```

## Mathematical Analysis

### Encoding Transformations

Starting from shared Bell state |Φ⁺⟩ = (|00⟩ + |11⟩)/√2:

**Message '00' - Apply I (Identity)**:
```
I ⊗ I |Φ⁺⟩ = (|00⟩ + |11⟩)/√2 = |Φ⁺⟩
```

**Message '01' - Apply Z (Phase Flip)**:
```
Z ⊗ I |Φ⁺⟩ = (|00⟩ - |11⟩)/√2 = |Φ⁻⟩
```

**Message '10' - Apply X (Bit Flip)**:
```
X ⊗ I |Φ⁺⟩ = (|01⟩ + |10⟩)/√2 = |Ψ⁺⟩
```

**Message '11' - Apply XZ (Both Flips)**:
```
XZ ⊗ I |Φ⁺⟩ = (|01⟩ - |10⟩)/√2 = |Ψ⁻⟩
```

### Orthogonality of Encoded States

The four Bell states are mutually orthogonal:
```
⟨Φ⁺|Φ⁻⟩ = 0
⟨Φ⁺|Ψ⁺⟩ = 0
⟨Φ⁺|Ψ⁻⟩ = 0
⟨Φ⁻|Ψ⁺⟩ = 0
⟨Φ⁻|Ψ⁻⟩ = 0
⟨Ψ⁺|Ψ⁻⟩ = 0
```

This orthogonality guarantees perfect distinguishability via Bell measurement.

## Information Theory Analysis

### Classical Channel Capacity
For a classical channel sending individual qubits:
- Can encode: 1 bit per qubit (|0⟩ for '0', |1⟩ for '1')
- Channel capacity: 1 bit/qubit

### Superdense Coding Capacity
With pre-shared entanglement:
- Can encode: 2 bits per qubit sent
- Channel capacity: 2 bits/qubit
- **Enhancement factor: 2×**

### Resource Comparison

**Superdense Coding**:
- 1 ebit (pre-shared entanglement) + 1 qubit sent → 2 classical bits

**Quantum Teleportation** (dual protocol):
- 1 ebit + 2 classical bits sent → 1 qubit transmitted

Notice the duality:
```
Superdense:     1 ebit + 1 qubit → 2 cbits
Teleportation:  1 ebit + 2 cbits → 1 qubit
```

## Experimental Verification

### Key Experiments

1. **Mattle et al. (1996)**
   - *Dense Coding in Experimental Quantum Communication*
   - Physical Review Letters 76, 4656-4659
   - First experimental demonstration using photons

2. **Li et al. (2002)**
   - *Quantum dense coding exploiting a bright Einstein-Podolsky-Rosen beam*
   - Physical Review Letters 88, 047904
   - Continuous-variable implementation

3. **Schaetz et al. (2004)**
   - *Enhanced quantum communication using trapped ions*
   - Physical Review Letters 93, 040505
   - Ion trap implementation

## Key Features Implemented

1. **SuperdenseCoding class**: Manages complete protocol
2. **Encode method**: Applies appropriate gate based on message
3. **Decode method**: Performs Bell measurement to recover message
4. **Entanglement resource sharing**: Simulates pre-shared Bell pair
5. **SuperdenseCodingResult dataclass**: Tracks all protocol data
6. **Orthogonality verification**: Confirms mutual orthogonality of all encoded states

## Applications

1. **Quantum Communication**: Efficient transmission of classical information
2. **Quantum Networking**: Bandwidth amplification using entanglement
3. **Distributed Quantum Computing**: Communication between quantum processors
4. **Quantum Cryptography**: Authenticated communication protocols

## Educational Insights

### Why Exactly 2 Bits?

The pre-shared entangled pair provides a 4-dimensional Hilbert space (2 qubits = 4 basis states). Alice can transform this into any of the 4 orthogonal Bell states by local operations on her qubit. This gives log₂(4) = 2 bits of information capacity.

We cannot exceed 2 bits because:
- Alice has local access to only 1 qubit (2-dimensional space)
- 2 classical operations (bit flip, phase flip) can create 2² = 4 distinct orthogonal states

### Holevo Bound

The protocol saturates the Holevo bound for this scenario. The Holevo bound states that n qubits can transmit at most 2n classical bits of accessible information. With n=1 qubit sent (plus pre-shared entanglement), we achieve exactly 2 bits.

### Comparison to Classical Dense Coding

Classically, you cannot do better than 1 bit per transmitted bit. The key difference:

**Classical**: Alice's encoding affects only her bit  
**Quantum**: Alice's encoding affects the global entangled state

This is a manifestation of **quantum nonlocality** - local operations by Alice instantaneously affect the global state shared with Bob.

### Duality with Teleportation

Superdense coding and quantum teleportation are dual protocols:

| Protocol | Input | Pre-shared | Transmitted | Output |
|----------|-------|------------|-------------|--------|
| Superdense | 2 cbits | 1 ebit | 1 qubit | - |
| Teleportation | 1 qubit | 1 ebit | 2 cbits | 1 qubit |

This duality reflects a fundamental symmetry in quantum information theory.

## Test Coverage

All 27 tests verify:
- Correct Bell state initialization
- All 4 encoding operations (I, Z, X, XZ)
- Bell measurement implementation
- All 4 messages correctly decoded ('00', '01', '10', '11')
- Perfect fidelity for all message transmissions
- Mutual orthogonality of all encoded states
- Enhancement factor calculation (2× classical)
- Entanglement resource tracking
- State vector transformations
- Density matrix evolution

**Status**: 27/27 passing (100% coverage)

## References

1. **Bennett, C.H. & Wiesner, S.J.** (1992). "Communication via one- and two-particle operators on Einstein-Podolsky-Rosen states". *Physical Review Letters* 69 (20): 2881–2884.

2. **Mattle, K.; Weinfurter, H.; Kwiat, P.G.; Zeilinger, A.** (1996). "Dense Coding in Experimental Quantum Communication". *Physical Review Letters* 76 (25): 4656–4659.

3. **Nielsen, M.A. & Chuang, I.L.** (2010). *Quantum Computation and Quantum Information*, 10th Anniversary Edition. Cambridge University Press. Chapter 2.3.
