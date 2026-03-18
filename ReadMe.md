See [PiRC1: Pi Ecosystem Token Design](./PiRC1/ReadMe.md)
# Hybrid Token Launch Model for Pi Network

---

## 📌 Overview

This repository contains a **full proposal for a hybrid token launch model** within the Pi Network ecosystem.  

The model is designed to balance:

- 💧 **Liquidity Pools** — ensure market stability  
- 🔄 **Developer Incentives** — reward responsible project development  
- 🛡️ **Ecosystem Reserve** — protect the ecosystem and participants  
- ⚡ **On-chain Verified Pi Base transactions** — transparency and real activity  
- 🛠️ **Security & Penalty Framework** — reward suspension, slashing, reputation, and governance  

The goal is to create a **sustainable, transparent, and secure token economy** that encourages innovation while safeguarding participants.

---

## 🛠️ Features & Benefits

- **Transparent, fair, and data-driven token distribution**  
- **Milestone-based release for developers** to encourage long-term commitment  
- **Dynamic reserve redistribution** based on ecosystem growth and security  
- **Governance mechanisms** for token holders to vote on key decisions  
- **Clear visualizations** for all stakeholders using diagrams and charts  
- **On-chain profit verification layer** for transparency  
- **Security and accountability mechanisms** including:  
  - Reward suspension  
  - Slashing (minor, major, repeated)  
  - Permanent bans  
  - Reputation adjustment  
- **Detection Layer & Anti-Manipulation** for fair enforcement  
- **Base-Linked Pi + Verified Transactions** tracking  
- **Python Package** for example algorithms, ready for developers

---

## 📊 Token Allocation

| **Category**          | **Percentage** | **Purpose**                               |
|-----------------------|----------------|-------------------------------------------|
| 💧 Liquidity Pools     | 65%            | Market stability & token liquidity        |
| 🔄 Developers          | 20%            | Incentivize responsible development, milestone-based release |
| 🛡️ Ecosystem Reserve   | 15%            | Protect ecosystem, fund emergencies, gradually redistributed |

---

## 🔒 Security & Penalty Principles

### 1. Reputation & Penalties

- Reputation is **bounded between 0–100**  
- Decreases on penalties and gradually recovers over time  
- Weighted in reward calculations  

**Example:**  
```text
rewardMultiplier = reputation / 100
```
---

## 2. Violation Classification

| Type     | Criteria & Description |
|----------|----------------------|
| Minor    | score < X; low-impact or accidental behavior |
| Major    | X ≤ score < Y; high-impact or intentional manipulation |
| Repeated | N violations within T timeframe; triggers escalation |

**Parameters configurable:** X, Y, N, T.

---

## 3. Detection Layer & Anti-Manipulation

**Hybrid system:**

### On-Chain Signals
- Abnormal transaction frequency  
- Repeated micro-transactions  
- Suspicious allocation patterns  

### Off-Chain Analysis (Optional)
- Behavioral analysis engines  
- ML anomaly detection  
- Oracle-fed risk signals  

### Anti-Sybil Protection
- Identity linkage (KYC / trust graph)  
- Transaction clustering  
- Rate-limiting per participant  

**Note:** A violation is triggered only when **detection confidence exceeds threshold**.

---

## 4. Reward Suspension

- Preventive measure for **medium-risk participants**  
- Event logged: `RewardSuspended(participant, duration)`  
- Duration can be **fixed** or **dynamic** based on severity/confidence  
- Suspended rewards are **monitored**; if behavior improves → rewards resume  
- Escalation to slashing/ban occurs only if suspicious behavior continues

---

## 5. Slashing & Penalties

- Dynamic, recorded on-chain, ensures consistency  
- **Execution guarantees:** atomic operations, fail-safes, reentrancy protection  

**Example events:**  
```solidity
event AllocationReduced(address participant, uint256 amount);
event Slashed(address participant, uint256 percent);
event PermanentBan(address participant);
```
---
## 6. Governance & Appeals

- Governance review triggered when:  
  - Slashing > threshold (e.g., 20%)  
  - Permanent ban proposed  
  - Disputed penalties  

- **Voting rules:** quorum, majority/supermajority, time-bound window  

- **Appeals:** participants can request review; outcomes recorded on-chain:  
  - Penalty upheld  
  - Penalty reduced  
  - Full reversal

---

## 📈 How to Use

1. Review **proposal.md** for full explanation of the model  
2. Check **tokenomics.md** for detailed allocation numbers and redistribution formulas  
3. Explore **diagrams/** for visual representation of token flows  
4. Explore **architecture/** for system structure and flow  
5. Check **profit_verification/** for on-chain profit sources  
6. Check **security/** for penalties, slashing, and fraud detection logic  
7. Check **economic_model/** for detailed profit-based incentive logic  
8. Run **code_examples/** for sample computations of allocation, rewards, and reserve management  

---

## ✅ Notes

- All calculations reference **Pi Base**; USD is for display only  
- The system tracks **real verified transactions** and adjusts rewards dynamically  
- Python examples help developers test allocation, redistribution, and governance logic  
- All security and penalty mechanisms are **transaction-driven** and dynamic  
- Testing must be conducted in a **local/test environment** before mainnet launch
  
---
  
## 📂 FULL FOLDER STRUCTURE

```text
hybrid-token-model/
├── README.md                  ← Main README (updated with edits & notes)  
├── proposal.md                ← Full proposal for hybrid token model  
├── tokenomics.md              ← Detailed token allocation & redistribution formulas  
├── governance/                ← Governance & contribution tracking  
│   └── contribution_leaderboard.md (or similar)  
├── security/                  ← Security layer & penalties  
│   └── BaseLinkedPiWithPenalties.sol  
├── architecture/              ← System & governance flow diagrams  
│   └── governance_flow.md  
├── code_examples/             ← Example algorithms & Python pseudo-code  
│   └── README.md (enhanced)  
├── diagrams/                  ← Visual illustrations & reward distribution  
│   └── ecosystem_rewards.md  
├── docs/                      ← Documentation updates  
│   └── Security.md  
├── economic_model/            ← Economic & transaction multiplier logic  
│   └── economic_model.md  
├── hybrid-token-model/        ← Subfolder for hybrid token docs  
│   └── economic_model.md  
├── profit_verification/       ← On-chain profit verification  
│   └── ProfitDistributed event.md  
├── LICENSE  
├── ReadMe.md                  ← Added notes section  
├── implementation.md          ← Implementation notes & ideas
