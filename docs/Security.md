# Security & Penalty Mechanisms – Pi Hybrid Token

## Overview
This file explains the **security and penalty mechanisms** in the Pi Network Hybrid Token model, including:

- Reward suspension  
- Allocation reduction  
- Slashing (minor → major → repeated violations)  
- Permanent ban  

Transparency and auditability are maintained with **event logging** and governance review.

---

## 1. Reputation System & Penalties

### 1.1 Reputation Reduction Logic
- When `reduceAllocation` is executed:  
```text
repReduction = amount * 100 / piBalance[participant]
```
- ⚠️ Ensure **piBalance is not 0** after deduction to avoid division by zero.  
- Calculation order:  
  1. Reduce allocation  
  2. Update piBalance  
  3. Calculate repReduction  
- Purpose: incentivize good behavior and enforce fair penalties.

### 1.2 Penalty Types
| Type | Description | Governance Involvement |
|------|------------|----------------------|
| Financial | Reduce token allocation | Owner / Multi-sig |
| Reputation | Reduce participant reputation | Owner / Multi-sig |
| Governance | Temporarily suspend voting rights | Governance vote |
| Permanent Ban | Block participant from ecosystem | Governance vote based on trust/reputation |

---

## 2. Reward Suspension
- Reward suspension **does not only emit an event**, but halts reward updates and transfers for a specific duration.  
- Event: `RewardSuspended(participant, duration)`  
- Milestone logic: duration can be linked to milestone release.

---

## 3. Slashing Mechanism
- **Dynamic & on-chain**, covering all violation levels: minor → major → repeated violations.  
- Function `slash(percent)` must be checked to prevent **underflow** or unexpected behavior.  
- Ensure `percent` is valid and **piBalance > 0** before deduction.

---

## 4. Owner & Governance Security
- Critical functions (`slash`, `permanentBan`, `reduceAllocation`) are owner-only by default.  
- Recommended: use **multi-sig / governance team** to reduce abuse risk.  
- Event logging ensures transparency:  
```solidity
event AllocationReduced(address participant, uint256 amount);
event Slashed(address participant, uint256 percent);
event PermanentBan(address participant);
```

---

## 5. Audit & Transparency
- All changes are **on-chain** and queryable via API:  
  - RewardSuspended  
  - AllocationReduced  
  - Slashed  
  - PermanentBan  
- Helps the community and auditors ensure fairness.

---

## 6. Gas Optimization
- `calculateValue` and updating `piBalance` per transaction is expensive at large scale.  
- Solutions:  
  - **Batch processing**  
  - **Off-chain computation** for simulations, only final state updated on-chain.

---

## 7. Boundary Checks & Edge Cases
- 0 balance → reward or slashing must **not crash**  
- 100% slash → participant fully stopped from receiving rewards  
- Suspend reward duration → must be controlled according to milestones

---

## 8. Unit Tests & Simulation
- Recommended to add unit tests:  
  - Test all penalty types  
  - Test all violation levels  
  - Simulate random participant behavior for stress testing  
- Helps developers and auditors verify logic security.

---

## 9. Notes
- All mechanisms are **dynamic**, based on verified transactions.  
- Reward updates, slashing, and penalties should **always be tested in a local/testing environment** before mainnet deployment.  
- Integration with README and BaseLinkedPiWithPenalties smart contract is required for consistent documentation.
