# LLM-Experiments

**A collection of AI-assisted research, educational projects, and creative experiments**

This repository documents my learning journey and experiments with Large Language Models (LLMs), focusing on rigorous implementation of computer science concepts, quantum computing protocols, and creative applications.

---

## Project Timeline

### The Journey

**~2015**: [Hello World](hello-world/) - First program (symbolic starting point)  
**2015-2024**: Dormant period - programming knowledge dormant  
**September 2025**: Return to CS with quantum computing focus  
**September 30, 2025**: Phase 1 Quantum Protocols complete (170 tests passing)  
**October 3, 2025**: LLM-Experiments repository launched with Git infrastructure  
**Current**: Working toward Step 6 (Shor's 9-Qubit Code)

### Future Milestones

**Phase 2** (Q4 2025): Advanced error correction (Steps 6-9)  
**Phase 3** (Q1 2026): Quantum algorithms (Grover, Deutsch-Jozsa, Phase Estimation)  
**Phase 4** (Q2 2026): Surface codes and VQE  
**Long-term**: Complete 15-step quantum framework, expand to AI implementations

---

## Repository Contents

### 1. Quantum Computing Framework

**Location**: [`quantum-protocols/`](quantum-protocols/)

A research-grade implementation of experimentally verified quantum computing protocols. This is a serious educational project following rigorous verification standards:

- **Status**: Phase 1 Complete (5/15 steps)
- **Test Coverage**: 170/170 tests passing (100%)
- **Approach**: SymPy symbolic verification → Numerical implementation → Comprehensive testing

**Completed Protocols**:
1. [Bell States & Entanglement](quantum-protocols/01-bell-states.md) - Experimentally verified quantum correlations
2. [Quantum Teleportation](quantum-protocols/02-quantum-teleportation.md) - Quantum state transfer protocol
3. [Superdense Coding](quantum-protocols/03-superdense-coding.md) - Efficient quantum communication
4. [Quantum Decoherence](quantum-protocols/04-quantum-decoherence.md) - Noise modeling in quantum systems
5. [Quantum Error Correction](quantum-protocols/05-quantum-error-correction.md) - 3-qubit bit flip code

**Documentation**:
- [Complete Roadmap](quantum-protocols/ROADMAP.md) - All 15 planned steps
- [Verification Standards](quantum-protocols/VERIFICATION-STANDARDS.md) - Quality requirements

**Key Principles**:
- Only experimentally verified protocols
- Symbolic mathematical verification before implementation
- 100% test coverage requirement
- Research-grade code quality
- No speculation - only proven physics

### 2. AI Training & Development Guides

**Location**: `AI project outlines folder/`

Documentation and guides for training AI systems and understanding machine learning fundamentals.

### 3. Creative Writing Projects

**Location**: `creative writing/`

Experiments testing LLM creative writing capabilities, including:
- Science fiction narratives (Halo universe)
- Scenario planning documents
- Disaster relief operation templates

---

## Project Philosophy

### Educational Focus

This repository emphasizes **learning through rigorous implementation**:
- Deep understanding over surface-level code
- Mathematical derivations before numerical implementations
- Comprehensive testing to verify understanding
- Clear documentation for future reference

### Intellectual Honesty

As a day-one Computer Science student, this repository prioritizes:
- Acknowledging what I don't know
- Verifying claims against authoritative sources
- Building foundations before advanced topics
- Learning from mistakes and iterations

### Version Control as Learning Tool

This repository serves as:
- A record of learning progression
- A portfolio of completed projects
- A reference for future coursework
- An accountability system for quality standards

---

## Using This Repository

### Converting LLM Output to Markdown

When creating `.md` files from LLM conversations:

```
convert this text to a .md file for publishing on github, 
format it in a way that maintains the original formatting style, 
i.e breaks and spacing:
```

### Quality Standards

For projects marked as "research-grade" (like quantum protocols):
- All code is tested and verified
- All equations are symbolically derived
- All claims are cited with peer-reviewed sources
- No speculative or unverified content

For experimental/creative projects:
- Marked clearly as exploratory
- Learning outcomes documented
- Iterations and improvements tracked

---

## Repository Structure

```
LLM-Experiments/
├── quantum-protocols/              # Verified quantum computing protocols
│   ├── README.md                  # Project overview
│   ├── 01-bell-states.md          # Protocol documentation
│   ├── 02-quantum-teleportation.md
│   ├── 03-superdense-coding.md
│   ├── 04-quantum-decoherence.md
│   ├── 05-quantum-error-correction.md
│   ├── ROADMAP.md                 # Complete 15-step plan
│   └── VERIFICATION-STANDARDS.md  # Quality requirements
│
├── AI project outlines folder/    # AI training documentation
│   ├── AI training folder/
│   └── Brain Computer Interface folder/
│
└── creative writing/              # Creative experiments
    ├── Halo-short-story-folder/
    └── Disaster-relief-tools-folder/
```

---

## Project Timeline

### Symbolic Starting Point
**~2015**: First Hello World  
**Status**: Preserved in [`hello-world/`](hello-world/) as time capsule

*"Every programmer's journey starts here. This folder honors that first moment."*

### Quantum Computing Framework

**Phase 1: Foundations** ✅ (Complete - September 30, 2025)
- Step 1: Bell States & Entanglement (15 tests)
- Step 2: Quantum Teleportation (20 tests)
- Step 3: Superdense Coding (27 tests)
- Step 4: Quantum Decoherence (28 tests)
- Step 5: Quantum Error Correction (80 tests)
- **Total**: 170/170 tests passing (100%)

**Phase 2: Advanced Protocols** 🔄 (In Progress)
- Step 6: Shor's 9-Qubit Code (next)
- Step 7: Steane 7-Qubit Code
- Step 8: Quantum Key Distribution (BB84)
- Step 9: Entanglement Distillation

**Phase 3: Quantum Algorithms** 📋 (Planned)
- Step 10: Deutsch-Jozsa Algorithm
- Step 11: Grover's Search
- Step 12: Quantum Phase Estimation

**Phase 4: Advanced Topics** 📋 (Planned)
- Step 13: Surface Codes
- Step 14: Variational Quantum Eigensolver
- Step 15: Measurement-Based Quantum Computing

### Infrastructure Milestones

**October 3, 2025**: Git Infrastructure Deployment
- Dual-remote setup (Local Gitea + GitHub)
- SSH authentication configured
- Repository synchronized across 3 environments
- Documentation framework established

*See [Project Night documentation](https://www.notion.so/281e8586e4a2811f9654c9a0c04440a9) for complete details*

---

## Future Work

### Quantum Protocols
- **Next**: Step 6 - Shor's 9-Qubit Code (protecting against all single-qubit errors)
- **Phase 2**: Advanced error correction and quantum cryptography
- **Phase 3**: Quantum algorithms (Grover, Deutsch-Jozsa, Phase Estimation)
- **Phase 4**: Surface codes and variational quantum eigensolver

### CS Curriculum Alignment
As I progress through my Computer Science degree, this repository will expand to include:
- Data structures implementations
- Algorithm analysis
- Systems programming projects
- Machine learning applications
- Software engineering best practices

---

## Contact & Collaboration

This is a personal learning repository. All implementations are for educational purposes and based on published scientific literature.

**Academic References**: All quantum protocols cite peer-reviewed papers and textbooks:
- Nielsen & Chuang (2010) - *Quantum Computation and Quantum Information*
- Preskill (1998) - *Lecture Notes on Quantum Computation*
- Various peer-reviewed journal articles (see individual protocol docs)

---

## License

Educational and research project. All quantum protocol implementations are based on published, peer-reviewed scientific literature.

## Version

- Repository created: 2025
- Quantum protocols Phase 1 completed: September 30, 2025
- Last updated: October 3, 2025
