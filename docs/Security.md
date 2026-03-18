# Security & Penalti Mechanisms – Pi Hybrid Token

## Overview
File ini menjelaskan **mekanisme keamanan dan penalti** dalam model token hybrid Pi Network, termasuk:

- Reward suspension  
- Allocation reduction  
- Slashing (minor → major → repeated violations)  
- Permanent ban  

Transparansi dan auditability dijaga dengan **event logging** dan governance review.

---

## 1. Reputation System & Penalties

### 1.1 Reputation Reduction Logic
- Saat `reduceAllocation` dijalankan:  
```text
repReduction = amount * 100 / piBalance[participant]
```
- ⚠️ Pastikan **piBalance tidak 0** setelah pengurangan untuk menghindari division by zero.  
- Urutan perhitungan:  
  1. Kurangi allocation  
  2. Update piBalance  
  3. Hitung repReduction  
- Tujuan: memberikan insentif untuk perilaku baik dan penalti adil.

### 1.2 Penalty Types
| Type | Description | Governance Involvement |
|------|------------|----------------------|
| Financial | Pengurangan token allocation | Owner / Multi-sig |
| Reputation | Pengurangan reputasi peserta | Owner / Multi-sig |
| Governance | Suspend hak voting sementara | Governance vote |
| Permanent Ban | Block peserta dari ekosistem | Governance vote berbasis trust/reputation |

---

## 2. Reward Suspension
- Suspend reward **tidak hanya emit event**, tapi menahan reward update dan transfer selama durasi tertentu.  
- Event: `RewardSuspended(participant, duration)`  
- Milestone-related logic: duration bisa dikaitkan dengan milestone release.

---

## 3. Slashing Mechanism
- **Dynamic & on-chain**, mencakup semua skala pelanggaran: minor → major → repeated violations.  
- Fungsi `slash(percent)` harus dicek agar tidak terjadi **underflow** atau unexpected behavior.  
- Pastikan `percent` valid dan **piBalance > 0** sebelum pengurangan.

---

## 4. Owner & Governance Security
- Fungsi kritikal (`slash`, `permanentBan`, `reduceAllocation`) awalnya owner-only.  
- Disarankan menggunakan **multi-sig / tim governance** untuk mengurangi risiko abuse.  
- Event logging memastikan transparansi:  
```solidity
event AllocationReduced(address participant, uint256 amount);
event Slashed(address participant, uint256 percent);
event PermanentBan(address participant);
```

---

## 5. Audit & Transparency
- Semua perubahan dicatat **on-chain** dan dapat di-query via API:  
  - RewardSuspended  
  - AllocationReduced  
  - Slashed  
  - PermanentBan  
- Memudahkan komunitas dan auditor untuk memastikan fairness.

---

## 6. Gas Optimization
- `calculateValue` dan update `piBalance` per transaksi mahal untuk skala besar.  
- Solusi:  
  - **Batch processing**  
  - **Off-chain computation** untuk simulasinya, update on-chain hanya final state.

---

## 7. Boundary Checks & Edge Cases
- 0 balance → reward atau slashing harus tidak crash  
- 100% slash → peserta benar-benar dihentikan dari reward  
- Suspend reward duration → harus dikontrol sesuai milestone

---

## 8. Unit Tests & Simulation
- Direkomendasikan menambahkan unit tests:  
  - Semua tipe penalti diuji  
  - Semua level pelanggaran diuji  
  - Simulasi random participant behavior untuk stress test  
- Membantu developer dan auditor memastikan keamanan logika.

---

## 9. Notes
- Semua mekanisme **dynamic** berdasarkan verified transactions.  
- Reward update, slashing, dan penalti harus **selalu diuji di testing environment** sebelum mainnet.  
- Integrasi dengan README dan BaseLinkedPiWithPenalties smart contract wajib untuk konsistensi dokumentasi.
