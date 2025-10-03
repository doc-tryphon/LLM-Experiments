# Verification Standards

This document defines the quality, testing, and verification standards for the Quantum Computing Framework. Every protocol must meet these standards before being marked as "complete."

## Core Principles

### 1. Experimental Grounding
> "If it hasn't been observed in a lab or doesn't have an analytical solution, it doesn't belong in this codebase."

All protocols must be based on:
- Published experimental results in peer-reviewed journals, OR
- Rigorous analytical/mathematical proofs from established theory

**What we include**:
- Bell states (Aspect et al. 1982 experimental confirmation)
- Quantum teleportation (Bouwmeester et al. 1997 experimental demonstration)
- Protocols with complete mathematical derivations (Shor's algorithm, etc.)

**What we exclude**:
- Speculative physics without experimental backing
- Theoretical constructs not yet experimentally validated
- Hand-waved approximations without rigorous justification

### 2. Mathematical Rigor
> "Every equation must be derived symbolically before being coded numerically."

**Workflow**:
1. **SymPy Symbolic Derivation** - Define Hilbert space, operators, and states symbolically
2. **Analytical Verification** - Prove properties mathematically (unitarity, completeness, etc.)
3. **Numerical Implementation** - Translate to NumPy/QuTiP
4. **Verification** - Compare numerical results to symbolic (tolerance: 10⁻¹⁰)

**Example**: Before implementing Bell states numerically, we first prove symbolically:
```python
# SymPy symbolic verification
|Phi+⟩ = (|00⟩ + |11⟩)/√2
S = -Tr(ρ_A log₂ ρ_A) = ln(2)  # Proven symbolically
# Then verify numerical implementation matches
```

### 3. Comprehensive Testing
> "A protocol without 100% test coverage is a protocol we don't trust."

**Test Requirements**:
- **Unit tests**: Every function tested independently
- **Integration tests**: Full protocol end-to-end
- **Property tests**: Mathematical properties verified (unitarity, orthogonality, etc.)
- **Edge cases**: Boundary conditions and special cases
- **Regression tests**: Ensure changes don't break existing functionality

**Coverage Target**: 100% for all implemented code

### 4. Educational Value
> "Code should teach quantum mechanics, not just simulate it."

**Documentation Standards**:
- Clear docstrings with mathematical notation
- Explain *why* not just *what*
- Include physical interpretation
- Reference relevant papers and textbooks
- Provide learning assessment questions

**Code Clarity**:
- Self-documenting variable names
- Inline comments explaining physics
- Type hints for all functions
- Structured, readable implementations

### 5. Research Quality
> "Every line of code should be suitable for peer-reviewed publication."

**Publication Standards**:
- Citation of primary sources (original papers)
- Comparison to published benchmarks
- Clear statement of approximations
- Acknowledgment of limitations
- Reproducible results

---

## Verification Workflow

Every protocol follows this four-step workflow:

### Step 1: Symbolic Derivation (SymPy)

**Actions**:
1. Define Hilbert space symbolically
2. Define operators (gates, measurements)
3. Derive eigenstates and eigenvalues
4. Verify commutation relations
5. Check unitarity/hermiticity
6. Prove mathematical properties

**Output**: Symbolic verification report documenting all derivations

**Example** (Bell States):
```python
import sympy as sp
from sympy.physics.quantum import *

# Define symbolic Hilbert space
ket0 = Ket('0')
ket1 = Ket('1')

# Define Bell state symbolically
phi_plus = (TensorProduct(ket0, ket0) + TensorProduct(ket1, ket1)) / sp.sqrt(2)

# Prove entanglement entropy
# ... symbolic calculation ...
# Result: S = ln(2) exactly
```

### Step 2: Numerical Implementation

**Actions**:
1. Implement in NumPy/QuTiP
2. Use complex128 precision (machine epsilon ~10⁻¹⁶)
3. Test against symbolic results
4. Numerical tolerance: 10⁻¹⁰ (6 orders of magnitude below machine epsilon)

**Code Standards**:
```python
def compute_entanglement_entropy(state: np.ndarray) -> float:
    """
    Compute von Neumann entropy of reduced density matrix.
    
    S(ρ) = -Tr(ρ log₂ ρ)
    
    For maximally entangled 2-qubit state: S = ln(2) ≈ 0.693147
    
    Args:
        state: State vector of shape (4,) for 2-qubit system
        
    Returns:
        Entanglement entropy in bits
        
    References:
        Nielsen & Chuang (2010), Chapter 2
    """
    # Implementation with clear steps
    rho = partial_trace(state)
    eigenvalues = np.linalg.eigvalsh(rho)
    entropy = -np.sum(eigenvalues * np.log2(eigenvalues + 1e-15))
    
    # Verify against known value
    assert np.abs(entropy - np.log(2)) < 1e-10
    
    return entropy
```

### Step 3: Experimental Validation

**Actions**:
1. Compare to published experimental data
2. Document experimental evidence
3. Cite peer-reviewed sources
4. Understand experimental limitations
5. Acknowledge approximations

**Documentation Format**:
```markdown
## Experimental Evidence

### Key Experiments

1. **Author et al. (Year)**
   - *Paper Title*
   - Journal, Volume, Pages
   - Brief description of experiment
   - Measured values compared to theory
```

### Step 4: Comprehensive Testing

**Test Structure**:
```python
# tests/verification/test_protocol.py

class TestProtocol:
    """Comprehensive test suite for Protocol."""
    
    def test_basic_functionality(self):
        """Test basic protocol operation."""
        pass
    
    def test_mathematical_properties(self):
        """Verify unitarity, hermiticity, etc."""
        pass
    
    def test_edge_cases(self):
        """Test boundary conditions."""
        pass
    
    def test_against_known_results(self):
        """Compare to published benchmarks."""
        pass
    
    def test_error_handling(self):
        """Verify proper error handling."""
        pass
```

---

## Code Quality Standards

### Required

- **SymPy symbolic verification** before any numerical implementation
- **Test coverage**: 100% for each completed step
- **Docstrings**: All functions with mathematical notation and references
- **Type hints**: All function arguments and return values
- **Citations**: Published paper references for all protocols
- **No magic numbers**: All constants documented with sources

### Prohibited

- **Speculative physics** without experimental evidence
- **Equations without derivation**: Every equation must be symbolically derived
- **Numerical implementations without verification**: Must match symbolic results
- **Code without tests**: No untested code allowed
- **Unverified theoretical constructs**: No speculative wormhole physics, exotic matter, etc.

---

## File Structure Standards

### Implementation Files

Location: `src/quantum/`

Structure:
```python
"""Module docstring with overview."""

import numpy as np
import qutip as qt
from typing import ...

# Constants (with sources)
TOLERANCE = 1e-10  # Numerical comparison tolerance

class Protocol:
    """
    Protocol description with mathematical background.
    
    Mathematical formulation:
        |ψ⟩ = α|0⟩ + β|1⟩
    
    References:
        Author (Year), Journal, Volume, Pages
    """
    
    def __init__(self, ...):
        """Initialize protocol with parameters."""
        pass
    
    def method(self, ...) -> ReturnType:
        """
        Method description with math.
        
        Args:
            param: Description
            
        Returns:
            Description of return value
            
        Raises:
            Exception: When it occurs
        """
        pass
```

### Test Files

Location: `tests/verification/`

Structure:
```python
"""Comprehensive test suite for Protocol."""

import pytest
import numpy as np
from src.quantum.protocol import Protocol

class TestProtocol:
    """Test suite for Protocol class."""
    
    @pytest.fixture
    def protocol(self):
        """Create protocol instance for testing."""
        return Protocol()
    
    def test_known_result(self, protocol):
        """Test against analytically known result."""
        result = protocol.compute()
        expected = 0.693147  # ln(2) from symbolic derivation
        assert np.abs(result - expected) < 1e-10
```

### Documentation Files

Location: `quantum-protocols/`

Format: Markdown with LaTeX math

Structure:
```markdown
# Step N: Protocol Name

**Status**: Complete/Planned
**Tests**: X/X passing
**Implementation**: `src/quantum/file.py`

## Overview
Brief description

## Mathematical Formulation
Detailed math with derivations

## Experimental Evidence
Published experiments

## References
Cited papers
```

---

## Citation Standards

### Format

**In Code**:
```python
"""
References:
    Bennett et al. (1993), Phys. Rev. Lett. 70, 1895
    Nielsen & Chuang (2010), Chapter 2
"""
```

**In Documentation**:
```markdown
## References

1. **Bennett, C.H.; et al.** (1993). "Paper Title". 
   *Physical Review Letters* 70 (13): 1895–1899.
```

### Required Information

- Author(s)
- Year
- Paper title
- Journal name
- Volume and pages
- For textbooks: Chapter/section number

---

## Testing Standards

### Numerical Tolerance

**Standard Tolerance**: 10⁻¹⁰

**Justification**:
- Machine epsilon (float64): ~2.22 × 10⁻¹⁶
- Target: 6 orders of magnitude above machine epsilon
- Allows for accumulated rounding errors
- Tight enough to catch implementation bugs

**Usage**:
```python
TOLERANCE = 1e-10

def verify_result(computed, expected):
    assert np.abs(computed - expected) < TOLERANCE
```

### Test Coverage Requirements

**Minimum Coverage**: 100% for all implemented protocols

**What to Test**:
1. Basic functionality
2. Mathematical properties (unitarity, orthogonality, etc.)
3. Edge cases (zero states, maximally mixed states, etc.)
4. Known analytical results
5. Published benchmarks (when available)
6. Error handling

### Test Execution

```bash
# Run all tests
pytest tests/verification/ -v

# Run with coverage
pytest tests/verification/ --cov=src/quantum --cov-report=html

# Run specific test file
pytest tests/verification/test_protocol.py -v
```

---

## Prohibited Content

The following are **NEVER** allowed in this codebase:

### Speculative Physics

- Wormholes without experimental evidence
- Exotic matter without observation
- Traversable spacetime without verification
- Casimir energy wormhole stabilization
- Any unverified GR solutions

### Unverified Implementations

- Hand-coded equations without SymPy derivation
- Numerical implementations without symbolic verification
- Protocols without experimental or theoretical backing
- Magic numbers without source documentation
- Approximate formulas without error bounds

### Poor Code Quality

- Code without tests
- Functions without docstrings
- Functions without type hints
- Uncommented physics assumptions
- Non-descriptive variable names (in complex functions)

---

## Example: Full Verification Workflow

### Protocol: Bell States

**Step 1: Symbolic Derivation**
```python
# verify_bell_states.py (SymPy)
import sympy as sp
# ... symbolic derivation ...
# Prove: S = ln(2) for all Bell states
```

**Step 2: Numerical Implementation**
```python
# src/quantum/entanglement.py
class BellStateGenerator:
    def generate_phi_plus(self) -> np.ndarray:
        """Generate |Φ+⟩ = (|00⟩ + |11⟩)/√2"""
        # Implementation verified against symbolic
```

**Step 3: Testing**
```python
# tests/verification/test_bell_states.py
def test_entanglement_entropy():
    """Verify S = ln(2) for |Φ+⟩."""
    state = BellStateGenerator().generate_phi_plus()
    entropy = compute_entropy(state)
    assert np.abs(entropy - np.log(2)) < 1e-10
```

**Step 4: Documentation**
```markdown
# 01-bell-states.md
Entanglement entropy: S = ln(2) ≈ 0.693147
Verified experimentally: Aspect et al. (1982)
```

---

## Quality Checklist

Use this before marking any step as "complete":

### Before Implementation
- [ ] Read and understand referenced papers
- [ ] Symbolic derivation complete (SymPy)
- [ ] Verification report written
- [ ] Test cases designed from analytical solutions

### During Implementation
- [ ] Docstrings with mathematical notation
- [ ] Type hints for all functions
- [ ] Inline comments explaining physics
- [ ] Incremental implementation with tests

### After Implementation
- [ ] All tests passing (target count reached)
- [ ] 100% test coverage verified
- [ ] Code reviewed for clarity
- [ ] No magic numbers
- [ ] Documentation complete
- [ ] Git commit with descriptive message

### Verification
- [ ] Numerical matches symbolic (< 10⁻¹⁰)
- [ ] Edge cases tested
- [ ] Benchmarks compared (when available)
- [ ] Approximations documented
- [ ] Limitations acknowledged

---

## Revision History

- **Version 1.0** (2025-09-30): Initial standards document
- Established for Steps 1-5 completion
- To be updated as project evolves
